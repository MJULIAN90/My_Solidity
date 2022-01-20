// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import './Modificadores.sol';
import './Interface.sol';


// si del contracto Modificadores el constructor tiene datos y sabemos cual 
// viene podemos agregarlo aca
//contract Herencia is Suma, Modificadores('Julian'){

contract Herencia is Suma, Modificadores{

    constructor (string memory nombreNuevo) Modificadores(nombreNuevo){
        
    }

    // esta funcion es view ya que revisamos el estado del contracto anterior para el isOwner
    function sumar (uint numero1, uint numero2) public override view isOwner() returns (uint){
        return numero1 + numero2;
    }
}

