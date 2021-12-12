# List of required Libraries to build the Ultimate++ Framework.

Based on the Version in the Git Master Branch as of: 09.12.2021

This list is based on Manjaro KDE. If you use other Distributions, you are basically on your own, as they are untested by me!

Feel free to submit the Names for other Distributions.

I will keep this List updated when time permits. If in doubt, check the following Files for up2date Informations:
1. [Makefile - UPP Repository](https://github.com/ultimatepp/ultimatepp/blob/master/Makefile)
2. [umkMakefile - UPP Repository](https://github.com/ultimatepp/ultimatepp/blob/master/umkMakefile)

## Install the required Libraries for Ultimate++ for X86_64 on supported Distributions:
1. [InstallRequired64BitLibs.sh](UPP/Extras/InstallRequired64BitLibs.sh) !! Not guaranteed to be up2date !!
2. You can get the latest Version of the Install Script by downloading the latest Ultimate++ .tar.xz Archive for Linux: [UPP Downloads](https://www.ultimatepp.org/www$uppweb$download$en-us.html)

## Install the required Libraries for Ultimate++ for X86 on supported Distributions:
!!! ONLY THE MANJARO SECTION HAS BEEN PORTED YET !!!
!!! YOU ALSO NEED TO ENABLE THE ARCH USER REPOSITORIES WHEN USING A ARCH BASED DISTRIBUTION !!!

1. [InstallRequired32BitLibs.sh](UPP/Extras/InstallRequired32BitLibs.sh) !! Not guaranteed to be up2date !!
2. You can get the latest Version of the Install Script by downloading the latest Ultimate++ .tar.xz Archive for Linux: [UPP Downloads](https://www.ultimatepp.org/www$uppweb$download$en-us.html)

Feel free to create an Issue, update the Script and create a Merge Request!

## List of Library Names

### Manjaro: Names for X86_64 = 64-bit
1. freetype2
2. fontconfig
3. libx11
4. libxcb
5. expat
6. libpng
7. libxinerama
8. libxrender
9. libxft
10. libxdmcp
11. libxext
12. gtk+-3.0 = gtk3
13. libnotify

### Manjaro: Names for X86 = 32-Bit:
1. lib32-freetype2
2. lib32-fontconfig
3. lib32-libx11
4. lib32-libxcb
5. lib32-expat
6. lib32-libpng
7. lib32-libxinerama
8. lib32-libxrender
9. lib32-libxft
10. lib32-libxdmcp
11. lib32-libxext
12. gtk+-3.0 = lib32-gtk3
12. lib32-libnotify (Only available through AUR)

You can also try:
1. Run 'sudo pamac install multilib-devel' (For Manjaro; modify for your Distro as necessary!) - this should install the very basics for Multilib Developement as a starting point

## Limitation to build X86 on a X86_64 Distribution
In addition to the above mentioned Libraries, you also need the Lib32 / Libx32 Versions of GLIB2 and its dependencies.

If you really need to build the IDE and or UMK as 32-Bit Binaries, make sure to use a Distribution which ships Library Versions which are not horribly outdated.

Also if you can, switch to a 64-Bit capable PC or Laptop. Every CPU made from April 2003 (AMD) and June 2004 (Intel) is capable of running X86_64. No one should use a X86 System anymore these Days. Using old existing Hardware for whatever Reason is an exception of course.

Feel free to create an Issue and submit Infos for other Platforms.
