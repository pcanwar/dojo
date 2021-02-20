//SPDX-License-Identifier: MIT
pragma solidity >=0.4.16 <0.9.0;

/**
 * @title Tech Insurance tor
 * @dev complete the functions
 */
contract TechInsurance {
    
    /** 
     * Define two structs
     * 
     * 
     */
    struct Product {
        uint productId;
        string productName;
        uint price;
        bool offered;
    }
     
    struct Client {
        bool isValid;
        uint time;
    }
    
    
    mapping(uint => Product) public productIndex;
    mapping(address => mapping(uint => Client)) public client;
    
    uint productCounter;
    
    address payable insOwner;
    constructor(address payable _insOwner) public{
        insOwner = _insOwner;
    }
 
    function addProduct(uint _productId, string memory _productName, uint _price ) public {
 
    }
    
    
    function changeFalse(uint _productIndex) public {

    }
    
    function changeTrue(uint _productIndex) public {

    }
    
    function changePrice(uint _productIndex, uint _price) public {

    }
    
    function clientSelect(uint _productIndex) public payable {
        
    } 
    
}
