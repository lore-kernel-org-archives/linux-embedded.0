From: Rob Landley <rob@landley.net>
Subject: Re: Minimal x86 memory requirements
Date: Mon, 14 Feb 2011 20:39:54 -0600
Message-ID: <4D59E77A.8030509@landley.net>
References: <4D59C9D5.4080909@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4D59C9D5.4080909@linux.intel.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Darren Hart <dvhart@linux.intel.com>
Cc: linux-embedded@vger.kernel.org

On 02/14/2011 06:33 PM, Darren Hart wrote:
> I'm looking to build a bare minimum x86 kernel that will boot and run
> busybox, nothing else (and eventually less than that). Assuming I do
> need USB-HID, IDE, and basic TCP/IP, what should I expect to be the
> least RAM I could get away with just to boot off flash, get a getty,
> login, and take a few directory listings.

On a nommu system, if you configure out most of the PRINTK strings, you
can run a reasonably useful system in 4 megabytes.  However, that's
using a small flash-based initramfs with the block layer disabled.  I
don't know if you can fit everything you need in there (USB, the block
layer, and networking stack).  And if you want a MMU system, you'll add
the overhead of page tables in there.

So while you _might_ still be able to trim it down to 4 megabytes, I'd
budget somewhere in the 6 to 8 megs range.  Don't forget to statically
link your busybox binary so you don't dirty physical pages with
relocations.  (Against uClibc of course, Ulrich Drepper deprecated
static linking in glibc because they suck at it so badly.)

I note that the Linux kernel (last I checked, circa 2006) no longer
booted in 2 megabytes of ram due to the relocations required to extract
the thing when it gunzips it, it simply wouldn't let the mappings be
that close.  Maybe that's been addressed, but I doubt it.

Something people were spending time on a while back was mapping the
kernel directly out of flash (I can never keep NAND and NOR straight but
the one that works more like normal memory) since the code segment is
just a big read-only mapping block anyway.  I think these days it works
fine, but I haven't tried it.  Doing that saves DRAM, but it needs
actual mappable flash or ROM, and not a block device that faults pages
into DRAM under under the covers when mapped.  All that XIP work
(execute-in-place and binflat and such) was related to that as well.
Note that flash may not be as FAST as dram so you take a performance
hit, but they were worrying about the power consumption of requiring
less DRAM to refresh.

Does this help?  (Play with QEMU.  QEMU is awesome.  I have system
images at http://landley.net/downloads/binaries which provide a static
uClibc defconfig busybox binary you can try tweaking the kernel .config
and such for.  It's defconfig so it's pretty big, but it should give you
a reasonable idea.  If you want the busybox binaries by themselves, I
copied them to http://busybox.net/downloads/binaries.  Remind me to
update that for the new release...)

Rob
