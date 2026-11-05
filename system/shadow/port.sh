#!/bin/sh

NAME=shadow
VERSION=4.20.3
ARCHIVE="shadow-${VERSION}.tar.xz"
URL="https://github.com/shadow-maint/shadow/releases/download/${VERSION}/${ARCHIVE}"

curl -LO "$URL"
tar -xf "$ARCHIVE"
cd "shadow-${VERSION}" || exit 1

./configure \
    --build=x86_64-pc-linux-gnu \
    --host=x86_64-linux-musl \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/sbin \
    --sysconfdir=/etc \
    --disable-nls \
    --without-libpam \
    --without-selinux \
    --without-acl \
    --without-attr

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install

chmod 4755 "$DESTDIR/usr/bin/passwd"
chmod 4755 "$DESTDIR/usr/bin/su"
