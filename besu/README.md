
## Hardware Requirements 

[Besu](https://besu.hyperledger.org/en/stable/HowTo/Get-Started/System-Requirements/System-Requirements-Public/#system-requirements-for-public-networks).
### public networks and private networks require

* OS/CPU Architecture: Linux x86_64 (64-bit platform)
* 2 vCPUs
* 8 GiB of Memory RAM
* If you use VM you need to double the minimum requirements

- Fast synchronization approximately 1TB of Space. 
- Full synchronization approximately 3TB of Space.


Run this command to print the processor architecture in your system ```-p, --processor```

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


