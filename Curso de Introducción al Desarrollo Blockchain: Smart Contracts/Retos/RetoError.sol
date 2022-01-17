// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract CrowdFunding {
    string public id;
    string public name;
    string public description;
    address payable public author;
    uint public state;
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

    event MoneyRecieveEvent(
        address userDonator,
        uint quantityFunds
    );

    function fundProject() public payable sendProject {
        require(
            state != 0,
            "smart contract closed"
        );

        require(
            msg.value != 0,
            "invalid quantity"
        );

        author.transfer(msg.value);
        funds += msg.value;

        emit MoneyRecieveEvent(msg.sender, msg.value);
    }

    event ChangeStatusEvent(
        uint newvalue
    );

    modifier stateProject() {
        require(
            author == msg.sender,
            "Only author can change the state"
        );
        _;
    }

    function changeProjectState(uint newState) public stateProject{
        require(
            newState != state,
            "invalid state"
        );

        state = newState;

        emit ChangeStatusEvent(newState);
    }
}