#!/bin/bash
set -euo pipefail

VERSION="0.4"
URL="https://github.com/surprisedcat32/slate/releases/download/${VERSION}/dev.tar.gz"

WORK=$(mktemp -d)
trap 'rm -rf "$WORK"' EXIT

curl -fsSL "$URL" -o "$WORK/dev.tar.gz"
tar -xzf "$WORK/dev.tar.gz" -C "$WORK"

# Copy the extracted tree into the staged root.
cp -a "$WORK"/. "$DESTDIR"/
