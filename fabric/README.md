

## Hardware Requirements 

* OS/CPU Architecture: Linux x86_64 (64-bit platform)
* 2 vCPUs
* 4 GiB of Memory RAM (Minimum)
* Free disk space: (/boot: 128MiB)- ($HOME: 30GiB) 
* If you want to use VM you need to double the minimum requirements since both the host OS and the guest OS need enough CPU/RAM.


Run this command to print the processor architecture in your system ```-p```, ```--processor```

  ```sh
  uname -p```


Run this command nproc(1) to print the number of CPUS processing units available in your system

```sh
nproc```

Check your system Memory RAM: 

```sh
free -h | awk '/^Mem/ {print $2}'```

Check free disk space of the the home dir 

```sh
df -h --output=avail $HOME```
