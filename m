From: md@Linux.IT (Marco d'Itri)
Subject: Re: [ANNOUNCE] udev 125 release
Date: Tue, 29 Jul 2008 04:10:53 +0200
Message-ID: <20080729021053.GA5157@bongo.bofh.it>
References: <488E515D.6000309@cisco.com> <20080728233224.GA27073@bongo.bofh.it> <488E7827.7010106@cisco.com>
Mime-Version: 1.0
Return-path: <linux-hotplug-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <488E7827.7010106@cisco.com>
Sender: linux-hotplug-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David VomLehn <dvomlehn@cisco.com>
Cc: linux-hotplug@vger.kernel.org, Linux Embedded Maillist <linux-embedded@vger.kernel.org>

On Jul 29, David VomLehn <dvomlehn@cisco.com> wrote:

>> Also, they can be edited manually while /var data cannot.
> I don't know of any problems with editing /var data manually, but your 
It's one of the basic rules which have always defined /var. From FHS 2.3:

/var/lib : Variable state information

Purpose

This hierarchy holds state information pertaining to an application or the
system. State information is data that programs modify while they run, and that
pertains to one specific host. Users must never need to modify files in /var/
lib to configure a package's operation.

> Note that embedded systems are not the only case where read-only root 
> filesystems may arise. They are also used when your root filesystem is on 
> a CDROM or DVD, or when you have a read-only root filesystem so you can 
> network-mount it on multiple nodes. These cases influenced the Filesystem 
> Hierarchy Standard people to make /etc read-only. So, I think  that using 
> /etc for "on-the-fly" generated udev rules is an issue in a number of 
> situations.
Live CDs do not really need persistent status and in my experience
both these and embedded systems tend to use lots of special-purpose
hacks anyway.
The generated rules *are* a configuration file and there are endless
generated configuration files in /etc (tipically they are generated
once at install time, but on most systems the same applies to udev too).

If you have a R/O /etc an no human administrator which can edit system
files then just copy the rules files from /dev/.udev/rules.d/ to /var
and restore them at the next boot before udevtrigger is run.

> need for this feature, but is it possible that you wouldn't need to 
> generate rules *on-the-fly* until after mounting /var? If that were the 
> case, you could still put the generated rules there.
It does not matter when they are generated but when they are used,
e.g. they may be needed to NFS-mount /var.
At least on Debian systems, networking is started before even local
file systems are mounted.

-- 
ciao,
Marco
