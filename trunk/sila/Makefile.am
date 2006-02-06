# $Id: Makefile.am 26 2006-01-21 14:02:00Z choman $

SUBDIRS = src scripts

docs_DOCS = AUTHORS ChangeLog COPYING INSTALL NEWS README
docsdir = $(prefix)/share/doc/@PACKAGE@

EXTRA_DIST = libsila.m4 libsila.pro doxygen.cfg libsila.pc
bin_SCRIPTS = libsila-config
BUILT_SOURCES = libsila-config
sila-config: libsila-config.in

m4datadir = $(datadir)/aclocal
m4data_DATA = libsila.m4

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = libsila.pc

gen-docs: doxygen.cfg
	doxygen doxygen.cfg

install-docs:
	$(mkinstalldirs) $(docsdir)
	for doc in $(docs_DOCS); do \
		$(INSTALL_DATA) $$doc $(docsdir)/$$doc; \
		echo "installing $$doc as $(docsdir)/$$doc"; \
	done

uninstall-docs:
	for doc in $(docs_DOCS); do \
		rm -f $(docsdir)/$$doc; \
		echo "removing $(docsdir)/$$doc" ; \
	done

install-data-local: install-docs

uninstall-local: uninstall-docs


ACLOCAL_AMFLAGS = -I m4
