module.exports = {

networks: {
        development: {
            host: "localhost", // Localhost is a local RPC node. A domain or an external IP is for an external hosted node.
            port: 8545,        // The http RPC port is for the running node. Each network could use a different port number.
                               // In your geth practice, you use the flag --rpcport and it recommended to use the flag --http.port 
            network_id: "*",   // The network id of the network. "*" means to match any network id. 

            gas: 6000000,         // gas (optional): the gas value to specify for transactions. Default is 6721975
            gasPrice: 20       // gasPrice (optional): The gas price used for deploys. Default is 100000000000
            provider: function() {
                return new HDWalletProvider(mnemonic, "http://127.0.0.1:8545/");
                        }
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
