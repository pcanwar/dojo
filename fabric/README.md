

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

Install git
```sh 
sudo apt-get install git
```
Install cURL 
```sh 
sudo apt-get install curl 
```
Add golang PPA based on the version and install the golang language: [golang](https://github.com/golang/go/wiki/Ubuntu)
```sh 
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt install golang-go
```

Install an editor such as vim
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
### Python

install python2.7
```sh 
sudo apt-get install python2.7
```
### Docker

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
