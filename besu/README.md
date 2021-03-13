
## Hardware Requirements 

[Besu](https://besu.hyperledger.org/en/stable/HowTo/Get-Started/System-Requirements/System-Requirements-Public/#system-requirements-for-public-networks). 
Linux
### public networks and private networks require

* OS/CPU Architecture: Linux x86_64 (64-bit platform)
* 2 vCPUs
* 8 GiB of Memory RAM
* If you want to use VM you need to double the minimum requirements since both the host OS and the guest OS need enough CPU/RAM.


- Fast synchronization approximately 1TB of Space. 
- Full synchronization approximately 3TB of Space.


Run this command to print the processor architecture in your system ```-p, --processor```

```sh
uname -p
```

Run this command [nproc(1)](https://man7.org/linux/man-pages/man1/nproc.1.html) to print the number of CPUS processing units available in your system

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


