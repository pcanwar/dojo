
We need to install those packages before we start our 3rd week.

### Wallet Account
* Install [Metamask](https://metamask.io/). 

Metamask is a browser plugin that can be used to interact with any smart contract or create Ethereum transactions. It is easier to get started with.

### Code Editors: 
###### Here are a list of a text editor software for Windows and Mac platforms. You can install one of these:
* Install [Visual Studio Code](https://code.visualstudio.com)
* Install [Atom](https://atom.io/)

### Back-End Development
* Install [Docker](https://docs.docker.com/desktop/)
    Management of virtual infrastructure to run your applications or your preferred operating system. We need docker to be installed so we can work on [Geth](https://github.com/ethereum/go-ethereum) 

### Platforms
* Install [Nodejs](https://nodejs.org/en/)
Node.js is a JavaScript runtime environment for executeing JavaScript code on the server side or terminal/ command-line tools. 
After you install nodejs make sure ```npm``` package is installed as well. To check if it is installed, type ```npm -v``` on the open command prompt (in Windows) or terminal (in Mac or UNIX/Linux). Npm is a packaging tool that will allow you to install third party libraries such as web3. Node.js comes with virtual environment which is known as Node shell. 
A quick way to test simple Node.js/JavaScript code, type ```node``` on the open command prompt (in Windows) or terminal (in Mac or UNIX/Linux) 

### Library 
Open the command prompt (in Windows) or terminal (in Mac or UNIX/Linux):

Step 1): Create a directory and change the current working directory to the new directory that you created
```
mkdir web3practice
cd web3practice
```
Step 2)
When you need to start a new Node.js project, you need to to initialize the project with NPM.
Initialize node ( choose defaults setting to create a package.json file)
```npm init```

Step 3)
##### Install web3 
```npm install web3 --save```

```--save``` is to install web3 on the web3practice directory
```--global``` If you want to install it in the system

Step 4)
Type ```node```
Step 5)
Here we need to test if web3 is installed type and hit enter 
```var Web3 = require(web3);```
Step 6)
Type:
```Web3```

Let me know if you have any erros.

