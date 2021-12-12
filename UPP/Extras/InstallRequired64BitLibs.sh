#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/LinuxScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# LinuxScripts
# Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
echo This Section of the Script has been directly copied from the UPP Install Script, which is Part of the Linux Source Archive. Get the latest Version from:
echo https://www.ultimatepp.org/www$uppweb$download$en-us.html

AskContinue()
{
  read -p "Continue (Y/n)?" answer
  if [ "$answer" != "${answer//[nN]/x}" ]; then
	 exit;
  fi
}

uname=`uname`
echo $uname

if [ -x "$(command -v apt-get)" ]; then
  DEP="apt-get install g++ clang make libgtk-3-dev libnotify-dev libbz2-dev libssl-dev xdotool"
elif [ -x "$(command -v yum)" ]; then
  DEP="yum install gcc-c++ clang make gtk3-devel libnotify-devel bzip2-devel freetype-devel openssl-devel"
elif [ -x "$(command -v dnf)" ]; then
  DEP="dnf install gcc-c++ clang make gtk3-devel libnotify-devel bzip2-devel freetype-devel openssl-devel"
elif [ -x "$(command -v urpmi)" ]; then
  DEP="urpmi install gcc-c++ clang make gtk3-devel libnotify-devel bzip2-devel freetype-devel openssl-devel"
elif [ -x "$(command -v zypper)" ]; then
  DEP="zypper install gcc-c++ clang make gtk3-devel libnotify-devel bzip2-devel freetype-devel libopenssl-devel"
elif [ -x "$(command -v pacman)" ]; then
  DEP="pacman -Sy --needed gcc make zlib bzip2 gtk3 libnotify openssl clang pkgconfig gdb"
elif [ -x "$(command -v pkg)" ]; then
  DEP="pkg install bash gmake gtk3 libnotify llvm90 pkgconf"
  if [[ "$uname" == 'SunOS' ]]; then
     DEP="pkg install bash gtk3 libnotify developer/clang-80 build-essential"
  fi
elif [ -x "$(command -v pkg_add)" ]; then
  DEP="pkg_add bash gmake gtk3 libnotify clang-devel"
fi

if [[ "$uname" == 'OpenBSD' ]]; then
  DEP=""
fi

if [ -z "$DEP" ]; then
  if [[ "$uname" == 'OpenBSD' ]]; then
    echo Automatic dependency installation is not supported on OpenBSD.
    echo See README for details.
  else
    echo Packaging system could not be identified.
    echo Automatic dependency installation has failed.
    echo You will have to install the required packages manually.
  fi
  echo Please make sure that build dependencies are satisfied.
else
  echo The following command should be used to install the required packages:
  echo
  echo sudo $DEP
  echo
  echo Install script can run this command for you, but that will require your sudo password.
  read -p "Do you want the script to do that (Y/n)?" answer
  if [ "$answer" == "${answer//[nN]/x}" ]; then
     if ! eval 'sudo $DEP'; then
        echo Failed to install all required packages.
        echo You will have to install the required packages manually.
     fi
  else
     echo Please make sure that all build dependencies are satisfied.
  fi
  fi
# End of the copied Install Script
exit
