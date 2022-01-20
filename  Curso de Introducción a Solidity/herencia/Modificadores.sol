// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Modificadores {

    address private owner;
    string private nombreOwner;

    constructor (string memory nombre){
        owner = msg.sender;
        nombreOwner = nombre;
    }

    modifier isOwner (){
        if (msg.sender != owner) revert();
        _;
    }

    function suma (uint numero1, uint numero2) public view isOwner() 
    returns (uint){
        return numero1 + numero2;
    }
}