From: Charles Manning <manningc2-jEEI2ySEPisjAXWc8ALWsQ@public.gmane.org>
Subject: Re: YAFFS in the kernel tree?
Date: Thu, 29 May 2008 09:14:51 +1200
Message-ID: <200805290914.51814.manningc2@actrix.gen.nz>
References: <200805290859.54396.manningc2@actrix.gen.nz> <alpine.LFD.1.10.0805281711370.3803@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.1.10.0805281711370.3803-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Content-Disposition: inline
Sender: linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Cc: linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thursday 29 May 2008 09:12:40 Robert P. J. Day wrote:
> On Thu, 29 May 2008, Charles Manning wrote:
> > Hi
> >
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
> >
> > Thoughts??
>
> perhaps a dumb question, but does this include YAFFS2 as well?
>

> p.s.  and, no, you don't get a pass on coding style, but others will
> almost certainly help you out there. :-)

That would only be yaffs2 which has yaffs1 backward compatibility built in.

-- CHarles

--
To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
