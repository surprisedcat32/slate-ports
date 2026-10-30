#!/bin/bash
slate install dev/dev

cd /usr/ports/lib/zstd

curl -LO https://github.com/facebook/zstd/releases/download/v1.5.7/zstd-1.5.7.tar.gz

tar -xf zstd-1.5.7.tar.gz

cd zstd-1.5.7
make -j"$(nproc)" PREFIX=/usr
make install PREFIX=/usr

