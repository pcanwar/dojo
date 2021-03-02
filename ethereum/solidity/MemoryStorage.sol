//SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.1;

/**
 * @title memory example
 * @dev 
 */
contract MemoryStorage {
    
    struct Things{
        uint price;
    }
    
    mapping(uint => Things) public info;
    
    
    function addSomething(uint _id, uint _price) public {
        info[_id] = Things(_price);
        
    }
    
    function updateSomethingInMemory(uint _id, uint _price) public view returns(uint){
        Things memory thing = info[_id];
        thing.price = _price;
         return  thing.price;
    }
    
    function updateSomething(uint _id, uint _price) public view returns(uint){
        Things memory thing = info[_id];
        thing.price = _price;
         return info[_id].price;
    }
    
    function getSomethingPrice(uint _id) public view returns(uint){
        return info[_id].price;
    }
    
}
