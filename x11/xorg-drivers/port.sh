#!/bin/sh
set -eu

PORT_DIR=/usr/ports/x11/xorg-drivers
WORK="$PORT_DIR/src"
PREFIX=/usr
LIBDIR=/usr/lib64
MODULEDIR="$LIBDIR/xorg/modules"

export PKG_CONFIG_PATH="/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}"
CC=gcc
mkdir -p "$WORK"
cd "$WORK"

build_driver() {
    name="$1"
    version="$2"

    archive="${name}-${version}.tar.xz"
    url="https://xorg.freedesktop.org/archive/individual/driver/$archive"

    if [ ! -f "$archive" ]; then
        curl -fL "$url" -o "$archive"
    fi

    src="${name}-${version}"
    if [ ! -d "$src" ]; then
        tar -xf "$archive"
    fi

    cd "$src"

    if [ -f configure ]; then
        ./configure \
            --prefix="$PREFIX" \
            --libdir="$LIBDIR" \
            --with-xorg-module-dir="$MODULEDIR"

        make -j"$(nproc)"
        make install
    else
        echo "ERROR: $src has no configure script"
        exit 1
    fi

    cd "$WORK"
}

# Legacy VGA support for virtual machines.
build_driver xf86-video-vesa 2.6.0

# Linux framebuffer support, if the guest kernel exposes /dev/fb0.
build_driver xf86-video-fbdev 0.5.1

# Modern keyboard/mouse input through libinput.
build_driver xf86-input-libinput 1.5.0

# Fallback input driver using Linux input events.
build_driver xf86-input-evdev 2.11.0

echo "Xorg drivers installed."

