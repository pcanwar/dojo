var Web3 = require('web3')

var url = "https://mainnet.infura.io/v3/ID"
var web3 = new Web3(url);

myaddress = '0xa'

web3.eth.getBalance(myaddress, function(error, result) {
    var balance = result
    var ethBalance = web3.utils.fromWei(balance, 'ether');
    console.log( `The amount in eth: ${ethBalance}`);

});

blockHashOrNum = 100

web3.eth.getBlock("latest", function(error, result){

        console.log(result)

})

async function check(){
    const latestBlock = await web3.eth.getBlockNumber();
    console.log(latestBlock)
}
