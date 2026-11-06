
#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.78.tar.xz
tar -xf libcap-2.78.tar.xz
cd "$(tar -tf libcap-2.78.tar.xz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

make \ -j"$MAKETHREADS"
    prefix=/usr \
    lib=lib \
    RAISE_SETFCAP=no

make \ -j"$MAKETHREADS"
    prefix=/usr \
    lib=lib \
    RAISE_SETFCAP=no \
    DESTDIR="$DESTDIR" \
    install

