
#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://ftp.gnu.org/gnu/gdb/gdb-18.1.tar.xz
tar -xf gdb-18.1.tar.xz
cd "$(tar -tf gdb-18.1.tar.xz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

mkdir -p build
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

../configure \
    --prefix=/usr \
    --disable-nls \
    --disable-werror \
    --with-system-readline \
    --with-expat \
    --with-system-zlib \
    --without-python \
    --without-guile \
    --without-babeltrace \
    --without-lzma

make  -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install

