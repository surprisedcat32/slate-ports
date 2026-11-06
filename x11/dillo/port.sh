
#!/bin/sh
set -e

cd "${PORT_DIR:-/usr/ports}/x11/dillo

curl -LO https://github.com/dillo-browser/dillo/releases/download/v3.2.0/dillo-3.2.0.tar.bz2
tar -xf dillo-3.2.0.tar.bz2
cd dillo-3.2.0

LIBS="-lssl -lcrypto" ./configure \
    --prefix=/usr \
    --disable-threaded-dns \
    --enable-tls \
    --enable-openssl \
    --disable-mbedtls 

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install

