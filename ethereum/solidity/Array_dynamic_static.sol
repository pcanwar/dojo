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

    function insertNumber(uint _newNumber) public {
      arr.push(_newNumber);
    }
    
    function delNumber(uint _newNumber) public {
      delete arr[_newNumber];
    }
    
    function getArr() public view returns (uint [] memory){
        return arr;
    }
    
    /*  static  */
    function setStaticArrayNumber(uint _index, uint _newNumber) public {
      staticArr[_index] = _newNumber;
    }
    
    function delStaticArrNumber(uint _newNumber) public {
      delete staticArr[_newNumber];
    }
    
    function getStaticArrayNumber() public view returns (uint [] memory){
        return arr;
    }
    
    // what type of error is this?
    // function addStaticArrayNumber(uint _newNumber) public {
    //     staticArr.push(_newNumber);
    // }

    
}
