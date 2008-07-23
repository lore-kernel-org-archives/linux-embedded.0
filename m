From: "sourya roy" <souryaroy@gmail.com>
Subject: Kernel not taking command line arguements from bootloader
Date: Wed, 23 Jul 2008 12:07:00 +0530
Message-ID: <a2cf9bac0807222337g6455f2ebo4af553d2bc77a5f2@mail.gmail.com>
References: <a2cf9bac0807222132y69a22c7bi5a46ca2fa5eba03b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=RJlQqY6DrTtwgv1oCPgeHNuJ3miMTb5ybi15yciz7VM=;
        b=Cl3p4WSYGnFtVbaSpNg8f75NzJ5p4hqNLjONNhd2rBalEv0LVv6/LAOLU7ExEA9b3f
         oQ/ZBIz4QslxU+oC7+sesYZUkOHv3ZLsQl6qtGQMJGHgq1eG2Z0WDKIVj38meRZKzHlQ
         Vki5JPW9BRrZ7iNEOKyewuKNGbVmN0utHs3Xk=
In-Reply-To: <a2cf9bac0807222132y69a22c7bi5a46ca2fa5eba03b@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Dear All,

I am trying to port linux to a Cogent CSB 637 board (AT91RM9200). The
kernel is loading up but is unable to mount the cramfs root filesystem
image from the flash memory.

I am using uMon as the bootloader and it seems that the it is not
passing the command line arguments to the kernel.

In the startlinux script (shell script to start the kernel, attached
with this email), the kernel command line is defined as:

heap -m 1024

# (note: -s creates a new string; -S appends to an existing string)
# (note: the trailing spaces are so that appends work as expected)
#
pm -s $MALLOC "mem=32M console=ttyS0,38400 "
pm -S $MALLOC "ip=$IPADD:$NFSSERVER:$GIPADD:$NETMASK::eth0:off "
#
# TODO: pick from and/or adapt one of the two following
# examples to specify the source of the root filesystem:
#
# this example uses MTD and flash for the root filesystem
pm -S $MALLOC "root=31:0 mtdparts=$TARGET:$ROOTDIR_SIZE@$ROOTDIR_BASE(root)ro "
#
# Example that tacks on video parameters
# (for the CSB625's 640x480 display, in this case)
# pm -S $MALLOC
"video=pxafb:mode:640x480-16,active,left:1,right:161,hsynclen:1,upper:0,lower:31,vsynclen:32,hsync:0,vsync:0,outputen:1,pixclockpol:0,pixclock:25000
"
#
# Launch the kernel, pass it the command line
call $APPRAMBASE 0 648 $MALLOC
exit
#

But the kernel gets booted with the default command line:

Kernel command line: mem=32M console=ttyS0,38400 initrd=0x20410000,3145728 rootw

I have also tried to pass the command line by typing it directly after
the call $APPRAMBASE, but of no avail.

call $APPRAMBASE 0 648 mem=32M console=ttyS0,38400
ip=$IPADD:$NFSSERVER:$GIPADD:$NETMASK::eth0:off root=31:0
mtdparts=$TARGET:$ROOTDIR_SIZE@$ROOTDIR_BASE(root)ro

Is it something wrong in the bootloader or some kernel configuration
problem? Is it something due to no/wrong ATAGs passed by the
bootloader?
(I am running a Kernel 2.6.26 image compiled using csb637_defconfig. I
have also tried the same with kernels 2.6.10, 2.6.20, 2.6.24 but I
still get the same error).

Thanks

Sourya

--
Sourya Roy
Electrical Engineering (Class of 2011)
Northwestern University
Evanston, Illinois

souryaroy@gmail.com

*****************************
The startlinux script for your reference:

