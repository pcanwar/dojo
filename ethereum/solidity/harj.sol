//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.8.0;

contract Eexample {
    
    // int40 public x = 500000000000;
    
    struct Car {
        string name;
        uint256 year;
        uint amount;
        bool isSold;
    }
    
    mapping(address => Car) carOwner;
    
    
    mapping(uint => Car) public carId;
    
    
    uint256 counter ;
     // uint256 public count = 2;
    
    // function updatePlaceName() public {
    //     count += 5;
    // }
    
    function addCar(string memory _name, uint256 _year, uint256 _amount) public{
    uint256 count = counter++;
    
    Car memory newCar = Car(_name, _year, _amount, false);
    carOwner[msg.sender] = newCar;
    
    carId[count] = newCar;

    }
    
    function isItSold(uint256 _carId) public view returns(bool){
         return carId[_carId].isSold;
        
    }
    
}

