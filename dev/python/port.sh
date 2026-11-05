#!/bin/bash
cd /usr/ports/dev/python

curl -LO https://www.python.org/ftp/python/3.13.7/Python-3.13.7.tgz
tar -xf Python-3.13.7.tgz

cd Python-3.13.7
make distclean

export CPPFLAGS="-I/usr/include"
export LDFLAGS="-L/usr/lib64 -L/usr/lib"
export LD_LIBRARY_PATH=/usr/lib64:/usr/lib

ac_cv_func_uuid_generate_time_safe=no ./configure \
  --prefix=/usr \
  --libdir=/usr/lib \
  --with-ensurepip=yes \
  --disable-test-modules \
  --without-doc-strings \
  --with-system-ffi

sed -i 's/uuid_generate_time_safe(uuid)/0/' Modules/_uuidmodule.c

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install

ln -sf python3.13 "$DESTDIR/usr/bin/python"
ln -sf python3.13 "$DESTDIR/usr/bin/python3"
cp Lib/* "$DESTDIR/usr/lub/python3.13"

