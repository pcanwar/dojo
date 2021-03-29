
Create a new dir inside ```fabric-samples/``` e.g. ```work```

### Generating the certificate:

Create a ```crypto-config.yaml``` file for the cryptogen tool. First, in this file you need to defind two sections ```OrdererOrgs``` and ```PeerOrgs``` of organizations. ```crypto-config.yaml``` contains the network topology. It generates a set of certificates and keys for organizations and orders.

You can use the default files:
```sh
organizations/cryptogen/crypto-config-orderer.yaml
organizations/cryptogen/crypto-config-org1.yaml
organizations/cryptogen/crypto-config-org2.yaml

```


```sh
# ---------------------------------------------------------------------------
OrdererOrgs:
  # ---------------------------------------------------------------------------
  # Orderer
  # ---------------------------------------------------------------------------
  - Name: Orderer         # Orderer's name
    Domain: example.com      # Domain URL for orderer e.g dojo
    EnableNodeOUs: true   # Yes to generate MSPs which is used for the identity.
    Specs:
      - Hostname: orderer
        SANS:
          - localhost
```

```sh
PeerOrgs:
  # ---------------------------------------------------------------------------
  # Org1
  # ---------------------------------------------------------------------------
  - Name: Org1
    Domain: org1.example.com
    EnableNodeOUs: true
    Template:
      Count: 1
      SANS:
        - localhost
    Users:
      Count: 1

  - Name: Org2
    Domain: org2.example.com
    EnableNodeOUs: true
    Template:
      Count: 1
    Users:
      Count: 2

 - Name: Org3
    Domain: org3.example.com
    EnableNodeOUs: true
    Template:
      Count: 1
    Users:
      Count: 1

```

#### Name:
Name of the organization. You can have different orgs such as : Org1, Org2, and Org3 [Factory, Distributor, Wholesale].

Take care with name collisions
#### Template count:
Number of peer nodes for the organization
#### Users count:
Number of user accounts in addition to Admin for an organization

You can add as many orgs as you want.

Run the following command to generate the certification  

```sh
cryptogen generate --config=./crypto-config.yaml # check out other flags such as --output
```


After generating the certificate, you need to generate the orderer genesis block.

### Generating an orderer genesis block:

From the test-network copy ```configtx/``` dir into the ```work1``` dir. There is a ```configtx.yaml``` file that is used to create channel config. A channel configuration can be used to create the channel genesis block a channel or to create channel creation transaction for an application.

In ```configtx.yaml``` file, you need to defined all organizations that belong to a channel in the Organizations section. In this file you need to specify each organization ```name```, ```ID```, ```MSPDir```, and ```AnchorPeers```. ```MSPDir``` generated output MSP directories.  ```AnchorPeers``` points to the peer node(host and port).



```sh
################################################################################
#
#   Section: Organizations
#
################################################################################
Organizations:
    - &OrdererOrg
        Name: OrdererOrg
        # ID to load the MSP definition as
        ID: OrdererMSP

        # MSPDir is the filesystem path which contains the MSP configuration
        MSPDir: ../organizations/ordererOrganizations/example.com/msp

        # Policies defines the set of policies at this level of the config tree
        # For organization policies, their canonical path is usually
        #   /Channel/<Application|Orderer>/<OrgName>/<PolicyName>
        Policies:
            Readers:
                Type: Signature
                Rule: "OR('OrdererMSP.member')"
            Writers:
                Type: Signature
                Rule: "OR('OrdererMSP.member')"
            Admins:
                Type: Signature
                Rule: "OR('OrdererMSP.admin')"

        OrdererEndpoints:
            - orderer.example.com:7050

    - &Org1
        Name: Org1MSP

        # ID to load the MSP definition as
        ID: Org1MSP

        MSPDir: ../organizations/peerOrganizations/org1.example.com/msp

        # Policies defines the set of policies at this level of the config tree
        # For organization policies, their canonical path is usually
        #   /Channel/<Application|Orderer>/<OrgName>/<PolicyName>
        Policies:
            Readers:
                Type: Signature
                Rule: "OR('Org1MSP.admin', 'Org1MSP.peer', 'Org1MSP.client')"
            Writers:
                Type: Signature
                Rule: "OR('Org1MSP.admin', 'Org1MSP.client')"
            Admins:
                Type: Signature
                Rule: "OR('Org1MSP.admin')"
            Endorsement:
                Type: Signature
                Rule: "OR('Org1MSP.peer')"
        AnchorPeers:
            - Host: peer0.org1.example.com
              Port: 7051

    - &Org2
        Name: Org2MSP

        # ID to load the MSP definition as
        ID: Org2MSP

        MSPDir: ../organizations/peerOrganizations/org2.example.com/msp

        # Policies defines the set of policies at this level of the config tree
        # For organization policies, their canonical path is usually
        #   /Channel/<Application|Orderer>/<OrgName>/<PolicyName>
        Policies:
            Readers:
                Type: Signature
                Rule: "OR('Org2MSP.admin', 'Org2MSP.peer', 'Org2MSP.client')"
            Writers:
                Type: Signature
                Rule: "OR('Org2MSP.admin', 'Org2MSP.client')"
            Admins:
                Type: Signature
                Rule: "OR('Org2MSP.admin')"
            Endorsement:
                Type: Signature
                Rule: "OR('Org2MSP.peer')"
        AnchorPeers:
            - Host: peer0.org2.example.com
              Port: 9051      

     - &Org3
        Name: Org3MSP

        # ID to load the MSP definition as
        ID: Org3MSP

        MSPDir: ../organizations/peerOrganizations/org3.example.com/msp

        # Policies defines the set of policies at this level of the config tree
        # For organization policies, their canonical path is usually
        #   /Channel/<Application|Orderer>/<OrgName>/<PolicyName>
        Policies:
            Readers:
                Type: Signature
                Rule: "OR('Org3MSP.admin', 'Org3MSP.peer', 'Org3MSP.client')"
            Writers:
                Type: Signature
                Rule: "OR('Org3MSP.admin', 'Org3MSP.client')"
            Admins:
                Type: Signature
                Rule: "OR('Org3MSP.admin')"
            Endorsement:
                Type: Signature
                Rule: "OR('Org3MSP.peer')"
        AnchorPeers:
            - Host: peer0.org3.example.com
              Port: 10051


```

