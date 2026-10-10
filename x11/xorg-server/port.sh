#!/bin/bash

cd /usr/ports/x11/xorg-server

git clone https://gitlab.freedesktop.org/xorg/xserver.git xorg-server

cd xorg-server

meson setup build   --prefix=/usr   -D xorg=true   -D xwayland=false   -D xephyr=false   -D xnest=false   -D xvfb=false   -D glamor=false   -D udev=false   -D systemd=false -D suid-wrapper=true

meson compile -C build -j"$(nproc)"

meson install -C build
