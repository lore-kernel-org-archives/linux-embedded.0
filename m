From: Behan Webster <behanw@websterwood.com>
Subject: embedded rootfs utility
Date: Tue, 29 Jul 2008 22:18:37 -0400
Message-ID: <488FCF7D.5010005@websterwood.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

A quick announcement of the release of elbs, or the "Embedded Linux
Build System" (it seemed like a good name at the time I started writing
it...)  So far it's just a few utilities that I wrote to make a few of
my own projects easier.

However, most notably it contains a utility called "elbs-rootfs" which
makes it easy to create an embedded rootfs for any architecture
supported by the Debian projecy (or Ubuntu Linux).  The idea is to get a
rootfs up and working quickly via nfs (or a flash drive) which allows
you to install any debian package and/or to do native development.  This
is (not yet) meant as a tool to make your final rootfs fit on a small
flash partition.

For those of you who are interested, it does the following: builds a
first stage debootstrap directory using a dist/mirror of your choice,
and then tweaks it so you can boot it natively to be able to run the
second stage debootstrap scripts.  Yes, you can do all these things
manually, however, this does it all for you in a few minutes (with
reasonable defaults for available options).  The only annoying bit is it
must be run as root, as it needs to be able to set file
permissions/ownerships and such.

For example (as root):

    # elbs rootfs --arch mips --baud 19200 --dist etch /nfs/myrootfs
    I: Building rootfs in /nfs/myrootfs
    I: Installing etch/mips from http://http.us.debian.org/debian
    <snip>
    I: debootstrap succeeded
    I: MAKEDEV in /nfs/myrootfs/dev
    <snip>
    I: create /nfs/myrootfs/etc/group
    Boot your target with /nfs/myrootfs as your rootfs, then run the
finish script on the target

The directory /nfs/myrootfs will now contain a stage-one (unconfigured)
debootstrap installation of arch mips from debian/etch, modified to
allow you to connect to a serial console ttyS0 at 19200 baud (as
specified on the command line above).

You then need to boot your target using this rootfs and run the
finish.sh script which will complete the installation.

    # sh /finish.sh

You should now have a fully configured rootfs for your target which is
capable of native compiling (amongst other things).

You can find elbs at http://debian.websterwood.com/elbs/
The help text can be found here
http://debian.websterwood.com/elbs/elbs-rootfs.html

Alternatively, for you Debian/Ubuntu users, add these to your
sources.list and # apt-get install elbs
    deb http://debian.websterwood.com/ sid main
or
    deb http://debian.websterwood.com/ hardy main

For those of you at OLS2008 who attended the MIPS or CELF BoFs, this is
the utility I promised I would release.

I hope some of you find this helpful.

Yes, I know this is, in principal, very similar to what emdebian's
emsandbox does.  In my defense, I wasn't aware of emsandbox when I wrote
this, and whereas emsandbox uses special emdebian packages, elbs-rootfs
uses vanilla debian packages which is what I chose to use on the project
that kicked this all off.

I'll be adding more to this as I get to it.  Bug reports, feature
requests, and patches welcomed.

-- 
Behan Webster
behanw@websterwood.com
