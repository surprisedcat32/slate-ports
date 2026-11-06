#!/bin/sh
set -e
cd "${PORT_DIR:-/usr/ports}/x11/startup-notification"

curl -LO https://www.freedesktop.org/software/startup-notification/releases/startup-notification-0.12.tar.gz
tar -xf startup-notification-0.12.tar.gz
cd startup-notification-0.12

./configure --prefix=/usr --disable-static

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
