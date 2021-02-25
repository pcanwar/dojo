

//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";

contract Hraj is ERC721("NinjaToekn", "Ninja") {
    
    // int40 public x = 500000000000;
    
    struct Car {
        string name;
        uint256 year;
        uint amount;
        bool forSale;
        address  carOwnerAdress;
    }
    
    
    mapping(address => Car) carOwner; /* map the address to a car */
    
    mapping(uint => Car) public carId; /* map the counter to a car */
    
    uint256 counter ; // increasment 
    

    
    /**
     * this function takes 3 args to input values to the struct Car
     */
    function addCar(string memory _name, uint256 _year, uint256 _amount) public{
    counter++;
    address carAddress = msg.sender;
    carId[counter] = Car(_name, _year, _amount, true, msg.sender);
    // Car memory newCar = Car(_name, _year, _amount, true, msg.sender);
    _mint(carAddress, counter);
    
    // carOwner[msg.sender] = newCar;
    
    // carId[counter++] = newCar;

    }
    
    /**
     * this function to check if it is for sale
     */
    function isItSold(uint256 _carId) public view returns(bool){
         return carId[_carId].forSale;
        
    }
    
     function lookup(uint256 _id) public view returns(string memory){
        return carId[_id].name;
        
    }
    
    
    
    /**
     * A payable function to transfer the value 
     */
    function payment(uint256 _carId) public payable {
        
        require(carId[_carId].forSale != false, "The car is sold");
        require(carId[_carId].forSale == true, "the car has to be listed for sale");
        
        require(msg.value >= carId[_carId].amount, " check the amount of the car");
        
        
        carId[_carId].forSale = false;
        uint256 price = carId[_carId].amount;
        // address payable receiver = address(uint160(carId[_carId].carOwnerAdress));
        payable(carId[_carId].carOwnerAdress).transfer(price);
        // transfer(carId[_carId].carOwnerAdress, price );
        carId[_carId].carOwnerAdress = msg.sender;
        //9000000000000000000 = 9 ether
        
    
    
    
}
}

