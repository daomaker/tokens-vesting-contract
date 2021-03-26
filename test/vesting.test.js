const {
  expect
} = require("chai");
const {
  BN, // Big Number support
  constants, // Common constants, like the zero address and largest integers
  expectEvent, // Assertions for emitted events
  expectRevert, // Assertions for transactions that should fail
  time,
} = require("@openzeppelin/test-helpers");

describe("Vesting testing", function() {
  let deployer, beneficiary

  it("Deploys Vesting contract", async () => {
    [deployer, beneficiary] = await ethers.getSigners();

    this.token = await deployContract("ERC20Mock", [deployer.address])
    this.vesting = await deployContract("TokensVesting", [
      this.token.address,
      beneficiary.address,
      (parseInt(await time.latest()) + 100).toString(), // Start after 100 seconds
      '100', // Cliff 100 seconds
      time.duration.weeks('10').toString(), // Releases delay
      '4',  // Releases count
    ])

    await this.token.transfer(this.vesting.address, ethers.utils.parseEther("100"))
  })

  it("Vesting full flow test", async () => {
    let beneficiaryBalance = await this.token.balanceOf(beneficiary.address)
    expect(beneficiaryBalance).to.equal(ethers.utils.parseEther("0"))

    let vestingBalance = await this.token.balanceOf(this.vesting.address)
    expect(vestingBalance).to.equal(ethers.utils.parseEther("100"))

    // Try to claim should be failed
    await expectRevert(this.vesting.release(), "release: No tokens are due!")

    // Increase to first release
    await time.increase(parseInt(time.duration.weeks('11')))


    await this.vesting.connect(beneficiary).release()

    beneficiaryBalance = await this.token.balanceOf(beneficiary.address)
    expect(beneficiaryBalance).to.equal(ethers.utils.parseEther("25"))

    vestingBalance = await this.token.balanceOf(this.vesting.address)
    expect(vestingBalance).to.equal(ethers.utils.parseEther("75"))


    // Increase to last release
    await time.increase(parseInt(time.duration.weeks('110')))

    await this.vesting.connect(beneficiary).release()

    beneficiaryBalance = await this.token.balanceOf(beneficiary.address)
    expect(beneficiaryBalance).to.equal(ethers.utils.parseEther("100"))

    vestingBalance = await this.token.balanceOf(this.vesting.address)
    expect(vestingBalance).to.equal(ethers.utils.parseEther("0"))
  });
});

const deployContract = async (name, args) => {
  const factory = await ethers.getContractFactory(name)
  const ctr = await factory.deploy(...(args || []))
  await ctr.deployed()

  return ctr
}