pragma solidity >=0.4.0 <0.7.0;
contract AccountContract{
    
    struct Account{
        string name;
        uint age;
    }
   
   Account [] account;

   
   function inputAccount(string memory _name, uint _age) public returns(uint){
   
     account.push(Account(_name, _age));
    // return account[0].age;

   }
   
   
   function printIndex( uint _id) public view returns(string memory){
        return account[_id].name;
   }
   

    function inputandGetFirstName(string memory _name, uint _age) public pure returns(string memory){
      Account memory instance = Account(_name, _age);
      return(instance.name);
   }
}
