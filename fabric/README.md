

## Hardware Requirements 

* OS/CPU Architecture: Linux x86_64 (64-bit platform)
* 2 vCPUs
* 4 GiB of Memory RAM (Minimum)
* Free disk space: (/boot: 128MiB)- ($HOME: 30GiB) 
* If you want to use VM you need to double the minimum requirements since both the host OS and the guest OS need enough CPU/RAM.


Run this command to print the processor architecture in your system ```-p```, ```--processor```

  ```sh
  uname -p
  ```

Run this command nproc(1) to print the number of CPUS processing units available in your system

```sh
nproc
```

Check your system Memory RAM: 

```sh
free -h | awk '/^Mem/ {print $2}'
```

Check free disk space of the the home dir 

```sh
df -h --output=avail $HOME
```

## Software Requirements 

Linux (ubuntu)
To connect to the instance system use in the cloud you can access the system using ```ssh```
- [keygen] - Create a new key pair 

Open a terminal and run the following command:
```sh
ssh-keygen 
```
It generates two files, by default called ``id_rsa`` and ```id_rsa.pub```. 

Copy the contents of the ```.pub``` file, and paste it into the SSH key content field
```sh
cat ~/.ssh/id_rsa.pub
```


## Installation
Steps to take before installing the Farbric platfrom

update and upgrade the system
```sh
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install software-properties-common
```

Again update the system
```sh 
sudo apt-get update
```

#### Install git
```sh 
sudo apt-get install git
```
 
Before running any git clone commands, run the following commands:
```sh 
git config --global core.autocrlf false
git config --global core.longpaths true
```

#### Install cURL 
```sh 
sudo apt-get install curl 
```
Add golang PPA based on the version and install the golang language: [golang](https://github.com/golang/go/wiki/Ubuntu)
```sh 
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt install golang-go
```

#### Install an editor such as vim
```sh 
sudo apt-get install vim
```

Add nodejs PPA based on the version and install the nodejs language: [Node.js](https://nodejs.org/)
```sh 
curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash -
sudo apt-get install -y nodej
```
You may also need development tools to build native addons:
```sh 
sudo apt-get install gcc g++ make
```
#### Python

install python2.7
```sh 
sudo apt-get install python2.7
```
#### Docker

Before you install Docker we need to update and insatll some paclages such as APT transport, A certificate authority (CA), and GnuPG for allowing encrypting and signing data and communications. 
1- SET UP THE REPOSITORY
```sh 
sudo apt update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release
```
2- Add Docker’s official GPG key:
```sh 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```
Add: add-apt-repository:
```sh 
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   Stable"
 ```
Update 
```sh 
sudo apt-get update
```
if there is an issue with the system that is Unable to locate package check these links 

https://docs.docker.com/engine/install/ubuntu/

https://unix.stackexchange.com/questions/363048/unable-to-locate-package-docker-ce-on-a-64bit-ubuntu

Install Docer Engine 
```sh 
 apt-get install docker-ce docker-ce-cli containerd.io
 apt-get install docker-compose
```

If there is an permission issue on docker.sock you need to check the sock 
```sh
sudo chmod +x /var/run/docker.sock
```

Change the permissions for docker-compose

```sh
sudo chmod +x /usr/bin/docker-compose
```


Make sure these packages: curl, npm, docker, docker-compose, go, python, and node are installed. 
```sh
git -v

python --version

docker -v

docker-compose --version

curl --version

```


Restart the system

```sh
sudo reboot now
```


### Fabric

Make sure the docker daemon is running. [Docker and Docker Compose](https://hyperledger-fabric.readthedocs.io/en/release-2.2/prereqs.html#docker-and-docker-compose)

```sh
sudo systemctl start docker
```
Optional: If you want the docker daemon to start when the system starts, use the following:
```sh
sudo systemctl enable docker
```

#### Create and config a user

Create user account in the system using:  adduser __name__
```sh
sudo adduser fabric
```
Ass your user to the sudo group also to have administrative rights
```sh
sudo usermod -aG sudo fabric
```
Add your user to the docker group.
```sh
sudo usermod -a -G docker fabric
```



### Install simple network:
https://hyperledger-fabric.readthedocs.io/en/release-2.2/install.html
```sh
mkdir fabric
cd fabric
curl -sSL https://bit.ly/2ysbOFE | bash -s
```
 
Check the images in docker
```sh
dockers images
```

The binary of fabric is under ```fabric-samples/bin```
You can add to ```.profile```

Path to bin: /home/fabric/fabric/fabric-samples/bin

```sh
echo 'export PATH="$PATH:/usr/local/go/bin:PATH_To_Bin"' >> $HOME/.profile
```

POINT GOPATH env var to the base fabric

```sh
echo 'export GOPATH="$HOME/fabric"' >> $HOME/.profile
```

Confirm and reload the change
```sh
source $HOME/.profile
```

To test the installations and to deploy a single RAFT (test) ordering service:

Go to the ```fabric-samples/test-network``` dir

```sh
cd fabric-samples/test-network
```

The script network.sh is to configure the network
```sh
./network.sh -h
```

   
To create a channel 
```sh
./network.sh up createChannel -c channel1
```


The deployment CC - asset-transfer (basic) chaincode
```sh
./network.sh deployCC -c channel1
```

docker ps returns an overview of all running containers.

```sh
docker ps
```

```sh
docker-compose -f docker/docker-compose-test-net.yaml ps
```

Display all logs

```sh
docker-compose -f docker/docker-compose-test-net.yaml logs -f -t
```

Start the network

```sh
docker-compose -f docker/docker-compose-test-net.yaml up -d
```



