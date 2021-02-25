//SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.1;

/**
 * @title Tech Insurance tor
 * @dev 
 * Step1: Complete the functions in the insurance smart contract
 * Step2:Add any required methods that are needed to check if the function are called correctly, 
 * and also add a modifier function that allows only the owner can run the changePrice function.
 * Step3: Add any error handling that may occur in any function
 * Step4: Add a modifer function to check the time if the client insurance is valid.
 * Step 6 (opcional): Add a refund function that refunds money back to the client after one week. Guaranteed Money Back Plan.  
 * Step 5: implement ERC 721 Token to this contract and change what it needs to be changed. 
 * 
 */
contract TechInsurance {
    
    /** 
     * Defined two structs
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
    
    
    function doNotOffer(uint _productIndex) public {

    }
    
    function forOffer(uint _productIndex) public {

    }
    
    function changePrice(uint _productIndex, uint _price) public {

    }
    /**
    * @dov 
    * Every client buys an insurance, 
    * you need to map the client's address to the id of product to struct client, using (client map)
    */
    function buyInsurance(uint _productIndex) public payable {
        
    } 
    
}
