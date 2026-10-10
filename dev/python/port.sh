#!/bin/bash


cd /usr/ports/dev/python

curl -LO https://www.python.org/ftp/python/3.13.7/Python-3.13.7.tgz

tar -xf Python-3.13.7.tgz

cd Python-3.13.7
make distclean
export CPPFLAGS="-I/usr/include"
export LDFLAGS="-L/usr/lib64 -L/usr/lib"
export LD_LIBRARY_PATH=/usr/lib64:/usr/lib
./configure \
  --prefix=/usr \
  --with-ensurepip=yes \
  --disable-test-modules \
  --without-doc-strings \
  --with-system-ffi
  ac_cv_func_uuid_generate_time_safe=no
sed -i 's/uuid_generate_time_safe(uuid)/0/' Modules/_uuidmodule.c
export LD_LIBRARY_PATH=/usr/lib64:/usr/lib
make -j"$(nproc)"
make install
ln -sf /usr/bin/python3.13 /usr/bin/python
