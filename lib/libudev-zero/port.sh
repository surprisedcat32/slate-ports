#!/bin/bash
cd /usr/ports
git clone https://github.com/illiliti/libudev-zero.git
cd libudev-zero
meson setup build --prefix=/usr
meson compile -C build -j"$(nproc)"
meson install -C build
