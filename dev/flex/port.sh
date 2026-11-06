
#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz
tar -xf flex-2.6.4.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

./configure \
    --prefix=/usr \
    --disable-nls

make  -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install

