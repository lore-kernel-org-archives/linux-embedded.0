From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: embedded rootfs utility
Date: Wed, 6 Aug 2008 13:50:59 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0808061345080.28556@vixen.sonytel.be>
References: <488FCF7D.5010005@websterwood.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-584349381-1833906330-1218023459=:28556"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <488FCF7D.5010005@websterwood.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Behan Webster <behanw@websterwood.com>
Cc: linux-embedded@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---584349381-1833906330-1218023459=:28556
Content-Type: TEXT/PLAIN; charset="utf-8"
Content-Transfer-Encoding: 8bit

	Hi Behan,

On Tue, 29 Jul 2008, Behan Webster wrote:
> However, most notably it contains a utility called "elbs-rootfs" which
> makes it easy to create an embedded rootfs for any architecture
> supported by the Debian projecy (or Ubuntu Linux).  The idea is to get a
> rootfs up and working quickly via nfs (or a flash drive) which allows
> you to install any debian package and/or to do native development.  This
> is (not yet) meant as a tool to make your final rootfs fit on a small
> flash partition.
> 
> For those of you who are interested, it does the following: builds a
> first stage debootstrap directory using a dist/mirror of your choice,
> and then tweaks it so you can boot it natively to be able to run the
> second stage debootstrap scripts.  Yes, you can do all these things
> manually, however, this does it all for you in a few minutes (with
> reasonable defaults for available options).  The only annoying bit is it
> must be run as root, as it needs to be able to set file
> permissions/ownerships and such.
> 
> For example (as root):
> 
>     # elbs rootfs --arch mips --baud 19200 --dist etch /nfs/myrootfs
>     I: Building rootfs in /nfs/myrootfs
>     I: Installing etch/mips from http://http.us.debian.org/debian
>     <snip>
>     I: debootstrap succeeded
>     I: MAKEDEV in /nfs/myrootfs/dev
>     <snip>
>     I: create /nfs/myrootfs/etc/group
>     Boot your target with /nfs/myrootfs as your rootfs, then run the
> finish script on the target
> 
> The directory /nfs/myrootfs will now contain a stage-one (unconfigured)
> debootstrap installation of arch mips from debian/etch, modified to
> allow you to connect to a serial console ttyS0 at 19200 baud (as
> specified on the command line above).
> 
> You then need to boot your target using this rootfs and run the
> finish.sh script which will complete the installation.
> 
>     # sh /finish.sh
> 
> You should now have a fully configured rootfs for your target which is
> capable of native compiling (amongst other things).

Thanks for this useful tool!

I'm used to plain debootstrap, but decided to give your elbs-rootfs a try for
creating up a mipsel and a powerpc NFS root file system. It worked fine,
except for one minor nit. As an NFS root file system is mounted read-only by
default, I had to manually do

| mount -n proc /proc -t proc       
| mount -n -o remount -w /

before running finish.sh. Perhaps this can be added to the top of finish.sh?

Add the end of its execution, finish.sh says:

| Feel free to delete /debootstrap and the downloaded packages
|   # rm -rf /debootstrap
|   # apt-get clean
| Please reboot now
|   # shutdown -r now

Shouldn't it suggest to delete /finish.sh, too?

Anyway, thanks for this tool!

With kind regards,

Geert Uytterhoeven
Software Architect

Sony Techsoft Centre Europe
The Corporate Village · Da Vincilaan 7-D1 · B-1935 Zaventem · Belgium

Phone:    +32 (0)2 700 8453
Fax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 · RPR Brussels
Fortis 293-0376800-10 GEBA-BE-BB
---584349381-1833906330-1218023459=:28556--
