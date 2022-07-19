// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AirlineRocket {

    address public owner;

    struct Customer {
        uint loyaltyPoints;
        uint totalFlights;
    }  

    struct Flight {
        string name;
        uint256 price;
    }

    uint etherPerPoint = 0.5 ether;

    Flight[] public flights;

    mapping(address => Customer) public customers;
    mapping(address => Flight[]) public customerFlights;
    mapping(address => uint) public customerTotalFlights;
    

    //Events
    event FlightPurchased(address indexed customer, uint price, string flight);

    //Modifiers
    modifier isOwner() {
      require(msg.sender == owner);
      _;
    }
        
    constructor() {
        owner = msg.sender;   
        flights.push(Flight('Tokio', 4 ether));
        flights.push(Flight('Germany', 3 ether));
        flights.push(Flight('Madrid', 3 ether));
    }   

    //-------------------------------- Funciones Contrato --------------------------------

    //Funcion para comprar vuelos  
    function buyFlight(uint flightIndex) public payable {
        Flight memory flight = flights[flightIndex];
        require(msg.value == flight.price);

        Customer storage customer = customers[msg.sender];
        customer.loyaltyPoints += 5;
        customer.totalFlights += 1;
        customerFlights[msg.sender].push(flight);
        customerTotalFlights[msg.sender] ++;

        emit FlightPurchased(msg.sender, flight.price, flight.name);
    }

    //Funcion para ver el numero de vuelos disponibles en la aerolinea
    function totalFlights() public view returns (uint) {
        return flights.length;
    }
        
    //Funcion para ver el numero de Ethers que tenemos ganados para canjear
    function getRefundableEther() public view returns (uint) {
        return etherPerPoint * customers[msg.sender].loyaltyPoints;
    }
    //Funcion para reembolsar sus puntos ganados por viajar
    function redeemLoyaltyPoints() public {
        Customer storage customer = customers[msg.sender];
        uint etherToRefund = etherPerPoint * customer.loyaltyPoints;
        payable (msg.sender).transfer(etherToRefund);
        customer.loyaltyPoints = 0;
    }

    //Funcion para ver balanace del contrato de la aerolinea en Ether
    function getAirlineBalance() public isOwner view returns (uint) {
        address airlineAddress = address(this);
        return airlineAddress.balance;
    }


}