From: Matthias Kaehlcke <matthias@kaehlcke.net>
Subject: Re: mount ramdisk rootfs /etc directory to jffs2 filesystem.
Date: Tue, 19 Jan 2010 10:50:24 +0100
Message-ID: <20100119095024.GD16182@darwin>
References: <cb9ecdfa1001190120r593f7799sf566df5a855b8a54@mail.gmail.com>
Mime-Version: 1.0
Return-path: <kernelnewbies-bounce@nl.linux.org>
Content-Disposition: inline
In-Reply-To: <cb9ecdfa1001190120r593f7799sf566df5a855b8a54@mail.gmail.com>
Sender: kernelnewbies-bounce@nl.linux.org
Errors-to: kernelnewbies-bounce@nl.linux.org
List-help: <mailto:ecartis@nl.linux.org?Subject=help>
List-unsubscribe: <mailto:kernelnewbies-request@nl.linux.org?Subject=unsubscribe>
List-software: Ecartis version 1.0.0
List-Id: <linux-embedded.vger.kernel.org>
List-subscribe: <mailto:kernelnewbies-request@nl.linux.org?Subject=subscribe>
List-owner: <mailto:ecartis-owner@nl.linux.org>
List-post: <mailto:kernelnewbies@nl.linux.org>
List-archive: <http://mail.nl.linux.org/kernelnewbies/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johnny Hung <johnny.hacking@gmail.com>
Cc: linux-embedded@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org, kernelnewbies <kernelnewbies@nl.linux.org>

El Tue, Jan 19, 2010 at 05:20:53PM +0800 Johnny Hung ha dit:

> I have build an embedded Linux system and rootfs is a ramdisk. Ramdisk
> rootfs resides in memory so modify files is non-effective after a
> reboot. Some directories in rootfs, like /etc, /usr, ... are contain
> many application configuration files and I want to mount it to jffs2
> flash filesysyem so it will take effect after a reboot. Is it
> possible?

yes, this is possible

> I know the flash has write times limited so the log files
> (syslogd/klogd) should not store in flash. In general, how to deploy
> root file system for embedded linux with flash storage?

- add jffs2 support to your kernel
- create your image using mkfs.jffs2 from mtd-utils
- flash the image
- specify the rootfs partition and type in the bootargs of the kernel

for further information i recommend the lecture of
http://free-electrons.com/doc/flash-filesystems.pdf

depending on your requirements/size of the rootfs partitions UBIFS
might be an option to consider

-- 
Matthias Kaehlcke
Embedded Linux Developer
Barcelona

      El trabajo es el refugio de los que no tienen nada que hacer
                            (Oscar Wilde)
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-

--
To unsubscribe from this list: send an email with
"unsubscribe kernelnewbies" to ecartis@nl.linux.org
Please read the FAQ at http://kernelnewbies.org/FAQ

