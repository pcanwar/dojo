pragma solidity >=0.5.0 <0.8.0;

contract Types {
    //string
    string name = "someone";
    
    //int
    uint storageData = 30;
    
    //bool
    bool add = false;
    
    address walletAddress =  msg.sender;

    // arrays
    
    string[] nmaes;
    uint [] intNumber;
    
    //struct to define
    struct User {
        string firstName;
        string lastName;
    }
    
    // enms
    enum userType {buyer, seller}
    
    //mapping
    mapping(address => uint) public balances;
    
    // Special varables:
    
    // token: ether, szabo, finney, 
    
    //time: weeks, hours, minutes, seconds
    // bool isTime = (1 hours = 60 minutes);
    
    // block
    uint n = block.number;
    uint d = block.difficulty;
    // block.coinbase();
    
    // message, what sent to you..
    address who = msg.sender;
    uint value = msg.value;
    // msg.data;
    
    // transaction
    // tx.origin

}
