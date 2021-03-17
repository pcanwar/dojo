// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";
// `SafeMath` is no longer needed starting with Solidity 0.8. The compiler now has built in overflow checking.

contract Fundraising {
    //
    using SafeMath for uint256;
    mapping(address => uint) public balances;
    
    bool internal getItLocked;
    
    modifier singleEntry() {
        require(!getItLocked, "No re-entry");
        getItLocked = true; 
        _;
        getItLocked = false;
    }
    
        
    modifier noCall{
        require(msg.sender == tx.origin, "no contract is allowed");
        _;
    }

    
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() singleEntry noCall public {
        // 1st checkpoints
        require(balances[msg.sender] >= 0);
        
        // 2nd changepoints
        uint amountToWithdraw = balances[msg.sender];
        balances[msg.sender] = balances[msg.sender].sub(amountToWithdraw);
     
        // 3rd interact points
        payable(msg.sender).transfer(amountToWithdraw);
        
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
