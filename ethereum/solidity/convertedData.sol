// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.8.0;

contract Conversion {
    uint8 getNumber = 255; 
    // uint8 get2ndNumber = 256; unacceptable          

    uint getBalance;  
    
    function conversion ( ) public {
        int  getA;                
        getA = getNumber;         // Compilation successful because:
                                  // a 8-bytes type can fit into a 32-bytes type 
                                  //and there is no lost of data
                                
                                
        // getNumber = getA;      // Fails because the maximum value of int256 can't fit ot be accommodated in uint8
        
        getNumber = uint8(getA);  // Explicit type coversion...converting a 32bytes to 1bytes
        
        
        uint160 exp160 = 400;
        // uint128 exp128a = exp160;
        uint128 exp128b = uint128(exp160);
    }
}
