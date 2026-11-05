#!/bin/bash

cd /usr/ports/lib/zstd

curl -LO https://github.com/facebook/zstd/releases/download/v1.5.7/zstd-1.5.7.tar.gz

tar -xf zstd-1.5.7.tar.gz

cd zstd-1.5.7
make PREFIX=/usr
make DESTDIR="$DESTDIR" install PREFIX=/usr

