// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.8.0;

import "functions.sol";

contract FunctionsChild is Functions{
       constructor (uint _num) public {
      num = _num;
    }
    

    function getInternalFunction(uint _x) public view returns(uint) {
        return internalFunction(_x);
    }
}
