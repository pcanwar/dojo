// SPDX-License-Identifier: MIT 
pragma solidity ^0.7.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";
contract Fundraising {
    using SafeMath for uint256;
    mapping(address => uint) public balances;
    
    bool internal getItLocked;
    
    modifier singleEntry() {
        require(!getItLocked, "No re-entry");
        getItLocked = true; 
        _;
        getItLocked = false;
    }

    
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() singleEntry public {
        // checkpoints
        require(msg.sender == tx.origin, "no contract is allowed");
        require(balances[msg.sender] >= 0);
        // changepoints
        uint amountToWithdraw = balances[msg.sender];
        balances[msg.sender] = balances[msg.sender].sub(amountToWithdraw);
        // (bool success, ) = msg.sender.call{value: amountToWithdraw}("");
        // require(success,"Unsucced");
        // interact points
        msg.sender.transfer(amountToWithdraw);
        
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
