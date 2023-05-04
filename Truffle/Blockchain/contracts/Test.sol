// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Test {
    address lastDepositAdress;
    string public greet = "Hello World";

    function setLastDepositAdress() public {
        lastDepositAdress = msg.sender;
    }

    function getLastDepositAdress() public view returns (address) {
        return lastDepositAdress;
    }

    function maFonction(string memory newGreet) public returns (string memory) {
        string memory greetToUpdate = newGreet;
        greet = greetToUpdate;
        return greetToUpdate;
    }

    function maFonctionAvecStorage() public returns (string memory) {
        string storage greetToUpdate = greet;
        greet = "Hi";
        return greetToUpdate;
    }
}