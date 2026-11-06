#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://ftp.gnu.org/gnu/gcc/gcc-15.2.0/gcc-15.2.0.tar.xz
tar -xf gcc-15.2.0.tar.xz

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

./contrib/download_prerequisites

mkdir -p build
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

TARGET=x86_64-linux-musl
BUILD="$(../config.guess)"

CC=gcc \
CXX=g++ \
../configure \
    --build="$BUILD" \
    --host="$BUILD" \
    --target="$TARGET" \
    --prefix=/usr \
    --with-sysroot=/ \
    --with-native-system-header-dir=/usr/include \
    --enable-languages=c,c++ \
    --disable-bootstrap \
    --disable-multilib \
    --disable-nls \
    --disable-werror \
    --disable-libsanitizer \
    --disable-libssp \
    --disable-libvtv \
    --disable-libquadmath \
    --disable-libgomp \
    --disable-libatomic

make  -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install

