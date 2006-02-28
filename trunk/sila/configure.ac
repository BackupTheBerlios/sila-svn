dnl Process this file with autoconf to produce a configure script.
dnl $Id$

AC_PREREQ([2.52])

AC_INIT([libsila], [0.1.0], [choman@foto-koszalin.pl])
AC_CONFIG_AUX_DIR(scripts)
AC_CANONICAL_BUILD
AC_CANONICAL_HOST
AC_CANONICAL_TARGET
AM_INIT_AUTOMAKE(AC_PACKAGE_NAME, AC_PACKAGE_VERSION)
AM_MAINTAINER_MODE

AC_REVISION([$Revision: 61 $])
AC_CONFIG_SRCDIR([src/sila.cc])

AC_CONFIG_HEADERS(config.h)
AC_CONFIG_FILES([libsila-config
		 Makefile
		 scripts/Makefile 
		 src/Makefile		 
		 src/sila_config.h
		 libsila.pc
	 	 doxygen.cfg
		],
		[chmod -f +x libsila-config])

SILA_MAJOR_VERSION=0
SILA_MINOR_VERSION=1
SILA_MICRO_VERSION=0
SILA_INTERFACE_AGE=0
SILA_BINARY_AGE=0
SILA_VERSION=$SILA_MAJOR_VERSION.$SILA_MINOR_VERSION.$SILA_MICRO_VERSION

AC_SUBST(SILA_MAJOR_VERSION)
AC_SUBST(SILA_MINOR_VERSION)
AC_SUBST(SILA_MICRO_VERSION)
AC_SUBST(SILA_VERSION)
AC_SUBST(SILA_INTERFACE_AGE)
AC_SUBST(SILA_BINARY_AGE)

# libtool versioning
LT_RELEASE=$SILA_MAJOR_VERSION.$SILA_MINOR_VERSION
LT_CURRENT=`expr $SILA_MICRO_VERSION - $SILA_INTERFACE_AGE`
LT_REVISION=$SILA_INTERFACE_AGE
LT_AGE=`expr $SILA_BINARY_AGE - $SILA_INTERFACE_AGE`
AC_SUBST(LT_RELEASE)
AC_SUBST(LT_CURRENT)
AC_SUBST(LT_REVISION)
AC_SUBST(LT_AGE)
# Define version stuff
AC_DEFINE_UNQUOTED(SILA_MAJOR_VERSION, $SILA_MAJOR_VERSION, [sila major version])
AC_DEFINE_UNQUOTED(SILA_MINOR_VERSION, $SILA_MINOR_VERSION, [sila minor version])
AC_DEFINE_UNQUOTED(SILA_MICRO_VERSION, $SILA_MICRO_VERSION, [sila micro version])
AC_DEFINE_UNQUOTED(SILA_INTERFACE_AGE, $SILA_INTERFACE_AGE, [sila interface age])
AC_DEFINE_UNQUOTED(SILA_BINARY_AGE, $SILA_BINARY_AGE, [sila binary age])

dnl Checks for programs.
AC_PROG_CXX
AC_ISC_POSIX
AC_PROG_INSTALL
AC_PROG_LIBTOOL
#AC_LIBTOOL_EXTRA_LDFLAGS

dnl Checks for header files.
dnl AC_CHECK_HEADERS(stdio.h stdlib.h stdint.h errno.h string.h strings.h assert.h \
dnl		  unistd.h sys/select.h sys/time.h sys/types.h \
dnl		  malloc.h sys/socket.h netinet/in.h netdb.h fcntl.h],
dnl		 [],
dnl		 [AC_ERROR([cannot find one of required header file..
dnl		  your system is a bit strange.])])

#AC_CHECK_HEADERS([stringprep.h], [],
#		 [AC_MSG_ERROR([stringprep.h not found])])

dnl Checks for typedefs, structures, and compiler characteristics.

dnl Checks for library functions.
dnl AC_CHECK_FUNCS([malloc calloc free \
dnl		sprintf \
dnl		strlen strchr strcat strdup index \
dnl		memmove memcpy memcmp \
dnl		socket connect bind accept listen recv send \
dnl		gethostbyname htons htonl \
dnl		fcntl select close \
dnl		],
dnl	       [],
dnl	       [AC_ERROR([cannot find one of required functions..
dnl	          your system is a bit strange.])])

#AC_CHECK_LIB(idn, stringprep_convert, [], [AC_MSG_ERROR([libidn not found])])
AC_LANG_PUSH(C++)
#PKG_CHECK_MODULES(QT, [QtCore >= 4.0.1 QtXml >= 4.0.1])
AC_LANG_POP(C++)


AC_OUTPUT

