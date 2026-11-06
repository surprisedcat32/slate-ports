#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

git clone --depth=1 https://github.com/dylanaraps/neofetch.git
cd "$(basename "$(echo "$(grep -oE "https?://[^ ]+" <<< "&" | tail -1)" | sed "s/.git$//" | sed "s|.*/||")")"

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

make DESTDIR="$DESTDIR" install
