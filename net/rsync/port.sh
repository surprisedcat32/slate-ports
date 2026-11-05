
#!/bin/bash
set -e

cd /usr/ports/net/rsync

curl -LO https://download.samba.org/pub/rsync/src/rsync-3.5.1.tar.gz
tar -xf rsync-3.5.1.tar.gz
cd rsync-3.5.1

./configure \
    --prefix=/usr \
    --disable-xxhash \
    --disable-zstd \
    --disable-lz4

make
make DESTDIR="$DESTDIR" install

