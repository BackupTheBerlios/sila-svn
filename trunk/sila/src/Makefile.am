# $Id$

silaincludedir = $(includedir)/oniria/sila

EXTRA_DIST = sila_config.h.in

lib_LTLIBRARIES = libsila.la

libsila_la_CPPFLAGS = -Wall
libsila_la_LDFLAGS = -version-info $(LT_CURRENT):$(LT_REVISION):$(LT_AGE) \
		       -release $(LT_RELEASE) @LIBTOOL_EXTRA_LDFLAGS@
		       

nobase_silainclude_HEADERS = \
							sila.h \
							error.h \
							types.h \
							console.h
			     	
			     

libsila_la_SOURCES = \
					error_inc.cc \
					sila.cc \
					types.cc \
					console.cc
					

silainclude_DATA = sila_config.h
