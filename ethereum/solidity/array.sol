// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.8.0;

contract Arrays {

    // Static Array 
    int[5] staticArray = [1,2,20,10];    // Last index set to 0

    int8[] dynamicArray;

    bool[] boolArray;

    function test() public {
        //  memory array for 7 indexs 
        boolArray = new bool[](7);
        
        // Explicit conversion 
        dynamicArray = [int8(1),2,3];
        
        // in a function
        uint8[] memory memoryArray; // A Dynamic memory array

        // NOT allowed
        //memoryArray = [uint8(1),2];
        memoryArray = new uint8[](8);
        
        // push() not allowed for memory array
        // memoryArray.push(1);
        // memoryArray.length=6;

        /** Examples of array initialization with assignment below */

        // Static storage array assignment is OK
        // Compile time size check is carried out
        // so assignment to [1,2,3,4] will fail below
        staticArray = [1,2,3];


        // Static memory array
        uint[2] memory  staticMemoryArray;

        // type has to be matching
        // staticMemoryArray is of type uint
        staticMemoryArray = [uint(1),2];

        // This is allowed
        staticMemoryArray[0] = 0;
        staticMemoryArray[1] = 1;

        memoryArray[0] = 1;
    }
}


contract ArraysExample {

    // unfixed size: Dynamically sized Arrays
    
    //  byte[]
    // string (UTF-8 encoding)
    // member: lenugth and push
    
    uint[] public prices;
    
    function addPrice(uint _price) public {
        prices.push(_price);
    }
    
    function getLen() public view 
    returns(uint) {
        return prices.length;
    }
    
    function getElementwithError(uint _index) public view 
    returns(uint) {
        
        return prices[_index];
    }
    
    function getElementWithoutError(uint _index) public view 
    returns(uint c) {
        if (_index < prices.length){
            return prices[_index];
        }
    }
    
    // ERROR because length is read-only
    // check : https://docs.soliditylang.org/en/v0.8.1/060-breaking-changes.html#explicitness-requirements
    function deleteElement(uint _index) public 
    returns(bool) {
        
        if (_index >= prices.length){
            return false;
        } else {
            for (uint i = _index; i < prices.length - 1; i++) {
                prices[i] = prices[i + 1];
            }
            prices.length--;
            return true;
        }
        
    }
    
    function removeElement() public 
    returns(bool) {
        
        if (1 >= prices.length){
            return false;
        } else {
            prices.pop();
            return true;
        }
        
    }
