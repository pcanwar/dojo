# Objectives

1. Connect web3 to ganache local blockchain and run basic commands.
2. List account information from ganache using web3.
3. Make calls from web3 using your IDE rather than your terminal.

npm init -y

## **Recap. connect to Metamask**

1- install Metamask on Chrome Extension
 2- configuring Metamask Private network:
 1- from option, use &quot;Custom RPC&quot;, at address [http://127.0.0.1:xxxx](about:blank)
 2- pick up any private keys to import accounts.

## **Mocha and Chai**

![](RackMultipart20210301-4-zk3uu2_html_237499165a11f2b9.gif)

Truffle supports and comes preinstalled with Mocha and Chai. Mocha is a testing framework for javascript, it can be used for front end applications and back end applications on decentralized apps while Chai is an Assertion Library. They are popular for testing the code.

- Chai is an Assertion Library
- Both are available as NPM packages
- Very popular between developer for testing their code
- Truffle supports and comes preinstalled with Mocha and Chai

**Truffle**

- verify if Truffle is installed truffle -v
- install Truffle or update it to the latest version: npm install -g truffle

Use truffle boxes to help you build DApp. Truffle Boxes contain modules, Solidity contracts &amp; libraries, front-end views and more. More information in [Truffle Boxes](https://truffleframework.com/boxes)

Run truffle unbox \&lt;box\_name\&gt; To download any boxes from truffle

Note(1): installing Truffle globally using the command sudo we run the develop command sudo truffle develop

1- download **webpack** box to help for building the front-end the application- in the terminal use these command

1. Create a project directory mkdir dirProject)
2. Change to the project directory (cd dirProject)
3. Create a project using truffle unbox webpack
4. In the project directory truffle develop or sudo truffle develop.
5. Check URl Truffle: [http://127.0.0.1:xxxx](about:blank)
6. Check private keys that provided by Truffle

## **Connect Truffle to Metamask**

1- install Metamask on Chrome Extension
 2- configuring Metamask Private network:
 1- from option, use &quot;Custom RPC&quot;, at address [http://127.0.0.1:xxxx](about:blank)
 2- pick up any private keys to import accounts.
