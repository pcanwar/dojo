//SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.8.0;

contract StruckArray{
    
 struct Car {
      uint id;
      string model;
      uint year;
    }

    Car[] public vehicle;

    function addCar(string memory _model, uint _year) public {
        
        //First: 
        // Car(vehicle.length, _model, _year)
        
        vehicle.push(Car(vehicle.length, _model, _year));
        
        // Second :
        // Car memory newVehicle;
        // newVehicle.id = vehicle.length;
        // newVehicle.model = _model;
        // newVehicle.year = _year;

        // vehicle.push(newVehicle);
    }
}
