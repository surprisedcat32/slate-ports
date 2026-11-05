
#!/bin/bash
set -e

cd /usr/ports/dev/m4

curl -LO https://ftp.gnu.org/gnu/m4/m4-1.4.21.tar.xz
tar -xf m4-1.4.21.tar.xz
cd m4-1.4.21

./configure \
    --prefix=/usr \
    --disable-nls

make  -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install -j"$MAKETHREADS"

