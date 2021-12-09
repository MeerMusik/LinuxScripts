# List of required Libraries to build the Ultimate++ Framework.

Based on the Version in the Git Master Branch as of: 09.12.2021

This list is based on Manjaro KDE. If you use other Distributions, you are on your own.

Feel free to submit the Names for other Distributions.

I will keep this List updated when time permits. If in doubt, check the following Files for up2date Informations:
1. [Makefile - UPP Repository](https://github.com/ultimatepp/ultimatepp/blob/master/Makefile)
2. [umkMakefile - UPP Repository](https://github.com/ultimatepp/ultimatepp/blob/master/umkMakefile)

## Names for X86_64 = 64-bit
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

## Names for X86 = 32-Bit:
1. lib32-freetype2
2. lib32-fontconfig
3. lib32-libx11
4. lib32-xcb
5. lib32expat
6. lib32-libpng
7. lib32-libxinerama
8. lib32-libxrender
9. lib32-libxft
10. lib32-libxdmcp
11. lib32-libxext
12. gtk+-3.0 = lib32-gtk3
12. lib32-libnotify

### Limitation to build X86 on a X86_64 Distribution
In addition to the above mentioned Libraries, you also need the Lib32 / Libx32 Versions of GLIB2 and its dependencies.

The below List is not complete! 32-Bit Binaries on a 64-Bit Machine in 2021 is a horrible experience with GLIB2 and the GNOME Framework and Libraries in general. Aside from the Fact, that GNOME is a horrible experience in itself.

You also need to install:
1. lib32-pcre2
2. ???

As of December 2021, the Version of GLIB2 available in AUR was last updated in 2015. This Version is horribly outdated and should not be used anymore these Days! Not only because of Bugs and wrong dependencies, but also because of Security Issues that have been fixed in newer Versions.

If you really need to build the IDE and or UMK as 32-Bit Binaries, make sure to use a Distribution which ships Library Versions which are not horribly outdated.

Also if you can, switch to a 64-Bit capable PC or Laptop. Every CPU made from April 2003 (AMD) and June 2004 (Intel) is capable of X86_64. No one should use a X86 System anymore these Days. Using old existing Hardware for whatever Reason is an exception of course.

Conclusion: I will publish the broken X86 = 32-Bit Scripts but make sure they are marked as problematic. Feel free to play around with them and send a Merge / Pull Request.

Feel free to create an Issue and submit Infos for other Platforms.