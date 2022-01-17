// SPDX-License-Identifier: GPL-3.0

// para poder acceder a una variable global del contracto siempre debemos tener la function view 
// string siempre va a pedir memory

pragma solidity >=0.7.0 < 0.9.0;

contract Reto1 {
    string name = 'julian';
    int edad= 30;
     int number1 = 5;

    

    function fundProject (address payable receiver) public payable {
        receiver.transfer(msg.value);
    }


    function changeProjectState (int newName) public pure returns(int nameCompleted){
        nameCompleted = newName;
    }


    function prueba (string memory numero) public pure returns (string memory total){
        total = numero;
    }

    function prueba2 (int a , int b) public pure returns (int suma){
        suma = a + b;
    } 


    function changeState(int number) public returns (int number2) {
         number1 = 6;
        number2 = number + number1;
    }

}