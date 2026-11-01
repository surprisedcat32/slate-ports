
#!/bin/bash
set -e

cd /usr/ports/net/curl

curl -LO https://curl.se/download/curl-8.23.0.tar.xz
tar -xf curl-8.23.0.tar.xz
cd curl-8.23.0

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

make -j"$(nproc)"
make DESTDIR="$DESTDIR" install

