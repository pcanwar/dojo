# Objectives

1. Connect web3 to [ethereum network] e.g, ganache local blockchain, truffle, ethereum testnet and so on .
2. List account information from [ethereum network] e.g, ganache using web3.
3. Make calls from web3 using your IDE rather than the terminal.

```sh
npm init -y
```
## **Recap. connect to Metamask**

1- install Metamask as an extension on the browser.
2- configuring metamask network eg, ganache
 - from metamask option, use -> Custom RPC; add at address [http://127.0.0.1:xxxx](about:blank)
 - from ganache, you pick up any private keys to import accounts into metamask.

## **Mocha and Chai**


Truffle supports and comes preinstalled with Mocha and Chai. Mocha is a testing framework for javascript, it can be used for front end applications and back end applications on decentralized apps while Chai is an Assertion Library. They are popular for testing the code.

- Chai is an Assertion Library
- Both are available as NPM packages
- Very popular between developer for testing their codes
- Truffle supports and comes pre-installed with these libraries (Mocha and Chai)

**Truffle**

- Verify if Truffle is installed already
```sh 
truffle -v
```
- to install Truffle or to update it to the latest version:
```sh 
npm install -g truffle
``` 

Use truffle boxes to help you build DApp. Truffle Boxes contain modules, Solidity contracts &amp; libraries, front-end views and more. More information in [Truffle Boxes](https://truffleframework.com/boxes)

Run 
```sh 
truffle unbox xxxx 
``` 

xxxx is to download any available boxes from truffle


1- download **webpack** box to help for building the front-end the application- in the terminal use these command

1. Create a project directory mkdir dirProject)
2. Change to the project directory (cd dirProject)
3. Create a project using truffle unbox webpack
4. In the project directory truffle develop or sudo truffle develop.
5. Check URl Truffle: [http://127.0.0.1:xxxx](about:blank)
6. Check private keys that provided by Truffle

## **Connect Truffle to Metamask**

1- install Metamask on Chrome Extension
 2- configuring Metamask network:
 - from option, use &quot;Custom RPC&quot;, at address [http://127.0.0.1:xxxx](about:blank)
 - pick up any private keys to import accounts.

### Note(1): 
Installing Truffle globally using the command sudo you need to run the develop command sudo truffle develop
