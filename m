From: Charles Manning <manningc2-jEEI2ySEPisjAXWc8ALWsQ@public.gmane.org>
Subject: Re: YAFFS in the kernel tree?
Date: Thu, 29 May 2008 09:34:28 +1200
Message-ID: <200805290934.28232.manningc2@actrix.gen.nz>
References: <200805290859.54396.manningc2@actrix.gen.nz> <8bd0f97a0805281424g2ceae455x774e8d66aba4ec2b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8bd0f97a0805281424g2ceae455x774e8d66aba4ec2b-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Frysinger <vapier.adi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thursday 29 May 2008 09:24:14 Mike Frysinger wrote:
> On Wed, May 28, 2008 at 4:59 PM, Charles Manning wrote:
> > I'm the author of YAFFS. This is not in the kernel tree, but is fairly
> > easy to integrate by just pulling a tarball and running  patch-in script.
> >
> > I am curious as to whether people consider the current mechanism "good
> > enough" or whether it is worth the effort trying to get YAFFS into the
> > kernel tree.
> >
> > Pros I can see:
> > * In tree means better testing (maybe).
> > * Keeping current with kernel API changes.
> >
> > Cons:
> > * More effort for YAFFS maintainers (me mostly).
> > * Effort getting code into kernel coding style (unless I can get a waiver
> > on this).
>
> i'm pretty sure you're going to have to cull all of the
> LINUX_VERSION_CODE checks.  that means the in tree yaffs code is only
> going to track mainline kernel versions.  i dont know whether you
> consider that a pro or con (i say it's a pro), but if you want/need
> those checks, you're basically going to have to maintain two forked
> versions ...
> -mike

The main reason for those version checks is that YAFFS tries to acknowledge 
that not everyone just uses the latest kernel. Many embedded developers are 
using older kernels (for various valid reasons) (though this practice is 
probably on the decline) and I would like to continue supporting that.

I would expect that this would make for two versions of yaffs_fs.c: the CVS 
one for all comers and the in-tree version which is cleaned.

-- CHarles


--
To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
