
#!/bin/bash
set -e

cd /usr/ports/system/e2fsprogs

curl -LO https://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/1.47.4/e2fsprogs-1.47.4.tar.gz
tar -xf e2fsprogs-1.47.4.tar.gz
cd e2fsprogs-1.47.4

./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --libdir=/usr/lib \
    --enable-elf-shlibs \
    --disable-nls \
    --disable-fuse2fs

make -j"$(nproc)"
make DESTDIR="$DESTDIR" install

