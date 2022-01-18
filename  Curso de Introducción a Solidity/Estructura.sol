//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Estructura {

    int cantidad;
    uint cantidadSinSigno;
    address direccion;
    bool firmado;


    constructor( bool isFirmado){
        direccion= msg.sender;
        firmado = isFirmado;

    }
}