#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

git clone --depth 1 https://github.com/anholt/libepoxy.git
cd "$(basename "$(echo "$(grep -oE "https?://[^ ]+" <<< "&" | tail -1)" | sed "s/.git$//" | sed "s|.*/||")")"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

meson setup build --prefix=/usr -Dtests=false
meson compile -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" meson install -C build
