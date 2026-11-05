
#!/bin/bash
set -e

cd /usr/ports/dev/gdb

curl -LO https://ftp.gnu.org/gnu/gdb/gdb-18.1.tar.xz
tar -xf gdb-18.1.tar.xz
cd gdb-18.1

mkdir -p build
cd build

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

