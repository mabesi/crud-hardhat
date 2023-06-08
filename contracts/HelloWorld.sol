// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

// Teste

contract HelloWorld {

    string public message;

    constructor() {
        message = "Hello World";
    }

    function setMessage(string memory newMessage) public {
        message = newMessage;
    }
}
