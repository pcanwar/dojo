module.exports = {

networks: {
        development: {
            host: "localhost", // Localhost is a local RPC node. A domain or an external IP is for an external hosted node.
            port: 8545,        // The http RPC port is for the running node. Each network could use a different port number.
                               // In your geth practice, you use the flag --rpcport and it recommended to use the flag --http.port 
            network_id: "*",   // The network id of the network. "*" means to match any network id. 

            gas: 9000,         // gas (optional): the gas value to specify for transactions.
            gasPrice:         // gasPrice (optional): The gas price for transactions in wei. Defaults to network gas price.
        },
        
        
        
        
        rinkeby: {
            host: "localhost",
            port: 8545,
            network_id: 4
        },
        mainnet: {
            host: "localhost",
            port: 8545,
            network_id: 1
        }
    }
};
