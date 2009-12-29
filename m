From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: Re: How to store kernel panic/oops
Date: Tue, 29 Dec 2009 16:05:03 +0900
Message-ID: <20091229070503.GE7638@linux-sh.org>
References: <4B38F304.4020801@gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4B38F304.4020801@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: dwmw2@infradead.org, CeLinux <celinux-dev@tree.celinuxforum.org>, Linux Embedded <linux-embedded@vger.kernel.org>

On Mon, Dec 28, 2009 at 07:03:48PM +0100, Marco Stornelli wrote:
> David Woodhouse wrote:
> 
> > Can't it be done with what's in the tree already? Just create an MTD
> > device using phram or something else, then point mtdoops at it
> 
> Yes of course, if possible we shouldn't reinvent the wheel but I
> wondered if there was something more specific. To add mtdoops (more or
> less 1k) we have to add mtd subsys (more or less 14k) to the kernel to
> achieve this and it's all overhead.
> 
panic/oops information is punted down to a kmsg dumper, which mtdoops
just happens to be one of. If you wanted to do your own platform specific
hack for size constraints you could easily just have your own special
one instead. Take a look at linux/kmsg_dump.h.
