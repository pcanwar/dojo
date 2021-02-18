pragma solidity >=0.4.0 <0.8.0;

contract Name {
    
    string name;
    
    // when should we use constructor?
    // let do abstract and inh
    // constructor( string memory _name) public {
    //     name = _name;
    // }
    
    function printName() public view 
    returns(string memory) {
        return name;
    }
    
    function inputName(string memory _name) public {
        name = _name;
    }
}
