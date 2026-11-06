#!/bin/sh
curl -LO https://download.gnome.org/sources/intltool/0.40/intltool-0.40.6.tar.gz
tar -xf intltool-0.40.6.tar.gz
cd intltool-0.40.6
./configure --prefix=/usr
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
