
#!/bin/bash
set -e

cd /usr/ports/dev/libtool

curl -LO https://ftp.gnu.org/gnu/libtool/libtool-2.5.4.tar.xz
tar -xf libtool-2.5.4.tar.xz
cd libtool-2.5.4

./configure \
    --prefix=/usr \
    --disable-nls

make  -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install -j"$MAKETHREADS"

