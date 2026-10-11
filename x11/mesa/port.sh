#!/bin/bash

cd /usr/ports/x11/mesa

git clone --depth=1 https://gitlab.freedesktop.org/mesa/mesa.git

cd mesa
export PYTHON=/usr/bin/python3.13
export PYTHONPATH=/usr/lib/python3.13/site-packages
export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig
python3 -m pip install pyyaml mako
meson setup build \
  --prefix=/usr \
  -Dplatforms=x11 \
  -Dgallium-drivers=softpipe \
  -Dvulkan-drivers= \
  -Dgbm=enabled \
  -Dglx=dri \
  -Dllvm=disabled \
  -Degl=enabled \
  -Dbuild-tests=false

meson compile -C build -j"$(nproc)"

meson install -C build
