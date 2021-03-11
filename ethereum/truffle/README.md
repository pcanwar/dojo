# Truffle
## Installing Truffle
* Check or verify if Truffle is installed, run ```truffle -v``` in your system.
* If truffle is not installed run: ```npm install -g truffle ```
#### Note(1):
If installing Truffle globally using the command ```sudo``` you need to run the command as ```sudo truffle develop```
 

## Start Truffle 
Use truffle boxes to help you build your dApp. Truffle Boxes contain modules, Solidity contracts & libraries, front-end views and more. More information in [Truffle Boxes](https://www.trufflesuite.com/boxes)

Run ```truffle unbox <box_name>``` To download any boxes from truffle 
For example:
```truffle unbox webpack```
```truffle unbox react```

Download webpack box to help for building the front-end the application- in the terminal use these command
* Create a project directory ```mkdir dirProject```
* Change to the project directory ```cd dirProject```
* Create a project using ```truffle unbox webpack```
* In the project directory run ```truffle develop``` 
* Compile and deploy the smart contract ```migrate --reset```
* Open new Terminal and run ```npm run dev```
    * Check URL Truffle: http://127.0.0.1:xxxx


## Configuring Truffle
The configuration file is used to configure the truffle project for for different networks, compilers information(version from solc-bin), and other features. 
