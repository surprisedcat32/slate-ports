
#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/1.47.4/e2fsprogs-1.47.4.tar.gz
tar -xf e2fsprogs-1.47.4.tar.gz
cd "$(tar -tf e2fsprogs-1.47.4.tar.gz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --libdir=/usr/lib \
    --enable-elf-shlibs \
    --disable-nls \
    --disable-fuse2fs

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install

