#!/bin/sh
tar -xf /usr/prebuilt/devs.tar.gz -C / --strip-components=1
touch /usr/ports/installed/devel
