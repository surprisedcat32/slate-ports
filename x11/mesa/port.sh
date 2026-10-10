#!/bin/bash

cd /usr/ports/x11/mesa

git clone https://gitlab.freedesktop.org/mesa/mesa.git

cd mesa

meson setup build 
  --prefix=/usr 
  -D platforms=x11 
  -D gallium-drivers=softpipe,llvmpipe 
  -D vulkan-drivers=[] 
  -D egl=disabled 
  -D gbm=disabled 
  -D glx=dri 
  -D llvm=disabled

meson compile -C build -j"$(nproc)"

meson install -C build
