// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Timer {
    
    mapping(address => uint) public lock;

    function setTimer() external  {
        lock[msg.sender] = block.timestamp + 2 weeks;
    }

    function incresment(uint _seconds) public {
        lock[msg.sender] += _seconds;
    }

    function pullTime() public view returns(string memory x){
        if (block.timestamp < lock[msg.sender]){
            return (" Live");
        } 
    }
    
    function timestamp() public view returns(uint x){
        x = block.timestamp ;
        return (x);
    }
}
