#!/bin/bash

export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig:$PKG_CONFIG_PATH

export GLIB_CFLAGS="-I$PREFIX/include/glib-2.0 -I$PREFIX/lib/glib-2.0/include"
export GLIB_LIBS="-L$PREFIX/lib -lglib-2.0 -lgobject-2.0 -lgmodule-2.0 -lgio-2.0"

autoreconf -vfi
./configure --prefix=$PREFIX \
  --disable-static \
  --enable-relocatable \
  --disable-vala \
  CFLAGS="-I$PREFIX/include" \
  LDFLAGS="-L$PREFIX/lib"
make
make install
