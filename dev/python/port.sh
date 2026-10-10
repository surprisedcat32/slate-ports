#!/bin/bash

cd /usr/ports/dev/python

wget https://www.python.org/ftp/python/3.13.7/Python-3.13.7.tgz

tar -xf Python-3.13.7.tgz

cd Python-3.13.7
make distclean

./configure \
  --prefix=/usr \
  --with-ensurepip=yes \
  --disable-test-modules \
  --without-doc-strings \
  --without-readline \
  ac_cv_func_uuid_generate_time_safe=no
sed -i 's/uuid_generate_time_safe(uuid)/0/' Modules/_uuidmodule.c
make -j"$(nproc)"
make install
