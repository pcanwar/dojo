//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.7.5;

contract SimpleStorage {
    string storedData ;

    function set(string memory x) public payable{
        require(msg.value > 2 ether, "ha send more ethers");
        storedData = x;
    }

    function get() public view returns (string memory) {
        return storedData;
    }
}