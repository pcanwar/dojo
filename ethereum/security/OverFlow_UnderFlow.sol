//SPDX-License-Identifier: MIT

pragma solidity 0.7;

// Always and highly recommended to use OpenZeppelin: "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol"; 
// it solved in 0.8

library SafeMath {

    function add(uint8 a, uint8 b) internal pure returns ( uint8) {
         {
            uint8 c = a + b;
            // from Add func:
            // if (c < a) return (false, 0); 
            // return (true, c);
            require(c >= a, " the res is false or an overflow");
            return c;
        }
    }
    
}

contract OverFlow_UnderFlow{
    
    using SafeMath for uint8;
    
    uint8 public overFlow ;
    uint8 public underFlow ;
    
    uint8 public s_ad ;


    
    /*
    * balances +*-/ 1 , n +*-/ 1
    * balances.add(1), sub(), mul(), div()
    */
    function math() public {
        uint8 x = 255;
        uint8 y = 1;
        
        overFlow =  x + y;
        underFlow = 0 - y;

     }
     
    function safe_math() public {
        uint8 x = 255;
        uint8 y = 1;
        s_ad = SafeMath.add(x,y);
        // s_ad = x.add(y);

     }
     
     

    
}
