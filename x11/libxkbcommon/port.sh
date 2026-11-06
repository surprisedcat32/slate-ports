
#!/bin/sh
set -e

cd "${PORT_DIR:-/usr/ports}/x11/libxkbcommon"

curl -LO https://github.com/xkbcommon/libxkbcommon/archive/refs/tags/xkbcommon-1.13.2.tar.gz
tar -xf xkbcommon-1.13.2.tar.gz
cd libxkbcommon-xkbcommon-1.13.2

meson setup build \
    --prefix=/usr \
    --libdir=lib \
    --buildtype=release \
    -Denable-x11=true \
    -Denable-wayland=false \
    -Denable-docs=false \
    -Denable-tools=true \
    -Denable-bash-completion=false

ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install

