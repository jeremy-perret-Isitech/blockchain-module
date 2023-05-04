// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "../@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "../@openzeppelin/contracts/security/Pausable.sol";
import "../@openzeppelin/contracts/access/Ownable.sol";


contract JeremyToken {
    uint test = 23;
    constructor() payable {}

    function convertDevice(uint amount) public view returns (uint) 
    {
        return amount * test;
    }
}

