

create a new dir inside ```fabric-samples/``` 

From the test-network copy ```configtx/``` dir and ```docker/docker-compose-test-net.yaml``` file  

Create a ```crypto-config.yaml``` file for the cryptogen tool.

```sh
organizations/cryptogen/crypto-config-orderer.yaml
organizations/cryptogen/crypto-config-org1.yaml
```
You can add more orgs

Generating the certificate:

```sh
cryptogen generate --config=./crypto-config.yaml
```

Generating an orderer genesis block:

```sh
configtxgen -profile ICOrgsOrdererGenesis -outputBlock ./channel-artifacts/genesis.block
```

change the configtx.yaml file.

Add new Org3 into section Organizations 
add new profiles: ThreeOrgsOrdererGenesis, ThreeOrgsChannel into section Profile.
