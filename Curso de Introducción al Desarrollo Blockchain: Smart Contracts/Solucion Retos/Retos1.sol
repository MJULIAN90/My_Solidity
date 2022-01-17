// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;

contract CrowFunding {

    string public id;
    string public name;
    string public description;
    address payable public author;
    string public state = 'Opened';
    uint public funds;
    uint public fundraIsInGoal;

    constructor (string memory _id, string memory _name, string memory _description, uint _fundraIsInGoal){
        id= _id;
        name = _name;
        description = _description;
        fundraIsInGoal = _fundraIsInGoal;
        author = payable(msg.sender);
    }

    function fundProject () public payable {
        author.transfer(msg.value);
        funds +=msg.value;
    }

    function changeProjectState (string calldata newState) public {
        state = newState;
    }
}