#!/bin/bash

autoreconf -vfi
./configure --prefix=$PREFIX \
  --disable-static \
  --enable-relocatable \
  --disable-vala \
  PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig:$PKG_CONFIG_PATH \
  CFLAGS="-I$PREFIX/include" \
  LDFLAGS="-L$PREFIX/lib"
make
make install
