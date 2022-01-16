// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;

//el pure nos sirve para no generar el warning que nos arroja sin el

contract Number {
    function getNumber () public pure returns (int number){
        number = 1948;
    }

    function changeNumber () public pure returns (int number){
        number = getNumber() * -1;
    }
}

