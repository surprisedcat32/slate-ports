
#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://download.samba.org/pub/rsync/src/rsync-3.5.1.tar.gz
tar -xf rsync-3.5.1.tar.gz
cd "$(tar -tf rsync-3.5.1.tar.gz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./configure \
    --prefix=/usr \
    --disable-xxhash \
    --disable-zstd \
    --disable-lz4

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install

