From: David VomLehn <dvomlehn@cisco.com>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Mon, 22 Jun 2009 18:42:13 -0700
Message-ID: <20090623014213.GA20394@cuplxvomd02.corp.sa.net>
References: <2ea1731b0906212333r20deb71q2f021fc79bcc8a8e@mail.gmail.com> <20090622172003.GB21149@elf.ucw.cz> <4A3FBFF0.40006@am.sony.com> <20090622173704.GC21299@elf.ucw.cz> <4A3FC84A.6060608@gmail.com> <20090622204031.GA24236@elf.ucw.cz> <4A3FFC89.4070006@am.sony.com> <20090622215753.GA25434@elf.ucw.cz> <20090622223855.GA25996@elf.ucw.cz> <4A401335.1090307@nortel.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A401335.1090307@nortel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=2821; t=1245721333; x=1246585333;
	c=relaxed/simple; s=sjdkim4002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn@cisco.com;
	z=From:=20David=20VomLehn=20<dvomlehn@cisco.com>
	|Subject:=20Re=3A=20[PATCH=2000/14]=20Pramfs=3A=20Persisten
	t=20and=20protected=20ram=20filesystem
	|Sender:=20;
	bh=uyUsjXABvlMzqbI/6QDLoa8arH4CvsJf9mWGRhQPYJk=;
	b=P2ncFPyDHafp800lsQxjnW6s+fL1UVSeYE4AtjpCwDiZ+lPYnMSe639luO
	++REdKHqaKcIjNs9wzyEuJItHaajlIiBXpKKB7Uq2cmuWdd+QUT31N6ugF06
	zv6kdOcAvy;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Friesen <cfriesen@nortel.com>
Cc: Pavel Machek <pavel@ucw.cz>, Tim Bird <tim.bird@am.sony.com>, Marco <marco.stornelli@gmail.com>, Jamie Lokier <jamie@shareable.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

On Mon, Jun 22, 2009 at 05:26:45PM -0600, Chris Friesen wrote:
> Pavel Machek wrote:
> 
> > More politely said: "I believe you would be better off modifying
> > ramdisk to include the functionality for persistence."  New filesystem
> > should not really be neccessary. ext2 for performance, ext3 if you
> > need robustness from journalling, maybe something else makes sense,
> > too.
> 
> I agree that a persistent block device makes more sense.
> 
> However, as someone with some experience in using this type of
> mechanism, a special filesystem (separate from the special block device)
> could also be useful.  We often use things like circular buffers,
> per-cpu areas, both log-structured and variable-length records, etc.  A
> filesystem that would take care of this type of thing under the hood
> might simplify a few things.
> 
> Also note that it's very useful for the kernel itself to be able to
> access the contents of this persistent area...we use it for parts of the
> log stream, various forms of "flight recorder" information, panic
> tracebacks, etc. as well as making it available to select userspace apps.

I think we might step back from this particular patch and look at what people
actually want. From my standpoint, we use, or intend to use, persistent memory
in three ways:

1. Recording crash logs from user space
2. Recording crash logs from kernel space
3. Flight recorder/continuous logging.

The first two uses share the same chunk of memory. In the first case, the
interface is through filesystem operations from user space, but simple memcpys
in kernel space. Neither of these uses is performance critical

The third use is a different memory chunk and, depending on just what you log,
can have a significant performance impact. It is helpful if this can be a
single chunk of pram that is contiguous in kernel virtual space.  Depending
on how you use it, you might even want it to be uncached. I'm not clear on
whether Pramfs supports this.

All three use cases can be satisfied with a persistent memory block device,
as others have mentioned, so long as multiple pram partitions are supported.
We might steal the mtdparts syntax for this (see drivers/mtd/cmdlinepart.c).

Another consideration--we actually stopped using a checksum on our crash logs.
The crash logs are in text, so if they are a little bit stomped on, they
are still usable. If you require a matching checksum, you lose the ability
to read those slightly dented logs. So, all the work that's being done to
ensure data integrity in the pram filesystem is actually harmful in this case.

I don't know whether a pram block device helps at all with a pramfs, but I
wouldn't want to lose ability to choose to use the block device directly
or switch to a pramfs.

> Chris
