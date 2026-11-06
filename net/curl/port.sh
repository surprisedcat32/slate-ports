
#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://curl.se/download/curl-8.23.0.tar.xz
tar -xf curl-8.23.0.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./configure \
    --prefix=/usr \
    --with-openssl \
    --with-zlib \
    --disable-ldap \
    --disable-ldaps \
    --disable-rtsp \
    --disable-dict \
    --disable-telnet \
    --disable-tftp \
    --disable-pop3 \
    --disable-imap \
    --disable-smtp \
    --disable-gopher \
    --disable-mqtt \
    --without-libpsl \
    --without-libidn2 \
    --without-brotli \
    --without-zstd \
    --without-libssh2 \
    --without-nghttp2 \
    --without-nghttp3

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install