###############################################################################
# GX-Linux Startup Script for both ROMFS and NFS Server Filesystem mounts
###############################################################################
# (c)2005 Microcross, Inc.
# Last update: 20050607
###############################################################################
#
#
# Files/Target defined in TFS (Tiny FileSystem)
set TARGET flash00
set ROOTDIR romdisk
set KERNEL zImage
#
# DHCPWAIT:
echo sleep 1...
sleep 1
if $ARG1 seq "nfs" goto BOOTNFS
if $IPADD seq DHCP goto DHCPWAIT
if $IPADD seq DHCPV goto DHCPWAIT
if $IPADD seq DHCPv goto DHCPWAIT
echo IP Address OK, $IPADD
#
# TODO: set this variable
# Set if you are going to use a TFTP server
set TFTPSERVER 192.168.0.220
###############################################################################
#
#
#
# check for filesystem image in flash
tfs base $ROOTDIR ROOTDIR_BASE
tfs size $ROOTDIR ROOTDIR_SIZE
#
# Verify that a seemingly-useful filesystemthe
# image is present; abort if it isn't
# (delete these two tests if you are using NFS exclusively)
if $ROOTDIR_BASE seq \$ROOTDIR_BASE goto NO_FILE
if $ROOTDIR_SIZE seq \$ROOTDIR_SIZE goto NO_FILE
#
# ok, we found what looks like a filesystem in flash,
# (based only on the name of the file)
# do some math to figure out where it is
set ROOTDIR_BASE=$ROOTDIR_BASE-$BOOTROMBASE
echo $ROOTDIR: size=$ROOTDIR_SIZE base=$ROOTDIR_BASE
#
# Check for a kernel
tfs base $KERNEL KERNEL_BASE
tfs size $KERNEL KERNEL_SIZE
#
if $KERNEL_BASE seq \$KERNEL_BASE goto GET_KERNEL
if $KERNEL_SIZE seq \$KERNEL_SIZE goto GET_KERNEL
#
# Found a kernel, load it into RAM
tfs cp $KERNEL $APPRAMBASE
echo $KERNEL: size=$KERNEL_SIZE base=$APPRAMBASE
#
# GOT_KERNEL:
#
# allocate memory for the kernel command line
# (as a side effect, this command sets $MALLOC)
heap -m 1024
#
###############################################################################
#
if $ARG1 seq "nfs" goto BOOTNFS
#
###############################################################################
#
# (note: -s creates a new string; -S appends to an existing string)
# (note: the trailing spaces are so that appends work as expected)
#
pm -s $MALLOC "mem=32M console=ttyS0,38400 "
pm -S $MALLOC "ip=$IPADD:$NFSSERVER:$GIPADD:$NETMASK::eth0:off "
#
# TODO: pick from and/or adapt one of the two following
# examples to specify the source of the root filesystem:
#
# this example uses MTD and flash for the root filesystem
pm -S $MALLOC "root=31:0 mtdparts=$TARGET:$ROOTDIR_SIZE@$ROOTDIR_BASE(root)ro "
#
# Example that tacks on video parameters
# (for the CSB625's 640x480 display, in this case)
# pm -S $MALLOC
"video=pxafb:mode:640x480-16,active,left:1,right:161,hsynclen:1,upper:0,lower:31,vsynclen:32,hsync:0,vsync:0,outputen:1,pixclockpol:0,pixclock:25000
"
#
# Launch the kernel, pass it the command line
call $APPRAMBASE 0 648 $MALLOC
exit
#
###############################################################################
#
# BOOTNFS:
#
###############################################################################
#
#
if $ARG2 sne \$ARG2 gosub SET_NFSSERVER
if $NFSSERVER seq \$NFSSERVER goto NO_NFSSERVER
#
if $ARG3 sne \$ARG3 gosub SET_NFSPATH
if $NFSPATH seq \$NFSPATH goto NO_NFSPATH
goto NFS_BOOT
#
# SET_NFSSERVER:
set NFSSERVER $ARG2
return
#
# SET_NFSPATH:
set NFSPATH $ARG3
return
#
#
# NFS_BOOT:
#
# (note: -s creates a new string; -S appends to an existing string)
# (note: the trailing spaces are so that appends work as expected)
#
pm -s $MALLOC "mem=32M console=ttyS0,38400 "
pm -S $MALLOC "ip=$IPADD:$NFSSERVER:$GIPADD:$NETMASK::eth0:off "
#
#
# This example uses an NFS server for the root filesystem
pm -S $MALLOC "root=0:0 nfsroot=$NFSSERVER:$NFSPATH rw "
#
# Example that tacks on video parameters
# (for the CSB625's 640x480 display, in this case)
# pm -S $MALLOC
"video=pxafb:mode:640x480-16,active,left:1,right:161,hsynclen:1,upper:0,lower:4,vsynclen:32,hsync:0,vsync:0,outputen:1,pixclockpol:0,pixclock:25000
"
#
# Launch the kernel, pass it the combined command line
call $APPRAMBASE $MALLOC
exit
#
###############################################################################
#
#
# GET_KERNEL:
# download kernel from TFTP server
tftp $TFTPSERVER get $BOARD/$KERNEL
if $TFTPGET seq \$TFTPGET goto NO_KERNEL
#
echo $KERNEL: size=$TFTPGET base=$APPRAMBASE
goto GOT_KERNEL
#
###############################################################################
#
# Error Handling
#
###############################################################################
#
# NO_FILE:
echo Cannot find filesystem: $ROOTDIR
echo Abort.
exit
#
# NO_KERNEL:
echo Cannot find kernel file: $KERNEL
echo Abort.
exit
#
# NO_NFSSERVER:
echo Cannot find NFS server, check your \$NFSSERVER variable
echo "startlinux nfs <NFS-IP-ADDR> <NFS-PATH>"
echo Example startlinux nfs 192.168.0.2 /usr/src/gxlinux/rootfs
exit
#
# NO_NFSPATH:
echo Cannot find NFS server path, check your \$NFSPATH variable
echo "startlinux nfs <NFS-IP-ADDR> <NFS-PATH>"
echo Example startlinux nfs 192.168.0.2 /usr/src/gxlinux/rootfs
exit
