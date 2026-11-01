
#!/bin/bash
set -e

cd /usr/ports/dev/bison

curl -LO https://ftp.gnu.org/gnu/bison/bison-3.8.2.tar.xz
tar -xf bison-3.8.2.tar.xz
cd bison-3.8.2

./configure \
    --prefix=/usr \
    --disable-nls

make -j"$(nproc)"
make DESTDIR="$DESTDIR" install

