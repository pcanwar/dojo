// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.8.0;

contract BasicDataType {
    
    //..type variables

    uint256 number = 255; 
    
    int256 num = -1;
    
    address public owner;       
    
    bool public flag = false;
    
    uint  getsBalance; 

    // Function takes in an address and save the balance of the address into getsBalance variable 
    function test (address addr) public {
        owner = addr;
        getsBalance = owner.balance;
 
    }
    
    /* this func returns the value that stored in the getsBalance variable */
    function readBalance () public view returns(uint){
        return getsBalance;
        
    }
}
