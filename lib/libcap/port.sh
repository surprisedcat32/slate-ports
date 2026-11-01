
#!/bin/bash
set -e

cd /usr/ports/lib/libcap

curl -LO https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.78.tar.xz
tar -xf libcap-2.78.tar.xz
cd libcap-2.78

make -j"$(nproc)" \
    prefix=/usr \
    lib=lib \
    RAISE_SETFCAP=no

make \
    prefix=/usr \
    lib=lib \
    RAISE_SETFCAP=no \
    DESTDIR="$DESTDIR" \
    install

