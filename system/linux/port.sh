#!/bin/sh
#!!!!!!!!! Experimental
cd "${PORT_DIR:-/usr/ports}/system/linux"
curl -LO https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.18.55.tar.xz
tar -xf linux-6.18.55.tar.xz
cd linux-6.18.55
cp /boot/slate-kernel.config .
make olddefconfig -j"$MAKETHREADS"
make -j"$MAKETHREADS"
cp arch/x86/boot/bzImage /boot/slate-kernel
