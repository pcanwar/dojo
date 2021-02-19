// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.8.0;

contract AccountContract {
    
    struct Account {
        string name;
        uint age;
    }
    
    // mapping address to struct, 
    mapping(address => Account) owner;
    
    
    function getNewAccount(string memory _name, uint _age) public {
        require(owner[msg.sender].age == 0,"You already have an account");
        
        Account memory instance = Account(_name, _age);
        owner[msg.sender] = instance;
    }
    
    function printIn() public view returns (string memory){
        address own = msg.sender;
        return owner[own].name;
    }
    
    function printIn2() public view returns(uint){
        
        address owners = msg.sender;
        return owner[owners].age;
    }
}
