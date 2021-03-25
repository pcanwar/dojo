
Work with CA:

 
```sh
./network.sh down
```

```sh
./network.sh up createChannel -ca -c channel1
```

Identity name,

Organization the identity belongs to,

The identity’s role-based capabilities,

Identity type (e.g. peer, admin, user, etc.)

----

<br/>

1st find the line in the ca_org1 under the service section 

(Reminder: this file can be found in fabric-samples/test-network/docker dir)

Replace this line:
```command: sh -c 'fabric-ca-server start -b admin:adminpw -d'```
with the following:
```command: /bin/bash```

and after that in that same section add new entry under image line```tty: true```
this is to ensure the Fabric CA server is not started when the Docker container starts


Run this to list all of the Docker containers so you find the container to execute

```sh
docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Command}}"
```

You need to be in the Fabric CA container to access ```fabric-ca-server``` commands.
```sh
docker exec -it ca_org1 bash
```
check this command and if you didn't see anything you need to restart the Fabric CA container. 

```sh
fabric-ca-server --help
```
List Identities:

```sh
fabric-ca-client identity list * -u http://localhost:7054
```


### Initialize:

lets configure CA and then start it up. ```fabric-ca-server init``` generates the configuration file

-b name:pass

#### Configur

```sh
fabric-ca-server init -b caAdmindojo:admindojo
```

if there is an error while initializing the CA server, remove all previous initialized files artifacts:

```sh
cd /etc/hyperledger/fabric-ca-server
rm ca-cert.pem ca-key.pem fabric-ca-server-config.yaml
```

check the registry section in the ```ca-server-config``` file under ``` cd $FABRIC_CA_HOME ``` dir
it contains the values we passed in for name and password.


#### start

```sh
fabric-ca-server start -b caAdmindojo:admindojo
```
Listening on ```port#```  

Leave the CA server running.

### Enroll Identities and Peers
open a new terminal back to the CA server

```sh
docker exec -it ca_org1 bash
```

```sh
fabric-ca-client enroll -uhttp://caAdmindojo:admindojo@localhost:port#
```

Register an admin identity that has privileges to revoke org certificates
check the flags such as id.attrs flag provided to a register command
```sh
fabric-ca-client register --id.name Org1Administrator --id.affiliation org1 --id.type admin --id.attrs 'hf.Registrar.Roles=peer,hf.GenCRL=true, admin=true:ecert, hf.Revoker=true' --id.secret Org1Dojos -u http://localhost:7054
```

enroll it
```sh
fabric-ca-client enroll -uhttp://Org1Administrator:Org1Dojos@localhost:7054 -M$FABRIC_CA_HOME/msp/Org1Administrator
```

List all keys and certs for the Org1Administrator identity:
```sh
ls $FABRIC_CA_HOME/msp/Org1Administrator
```

create a peer identity for org1:
```sh
fabric-ca-client register --id.name peer1 \
--id.affiliation org1 --id.type peer \
--id.secret 'IAMAPEER!' \
-u http://Org1Administrator:Org1Dojos@localhost:7054
```

Now enroll this identity:
```sh
fabric-ca-client enroll -u http://peer1:'IAMAPEER!'@localhost:7054 -M $FABRIC_CA_HOME/msp/peer
```


