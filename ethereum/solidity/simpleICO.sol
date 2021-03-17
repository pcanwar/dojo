//SPDX-License-Identifier: MIT
pragma solidity >= 0.6.0 < 0.8.1;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
// import "../github/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
contract Toekn20 is ERC20 {
    address public owner; // owner if the contract. 
    uint256 internal INIT_SUPPLY = 9000 * (10 ** decimals()); // total supply
    
    uint tokenPrice = 10000; // an example, clients can buy the tokens in wei,
    // value can be (ether, finney, and etc ) /tokenPrice
    // an unit can represent balance, license, physical object, or any value
    /** @dev call the _mint function from ERC20 Standard to assign token 20 to `account` 
     * msg.sender is the account address that deploy this smart contract
     * INIT_SUPPLY is total supply 
     */
    constructor () public ERC20("NinjaToekn", "Ninja"){
        owner = payable(msg.sender);
        _mint(msg.sender, INIT_SUPPLY);
    }
    
    modifier onlyOwner {
        require(msg.sender == owner  , "only owner allows to use/run this function");
        _;
    }
    
    function balances() public view returns(uint256){
        return balanceOf(msg.sender);
        // run balanceOf from ERC20
    }
    
    function sendToken(address _to, uint256 _amount) public payable returns(uint256 ) {
        require(balanceOf(msg.sender) >= _amount, "You have no enough token");
        transfer(_to, _amount );
        return balanceOf(msg.sender);
        
    }
    
    // _balances has to be public in ERC20 file
    
    function buyMyToken() payable public{
        require(_balances[msg.sender] + msg.value >= _balances[msg.sender]);
        uint tokens = msg.value / tokenPrice;
        _balances[owner] -= tokens;
        _balances[msg.sender] += tokens;
        payable(owner).transfer(msg.value);
        
    
    }
    
}
