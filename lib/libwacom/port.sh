#!/bin/bash
python3 -m pip install pytest evdev pyudev
cd /usr/ports/system/libwacom
curl -LO https://github.com/linuxwacom/libwacom/releases/download/libwacom-2.14.0/libwacom-2.14.0.tar.xz
tar -xf libwacom-2.14.0.tar.xz
cd libwacom-2.14.0
export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig
python3 -m pip install libevdev pyudev pytest evdev
sed -i "s/if get_option('b_sanitize') == 'none'/if false/" meson.build
meson setup build --prefix=/usr -Dtests=disabled
meson compile -C build -j"$(nproc)"
meson install -C build
