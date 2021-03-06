//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.16 <0.9.0;

contract BasicStorage {
    
    string message;
    uint store;
    
    function set(uint _store,  string memory _message) public {
        store = _store;
        message = _message;
    }
    
    function getMessage() public view returns( string memory){
        return message;
    }
    
     function getStore() public view returns( uint){
        return store;
    }
}
