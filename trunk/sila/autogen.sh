#!/bin/sh
# $Id: autogen.sh 61 2006-01-27 08:17:26Z choman $

if test "$*"; then
  ARGS="$*"
else
  test -f config.log && ARGS=`grep '^  \$ \./configure ' config.log | sed 's/^  \$ \.\/configure //' 2> /dev/null`
fi

#echo "Running autopoint..."
#autopoint

echo "Running aclocal..."
aclocal -I ../../tools/aclocal

echo "Running autoheader..."
autoheader

echo "Running libtoolize..."
libtoolize

echo "Running automake..."
automake --foreign --add-missing

echo "Running autoconf..."
autoconf

test x$NOCONFIGURE = x && echo "Running ./configure $ARGS" && ./configure $ARGS

