// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.8.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 */
contract Storage {
    
    // state variable in the storage 
    
    uint256 number;
    uint[] points;

    /**
     * @dev Store value in variable
     * @param num value to store
     */
    function store(uint256 num) public {
        
        // Local variable you need to spacify if it is storage or memory
        uint256[] storage localPointer;
        uint256[] memory mempryPointer;
        
        number = num;
        
        uint256 [] memory referencePointer = points;
    }

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256){
        return number;
    }
}
