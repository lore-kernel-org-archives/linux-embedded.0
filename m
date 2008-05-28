From: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Subject: Re: YAFFS in the kernel tree?
Date: Wed, 28 May 2008 17:12:40 -0400 (EDT)
Message-ID: <alpine.LFD.1.10.0805281711370.3803@localhost.localdomain>
References: <200805290859.54396.manningc2@actrix.gen.nz>
Mime-Version: 1.0
Return-path: <linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200805290859.54396.manningc2-jEEI2ySEPisjAXWc8ALWsQ@public.gmane.org>
Sender: linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Charles Manning <manningc2-jEEI2ySEPisjAXWc8ALWsQ@public.gmane.org>
Cc: linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, 29 May 2008, Charles Manning wrote:

> Hi
>
> I'm the author of YAFFS. This is not in the kernel tree, but is fairly easy to
> integrate by just pulling a tarball and running  patch-in script.
>
> I am curious as to whether people consider the current mechanism "good enough"
> or whether it is worth the effort trying to get YAFFS into the kernel tree.
>
> Pros I can see:
> * In tree means better testing (maybe).
> * Keeping current with kernel API changes.
>
> Cons:
> * More effort for YAFFS maintainers (me mostly).
> * Effort getting code into kernel coding style (unless I can get a waiver on
> this).
>
> Thoughts??

perhaps a dumb question, but does this include YAFFS2 as well?

rday

p.s.  and, no, you don't get a pass on coding style, but others will
almost certainly help you out there. :-)

--

========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
--
To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
