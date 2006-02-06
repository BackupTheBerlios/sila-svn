# Configure paths for libsila
# A hacked up version of Owen Taylor's gtk.m4 (Copyright 1997)
# $Id$

# Owen Taylor     97-11-3

dnl AM_PATH_LIBSILA([MINIMUM-VERSION, [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND [, MODULES]]]])
dnl Test for LIBSILA, and define LIBSILA_CFLAGS and LIBSILA_LIBS
dnl
AC_DEFUN([AM_PATH_LIBSILA],
[dnl 
dnl Get the cflags and libraries from the libsila-config script
dnl
AC_ARG_WITH(libsila-prefix,[  --with-libsila-prefix=PFX   Prefix where libsila is installed (optional)],
            libsila_config_prefix="$withval", libsila_config_prefix="")
AC_ARG_WITH(libsila-exec-prefix,[  --with-libsila-exec-prefix=PFX Exec prefix where libsila is installed (optional)],
            libsila_config_exec_prefix="$withval", libsila_config_exec_prefix="")
AC_ARG_ENABLE(libsilatest, [  --disable-libsilatest       Do not try to compile and run a test libsila program],
		    , enable_libsilatest=yes)

  if test x$libsila_config_exec_prefix != x ; then
     libsila_config_args="$libsila_config_args --exec-prefix=$libsila_config_exec_prefix"
     if test x${LIBSILA_CONFIG+set} != xset ; then
        LIBSILA_CONFIG=$libsila_config_exec_prefix/bin/libsila-config
     fi
  fi
  if test x$libsila_config_prefix != x ; then
     libsila_config_args="$libsila_config_args --prefix=$libsila_config_prefix"
     if test x${LIBSILA_CONFIG+set} != xset ; then
        LIBSILA_CONFIG=$libsila_config_prefix/bin/libsila-config
     fi
  fi

  AC_PATH_PROG(LIBSILA_CONFIG, libsila-config, no)
  min_libsila_version=ifelse([$1], ,0.1.0,$1)
  AC_MSG_CHECKING(for libsila - version >= $min_libsila_version)
  no_libsila=""
  if test "$LIBSILA_CONFIG" = "no" ; then
    no_libsila=yes
  else
    LIBSILA_CFLAGS=`$LIBSILA_CONFIG $libsila_config_args --cflags`
    LIBSILA_CXXFLAGS=`$LIBSILA_CONFIG $libsila_config_args --cxxflags`
    LIBSILA_LIBS=`$LIBSILA_CONFIG $libsila_config_args --libs`
    libsila_config_major_version=`$LIBSILA_CONFIG $libsila_config_args --version | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\1/'`
    libsila_config_minor_version=`$LIBSILA_CONFIG $libsila_config_args --version | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\2/'`
    libsila_config_micro_version=`$LIBSILA_CONFIG $libsila_config_args --version | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\3/'`
    if test "x$enable_libsilatest" = "xyes" ; then
      ac_save_CFLAGS="$CFLAGS"
      ac_save_CXXFLAGS="$CXXFLAGS"
      ac_save_LIBS="$LIBS"
      CFLAGS="$CFLAGS $LIBSILA_CFLAGS"
      CXXFLAGS="$CXXFLAGS $LIBSILA_CXXFLAGS"
      LIBS="$LIBSILA_LIBS $LIBS"
dnl
dnl Now check if the installed libsila is sufficiently new. (Also sanity
dnl checks the results of libsila-config to some extent
dnl
      rm -f conf.libsilatest
      AC_LANG_PUSH(C++)
      AC_RUN_IFELSE([
#include <sila/sila.h>
#include <cstdio>
#include <cstring>
#include <stdlib.h>

int 
main ()
{
  int major, minor, micro;
  char *tmp_version;

  system ("touch conf.libsilatest");

  /* HP/UX 9 (%@#!) writes to sscanf strings */
  tmp_version = strdup("$min_libsila_version");
  if (sscanf(tmp_version, "%d.%d.%d", &major, &minor, &micro) != 3) {
     printf("%s, bad version string\n", "$min_libsila_version");
     exit(1);
   }

  if ((libsila_major_version != $libsila_config_major_version) ||
      (libsila_minor_version != $libsila_config_minor_version) ||
      (libsila_micro_version != $libsila_config_micro_version))
    {
      printf("\n*** 'libsila-config --version' returned %d.%d.%d, but libsila (%d.%d.%d)\n", 
             $libsila_config_major_version, $libsila_config_minor_version, $libsila_config_micro_version,
             libsila_major_version, libsila_minor_version, libsila_micro_version);
      printf ("*** was found! If libsila-config was correct, then it is best\n");
      printf ("*** to remove the old version of libsila. You may also be able to fix the error\n");
      printf("*** by modifying your LD_LIBRARY_PATH enviroment variable, or by editing\n");
      printf("*** /etc/ld.so.conf. Make sure you have run ldconfig if that is\n");
      printf("*** required on your system.\n");
      printf("*** If libsila-config was wrong, set the environment variable LIBSILA_CONFIG\n");
      printf("*** to point to the correct copy of libsila-config, and remove the file config.cache\n");
      printf("*** before re-running configure\n");
    } 
#if defined (LIBSILA_MAJOR_VERSION) && defined (LIBSILA_MINOR_VERSION) && defined (LIBSILA_MICRO_VERSION)
  else if ((libsila_major_version != LIBSILA_MAJOR_VERSION) ||
	   (libsila_minor_version != LIBSILA_MINOR_VERSION) ||
           (libsila_micro_version != LIBSILA_MICRO_VERSION))
    {
      printf("*** libsila header files (version %d.%d.%d) do not match\n",
	     LIBSILA_MAJOR_VERSION, LIBSILA_MINOR_VERSION, LIBSILA_MICRO_VERSION);
      printf("*** library (version %d.%d.%d)\n",
	     libsila_major_version, libsila_minor_version, libsila_micro_version);
    }
#endif /* defined (LIBSILA_MAJOR_VERSION) ... */
  else
    {
      if ((libsila_major_version > major) ||
        ((libsila_major_version == major) && (libsila_minor_version > minor)) ||
        ((libsila_major_version == major) && (libsila_minor_version == minor) && (libsila_micro_version >= micro)))
      {
        return 0;
       }
     else
      {
        printf("\n*** An old version of libsila (%d.%d.%d) was found.\n",
               libsila_major_version, libsila_minor_version, libsila_micro_version);
        printf("*** You need a version of libsila newer than %d.%d.%d. The latest version of\n",
	       major, minor, micro);
        printf("*** libsila is always available from http://www.libsilalibrary.org.\n");
        printf("***\n");
        printf("*** If you have already installed a sufficiently new version, this error\n");
        printf("*** probably means that the wrong copy of the libsila-config shell script is\n");
        printf("*** being found. The easiest way to fix this is to remove the old version\n");
        printf("*** of libsila, but you can also set the LIBSILA_CONFIG environment to point to the\n");
        printf("*** correct copy of libsila-config. (In this case, you will have to\n");
        printf("*** modify your LD_LIBRARY_PATH enviroment variable, or edit /etc/ld.so.conf\n");
        printf("*** so that the correct libraries are found at run-time))\n");
      }
    }
  return 1;
}
],, no_libsila=yes,[echo $ac_n "cross compiling; assumed OK... $ac_c"])
       AC_LANG_POP
       CFLAGS="$ac_save_CFLAGS"
       CXXFLAGS="$ac_save_CXXFLAGS"
       LIBS="$ac_save_LIBS"
     fi
  fi
  if test "x$no_libsila" = x ; then
     AC_MSG_RESULT(yes)
     ifelse([$2], , :, [$2])     
  else
     AC_MSG_RESULT(no)
     if test "$LIBSILA_CONFIG" = "no" ; then
       echo "*** The libsila-config script installed by libsila could not be found"
       echo "*** If libsila was installed in PREFIX, make sure PREFIX/bin is in"
       echo "*** your path, or set the LIBSILA_CONFIG environment variable to the"
       echo "*** full path to libsila-config."
     else
       if test -f conf.libsilatest ; then
        :
       else
          echo "*** Could not run libsila test program, checking why..."
          CFLAGS="$CFLAGS $LIBSILA_CFLAGS"
          CXXFLAGS="$CXXFLAGS $LIBSILA_CFLAGS"
          LIBS="$LIBS $LIBSILA_LIBS"
          AC_LANG_PUSH(C++)
          AC_LINK_IFELSE([
#include <oxml/oxml.h>
#include <stdio.h>
int main() {
return ((libsila_major_version) || (libsila_minor_version) || (libsila_micro_version)); 
}
],
        [ echo "*** The test program compiled, but did not run. This usually means"
          echo "*** that the run-time linker is not finding libsila or finding the wrong"
          echo "*** version of libsila. If it is not finding libsila, you'll need to set your"
          echo "*** LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf to point"
          echo "*** to the installed location  Also, make sure you have run ldconfig if that"
          echo "*** is required on your system"
	  echo "***"
          echo "*** If you have an old version installed, it is best to remove it, although"
          echo "*** you may also be able to get things to work by modifying LD_LIBRARY_PATH"
          echo "***"
          echo "*** If you have a RedHat 5.0 system, you should remove the libsila package that"
          echo "*** came with the system with the command"
          echo "***"
          echo "***    rpm --erase --nodeps libsila libsila-devel" ],
        [ echo "*** The test program failed to compile or link. See the file config.log for the"
          echo "*** exact error that occured. This usually means libsila was incorrectly installed"
          echo "*** or that you have moved libsila since it was installed. In the latter case, you"
          echo "*** may want to edit the libsila-config script: $LIBSILA_CONFIG" ])
          AC_LANG_POP
          CFLAGS="$ac_save_CFLAGS"
          LIBS="$ac_save_LIBS"
       fi
     fi
     LIBSILA_CFLAGS=""
     LIBSILA_CXXFLAGS=""
     LIBSILA_LIBS=""
     ifelse([$3], , :, [$3])
  fi
  AC_SUBST(LIBSILA_CFLAGS)
  AC_SUBST(LIBSILA_CXXFLAGS)
  AC_SUBST(LIBSILA_LIBS)
  rm -f conf.libsilatest
])

