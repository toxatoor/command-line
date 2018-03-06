#!/usr/bin/env bash

# Get half of available memory
memgb=$(( $(sysctl -n hw.memsize )  / 2147483648 ))

# Get hald of cpu cores
cpus=$(( $(sysctl -n hw.ncpu) / 2 ))

xhyve -m "${memgb}G" -c "$cpus" -A -s 0:0,hostbridge -l com1,stdio -s 31,lpc -s 2:0,virtio-net -s 4,virtio-blk,stor.img  -U $(uuid) \
\
-f kexec,imgs/xenial-server-cloudimg-amd64-vmlinuz-generic,imgs/xenial-server-cloudimg-amd64-initrd-generic,"earlyprintk=serial console=ttyS0 root=/dev/vda1 ro ds=nocloud-net;h=ubuntu;i=12345;s=https://raw.githubusercontent.com/toxatoor/command-line/master/xhyve-ubuntu-cloud/"

