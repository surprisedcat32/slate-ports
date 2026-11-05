#!/bin/bash
set -e
cd /usr/ports/dev/ruby
curl -LO https://cache.ruby-lang.org/pub/ruby/4.0/ruby-4.0.9.tar.xz
tar -xf ruby-4.0.9.tar.xz
cd ruby-4.0.9
./configure --prefix=/usr --disable-install-doc --enable-shared
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
