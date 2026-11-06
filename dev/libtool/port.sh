
#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://ftp.gnu.org/gnu/libtool/libtool-2.5.4.tar.xz
tar -xf libtool-2.5.4.tar.xz
cd "$(tar -tf libtool-2.5.4.tar.xz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./configure \
    --prefix=/usr \
    --disable-nls

make  -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install

