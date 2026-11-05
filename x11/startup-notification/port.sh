#!/bin/bash
set -e
cd /usr/ports/x11/startup-notification

curl -LO https://www.freedesktop.org/software/startup-notification/releases/startup-notification-0.12.tar.gz
tar -xf startup-notification-0.12.tar.gz
cd startup-notification-0.12

./configure --prefix=/usr --disable-static

make
make DESTDIR="$DESTDIR" install
