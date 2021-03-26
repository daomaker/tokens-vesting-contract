// SPDX-License-Identifier: Unlicensed
pragma solidity 0.7.3;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract ERC20Mock is ERC20 {
  constructor (address receiver) public ERC20("Mock Token", "MT") {
    _mint(receiver,  100000000000 ether);
  }

  function mint(address account, uint256 amount) public {
    _mint(account, amount);
  }

  function burn(uint256 amount) public {
    _burn(msg.sender, amount);
  }
}