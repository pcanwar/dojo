// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.8.0;

contract Functions{
    uint public num;

    // Constructor
 

    // change num
    function setNum(uint _num) public {
        num = _num;

    }
    
    function internalFunction(uint _num) internal view returns(uint) {
        return _num + num;
    }
    

    function privateFunction(uint _a) private pure returns(uint) {
        // you can't call this func from outise of this contract so it is not available outside this contract
        return _a + 10;
    }

    // Get num
    function  getNum() public view returns (uint){
        return num ;

    }
    
     function  callPrivateFunction() public view returns (uint){
        return privateFunction(num) ;

    }


    function getNum2nd() public view returns (uint _num){
        _num = num;
    }

}
