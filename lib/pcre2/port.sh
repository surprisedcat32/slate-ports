#!/bin/bash
cd /usr/ports/lib/pcre2
wget https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.44/pcre2-10.44.tar.bz2
tar -xjf pcre2-10.44.tar.bz2
cd pcre2-10.44
./configure --prefix=/usr
make -j"$(nproc)"
make install
