// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract CrowdFunding {

    enum State {Closed , Open}

    struct Params{
        string id;
        string name;
        string description;
        address payable author;
        State state;
        uint funds;
        uint fundraisingGoal;
    }

    Params public Proyect;

    constructor(string memory _id, string memory _name, string memory _description, uint _fundraisingGoal){
        Proyect = Params(_id, _name, _description, payable(msg.sender), State.Open, 0, _fundraisingGoal);
    }

    modifier sendProject() {
        require(
            Proyect.author != msg.sender,
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
            Proyect.state != State.Closed,
            "smart contract closed"
        );

        require(
            msg.value != 0,
            "invalid quantity"
        );

        Proyect.author.transfer(msg.value);
        Proyect.funds += msg.value;

        emit MoneyRecieveEvent(msg.sender, msg.value);
    }

    event ChangeStatusEvent(
        State newvalue
    );

    modifier stateProject() {
        require(
            Proyect.author == msg.sender,
            "Only author can change the state"
        );
        _;
    }

    function changeProjectState(State newState) public stateProject{
        require(
            newState != State.Closed,
            "invalid state"
        );

        Proyect.state = newState;

        emit ChangeStatusEvent(newState);
    }
}