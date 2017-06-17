REFInd Bootloader Setup
=======================

These two files are the ones used to configure refind on freebird. refind.conf
is located in /boot/EFI/refind/ and refind_linux.conf is located directly inside
/boot. Only refind_linux.conf is usually sufficient to boot linux from: the
linux system detected when refind does a scan on system startup is the one on
which refind_linux.conf changes take effect. The one inside the EFI folder is
used to setup even more customized boot loading (including icons, backgrounds
and so many other things). This is currently how I am loading Arch, because it
comes with a cool looking logo.

Both methods should work without problem however. Refer the 
[rEFInd](https://wiki.archlinux.org/index.php/REFInd) entry in the Arch Linux
wiki for more information.