You need to defined all organizations that belong to a channel in the Profile section.
You need to add - &Org3 to the Organizations section.

You add new profiles ```ThreeOrgsOrdererGenesis``` and ```ThreeOrgsChannel```

```sh
################################################################################
#
#   Profile
#
#
################################################################################
Profiles:

    # TwoOrgsApplicationGenesis:
    #     <<: *ChannelDefaults
    #     Orderer:
    #         <<: *OrdererDefaults
    #         Organizations:
    #             - *OrdererOrg
    #         Capabilities:
    #             <<: *OrdererCapabilities
    #     Application:
    #         <<: *ApplicationDefaults
    #         Organizations:
    #             - *Org1
    #             - *Org2
    #         Capabilities:
    #             <<: *ApplicationCapabilities

    ThreeOrgsOrdererGenesis:
        <<: *ChannelDefaults
        Orderer:
            <<: *OrdererDefaults
            Organizations:
                - *OrdererOrg
            Capabilities:
                <<: *OrdererCapabilities
        Consortiums:
            SampleConsortium:
                Organizations:
                    - *Org1
                    - *Org2
                    - *Org3

    ThreeOrgsChannel:
        Consortium: SampleConsortium
        <<: *ChannelDefaults
        Application:
            <<: *ApplicationDefaults
            Organizations:
                - *Org1
                - *Org2
                - *Org3
            Capabilities:
                <<: *ApplicationCapabilities

    TwoOrgsChannel:
        Consortium: SampleConsortium
        <<: *ChannelDefaults
        Application:
            <<: *ApplicationDefaults
            Organizations:
                - *Org1
                - *Org2
            Capabilities:
                <<: *ApplicationCapabilities

    OneOrgsChannel:
        Consortium: SampleConsortium
        <<: *ChannelDefaults
        Application:
            <<: *ApplicationDefaults
            Organizations:
                - *Org1
            Capabilities:
                <<: *ApplicationCapabilities


```

create two dirs: ```channel-artifacts``` and ```genesis-block```


```sh
mkdir channel-artifacts
mkdir genesis-block

```

Run the following command to generate the genesis block inside ```work/configtx```:

```sh
configtxgen -profile ThreeOrgsOrdererGenesis -channelID system-channel -outputBlock ../genesis-block/genesis.block
```

```sh
export CHANNEL_NAME=channel1
```

Run the following command to create a Channel Configuration Transaction
```sh
configtxgen -profile ThreeOrgsChannel -outputCreateChannelTx ../channel-artifacts/$CHANNEL_NAME.tx -channelID $CHANNEL_NAME
```

Run the following command to  create the Anchor Peer Transactions for each peer org
```sh
configtxgen -profile ThreeOrgsChannel -outputAnchorPeersUpdate ../channel-artifacts/Org1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org1MSP

configtxgen -profile ThreeOrgsChannel -outputAnchorPeersUpdate ../channel-artifacts/Org2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org2MSP

configtxgen -profile ThreeOrgsChannel -outputAnchorPeersUpdate ../channel-artifacts/Org3MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org3MSP
```

### Start network

Note: Read the file ```/fabric-samples/test-network/scripts/envVar.sh```

Copy ```docker/docker-compose-test-net.yaml``` file and rename ```docker-compose-test-net.yaml``` to ```docker-compose-net.yaml```. Or use ```cat``` command and append to a file ```>>```  e.g. ```cat x.yaml >> new.yaml```.

```docker-compose-net.yaml``` contains the container configuration details for the peers and orders.

In ```docker-compose-net.yaml``` you need to add the orgs and change the network name to anyname you prefer.

Start on a new terminal ```docker-compose up```

Your containers should run now...

### Create a channel

First you need to setup env for each of the org1, org2, and org3  

Second you need to create a channel then you need to join  org1, org2, org3 to the channel
use: ```peer channel create ``` to create the channel, and  ```peer channel join```
 
Third you need to update the anchor peer for each org
```peer channel update -o localhost:7050 ```
