
#!/bin/bash
set -e

cd /usr/ports/system/musl-libc

# Download musl
curl -fLO https://musl.libc.org/releases/musl-1.2.6.tar.gz

tar -xf musl-1.2.6.tar.gz
cd musl-1.2.6
mkdir -p patches
cd patches

curl -fL -o 0001-regex-overflow.patch \
    "https://git.musl-libc.org/cgit/musl/patch/?id=7813e9119eb5fe681b6750b8a033a0490bca0941"

curl -fL -o 0002-iconv-gb18030.patch \
    "https://git.musl-libc.org/cgit/musl/patch/?id=67219f0130ec7c876ac0b299046460fad31caabf"

curl -fL -o 0003-qsort-fix.patch \
    "https://git.musl-libc.org/cgit/musl/patch/?id=228da39e38c1cae13cbe637e771412c1984dba5d"

curl -fL -o 0004-qsort-bounds.patch \
    "https://git.musl-libc.org/cgit/musl/patch/?id=b3291b9a9f77f1f993d2b4f8c68a26cf09221ae7"

curl -fL -o 0005-qsort-shift.patch \
    "https://git.musl-libc.org/cgit/musl/patch/?id=5122f9f3c99fee366167c5de98b31546312921ab"

cd ..

for patchfile in patches/*.patch; do
    echo "Applying ${patchfile}..."
    patch -p1 < "$patchfile"
done

./configure

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install

