#!/bin/sh
#!!!!!!!!! Experimental
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.18.55.tar.xz
tar -xf linux-6.18.55.tar.xz
cd "$(tar -tf linux-6.18.55.tar.xz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cp /boot/slate-kernel.config .
make olddefconfig -j"$MAKETHREADS"
make -j"$MAKETHREADS"
cp arch/x86/boot/bzImage /boot/slate-kernel
