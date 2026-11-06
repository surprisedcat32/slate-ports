#!/bin/sh
set -euo pipefail

VERSION="3.8.4"
URL="https://github.com/cowsay-org/cowsay/archive/refs/tags/v${VERSION}.tar.gz"

WORK=$(mktemp -d)
trap 'rm -rf "$WORK"' EXIT

curl -fsSL "$URL" -o "$WORK/src.tar.gz"
tar -xzf "$WORK/src.tar.gz" -C "$WORK" --strip-components=1

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR
make PREFIX=/usr -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" PREFIX=/usr install
