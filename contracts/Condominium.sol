// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

// Teste

contract Condominium {

    address public manager; //Ownable
    mapping(uint16 => bool) public residences; // unidade => true/false
    mapping(address => uint16) public residents; // wallet => unidade (1101 - 2505)
    mapping(address => bool) public counselors; // conselheiro => true/false

    constructor() {

        manager = msg.sender;
        
        // Blocos
        for (uint8 i=1; i <= 2; i++) {
            // Andares
            for (uint8 j=1; j <= 5; j++) {
                // Unidades
                for (uint8 k=1; k <= 5; k++) {
                    unchecked {
                        residences[(i * 1000) + (j * 100) + k] = true;
                    }
                }
            }
        }
    }

    modifier onlyManager() {
        require(msg.sender == manager, "Only the manager can do this");
        _;
    }

    modifier onlyCouncil() {
        require(msg.sender == manager || counselors[msg.sender], "Only the manager or the council can do this");
        _;
    }

    modifier onlyResidents() {
        require(msg.sender == manager || isResident(msg.sender), "Only the manager or the residents can do this");
        _;
    }

    function residenceExists(uint16 residenceId) public view returns (bool) {
        return residences[residenceId];
    }

    function isResident(address resident) public view returns (bool) {
        return residents[resident] > 0;
    }

}
