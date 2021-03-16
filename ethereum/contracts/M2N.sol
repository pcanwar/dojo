//SPDX-License-Identifier: MIT

pragma solidity 0.8;

contract Permissions {
    address private contractOwner;
    uint M = 2;
    address [] public authenticators ;
    address [] public n_Authenticators;

    mapping (address => bool) public isAuther;

    mapping (uint => mapping (address => bool)) public confirmations;
    

    
    constructor() public {
        contractOwner = msg.sender;
        // authenticators.push(msg.sender);
        isAuther[msg.sender] = false;
    }
 
    //---  the function modifiers ---- ///
    
    modifier onlyContractOwner() {
        require(msg.sender == contractOwner, "Not contract owner");
        _;
    }
    
    modifier notNull() {
    require(msg.sender != address(0));
        _;
    }
    
    
    modifier AuthenticatorExist(address _address){
        require(isAuther[_address] == false, "already added!");
        _;
  }
 
    
    //---  the implementation of each address to say yes ---- ///

    
    
     //---  the implementation of SC, if two authers say yes you can executed the function ---- /// 


    // -- helper functions
    function getAuths() public view returns (address[] memory)
    {
        return authenticators;
    }
    
    function addAuths(address _address) public onlyContractOwner() 
    AuthenticatorExist(_address) notNull() {
         isAuther[_address] = true;
        
    }
    
    function Authrize() public notNull() returns (uint _x) {
        require(isAuther[msg.sender] == true, "no you can't");
        authenticators.push(msg.sender);
        return (authenticators.length);
    }
    

}
