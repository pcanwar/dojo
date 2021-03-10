
// don't use the privateKey like this way. It is not secure at all. 
// Here I just need to show you how things works as a test

var Web3 = require('web3');

url = 'HTTP://127.0.0.1:7545';
var web3 = new Web3(url);

//using Ganacha keys
var from = '0xd99bB3Afac59529ef5dd3d0d9674aCBD379A91f9'
var privateKey = 'ff845c6c45b261a4a642562f3220ae0a6ec2dac92d6f9a859cb21ff2f7bf4a7c'
 

var to = '0x68A92CE88500990161A6191F53ebd74D081AbF76'

const sendTx = async() => {
const signtx = await web3.eth.accounts.signTransaction({
    from: from,
    to: to,
    value: web3.utils.toWei('300', 'ether'),
    gas: 2000000
}, privateKey )

const createTx = await web3.eth.sendSignedTransaction(signtx.rawTransaction)

console.log(`transaction sent ${createTx.transactionHash}`)

}

sendTx()


