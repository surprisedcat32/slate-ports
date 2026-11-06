
#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://ftp.gnu.org/gnu/m4/m4-1.4.21.tar.xz
tar -xf m4-1.4.21.tar.xz
cd "$(tar -tf m4-1.4.21.tar.xz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./configure \
    --prefix=/usr \
    --disable-nls

make  -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install

