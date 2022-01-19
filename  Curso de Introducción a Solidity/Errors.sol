// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Modificadores {

    address private owner;

    constructor (){
        owner = msg.sender;
    }

    modifier isOwner (){
        require(msg.sender == owner, "El usuario no es el creador del contracto");
        _;
    }

    function suma (uint numero1, uint numero2) public view isOwner() 
    returns (uint){
        return numero1 + numero2;
    }
}