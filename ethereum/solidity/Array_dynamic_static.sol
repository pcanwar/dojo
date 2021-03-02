//SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.8.0;

contract Array_dynamic_static{


    uint[] public arr = [2, 4, 5];
    
    uint[4] public staticArr = [2, 4, 5,8];

    
      /*  dynamic  */
    function getNumber(uint _index) public view returns(uint){
        return arr[_index];
    }

    function setNumber(uint _index, uint _newNumber) public {
      arr[_index] = _newNumber;
    }

    function addNumber(uint _newNumber) public {
      arr.push(_newNumber);
    }
    
    
    /*  static  */
    function setStaticArrayNumber(uint _index, uint _newNumber) public {
      staticArr[_index] = _newNumber;
    }
    
    // what type of error is this?
    function addStaticArrayNumber(uint _newNumber) public {
        staticArr.push(_newNumber);
    }

    
}
