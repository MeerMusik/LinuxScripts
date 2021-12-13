# List of required Libraries to build the Ultimate++ Framework.

Based on the Version in the Git Master Branch as of: 13.12.2021

The Names in this List are based on Manjaro KDE. If you use other Distributions, you are basically on your own, as they are untested by me!

Feel free to submit the Names for other Distributions.

I will keep this List updated if time permits. If in doubt, check the following Files for up2date Informations:
1. [Makefile - UPP Repository](https://github.com/ultimatepp/ultimatepp/blob/master/Makefile)
2. [umkMakefile - UPP Repository](https://github.com/ultimatepp/ultimatepp/blob/master/umkMakefile)

## Install the minimum required Libraries for Ultimate++ for X86_64 on supported Distributions:
1. [InstallRequired64BitLibs.sh](UPP/Extras/InstallRequired64BitLibs.sh) !! Not guaranteed to be up2date !!
2. You can get the latest Version of the Install Script by downloading the latest Ultimate++ .tar.xz Archive for Linux: [UPP Downloads](https://www.ultimatepp.org/www$uppweb$download$en-us.html)

## Install the minimum required Libraries for Ultimate++ for X86 on supported Distributions:
!!! ONLY THE MANJARO SECTION HAS BEEN PORTED AND TESTED YET !!!
!!! YOU ALSO NEED TO ENABLE THE ARCH USER REPOSITORIES WHEN USING A ARCH BASED DISTRIBUTION !!!

!!! THE DEBIAN PART IS PROPABLY INCOMPLETE! I AM NOT SURE IF XDOTOOL IS AVAILABLE AS A X86 VARIANT !!!

1. [InstallRequired32BitLibs.sh](UPP/Extras/InstallRequired32BitLibs.sh) !! Not guaranteed to be up2date !!
2. You can get the latest Version of the Install Script by downloading the latest Ultimate++ .tar.xz Archive for Linux: [UPP Downloads](https://www.ultimatepp.org/www$uppweb$download$en-us.html)

Feel free to create an Issue, update the Script and create a Merge Request!

## List of Library Names
In case the Compiler or Linker complains about missing Libraries, have a look at the below List.

As I compile directly from the Git Source, this List will probably only updated once or twice a year. And only if necessary.

If in doubt, use the above provided Links to the Makefile and umkMakefile to be sure to get the most up2date Informations.

### Manjaro: X86_64 = 64-bit
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

### Manjaro: X86 = 32-Bit:
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

## Future additions
Feel free to create an Issue and submit Infos for other Platforms.
