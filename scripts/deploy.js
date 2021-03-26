async function main() {
  const token =         '';
  const beneficiary =   '';
  const start =         '';
  const cliff =         '';
  const releasePeriod = '';
  const releaseCount =  '';

  console.log("Starting deployment ...");
  const vesting = await deployContract("TokensVesting", [token, beneficiary, start, cliff, releasePeriod, releaseCount])
  console.log("Vesting contract deployed:", vesting.address)
}


const deployContract = async (name, args) => {
  const factory = await ethers.getContractFactory(name)
  const ctr = await factory.deploy(...(args || []))
  await ctr.deployed()

  return ctr
}


// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
