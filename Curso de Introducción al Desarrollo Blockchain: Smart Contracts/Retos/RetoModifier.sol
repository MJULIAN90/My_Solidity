// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract CrowdFunding {
    string public id;
    string public name;
    string public description;
    address payable public author;
    string public state = 'Opened';
    uint public funds;
    uint public fundraisingGoal;

    constructor(string memory _id, string memory _name, string memory _description, uint _fundraisingGoal){
        id = _id;
        name = _name;
        description = _description;
        fundraisingGoal = _fundraisingGoal;
        author = payable(msg.sender);
    }

    modifier sendProject() {
        require(
            author != msg.sender,
            "author does not send money"
        );
        _;
    }

    function fundProject() public payable sendProject {
        author.transfer(msg.value);
        funds +=msg.value;
    }

    modifier stateProject() {
        require(
            author == msg.sender,
            "Only author can change the state"
        );
        _;
    }

    function changeProjectState(string calldata newState) public stateProject{
        state = newState;
    }
}