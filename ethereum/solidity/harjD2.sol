//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.8.0;

contract Eexample {
    
    // int40 public x = 500000000000;
    
    struct Car {
        string name;
        uint256 year;
        uint amount;
        bool forSale;
        address payable carOwnerAdress;
    }
    
    
    mapping(address => Car) carOwner; /* map the address to a car */
    
    mapping(uint => Car) public carId; /* map the counter to a car */
    
    uint256 counter ; // increasment 
    
    
    /**
     * this function takes 3 args to input values to the struct Car
     */
    function addCar(string memory _name, uint256 _year, uint256 _amount) public{
    
    Car memory newCar = Car(_name, _year, _amount, true, msg.sender);
    carOwner[msg.sender] = newCar;
    
    carId[counter++] = newCar;

    }
    
    /**
     * this function to check if it is for sale
     */
    function isItSold(uint256 _carId) public view returns(bool){
         return carId[_carId].forSale;
        
    }
    
    /**
     * A payable function to transfer the value 
     */
    function payment(uint256 _carId) public payable {
        
        require(carId[_carId].forSale != false, "The car is sold");
        require(msg.value == carId[_carId].amount, " check the amount of the car");
        
        
        carId[_carId].forSale = false;
        uint256 price = carId[_carId].amount;
        carId[_carId].carOwnerAdress.transfer(price);
        //9000000000000000000 = 9 ether
        
    }
    
    
}
