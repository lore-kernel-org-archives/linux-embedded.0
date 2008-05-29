From: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Subject: Re: problems bringing up CF based file system (2.6.25)
Date: Wed, 28 May 2008 22:17:48 -0500
Message-ID: <200805282217.49143.rob@landley.net>
References: <f608b67d0805221022n18199654n457c47459375213c@mail.gmail.com> <f608b67d0805271547t4469fe39xab541cdbd995dc65@mail.gmail.com> <20080527230457.GH11310@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080527230457.GH11310-Aar9JVdAhcRoA3hw4S0G5QR5/fbUUdgG@public.gmane.org>
Content-Disposition: inline
Sender: linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: vb <vb-gSajP0OrAZc@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tuesday 27 May 2008 18:04:57 Adrian Bunk wrote:
> > I am not really worried about saving memory, I just am trying to
> > understand the reason the SCSI driver is included in the first place -
> > SCSI is a much heavier protocol than what is needed here - isn't it?
> >...
>
> ATAPI uses the SCSI command set, so using parts of the SCSI layer for
> implementing ATA support is not unreasonable.

The SCSI layer is actually _three_ layers (upper, mid, and lower).  It's a 
large and heavyweight solution that (last I checked) reimplements lots of 
stuff in the kernel's block layer.  It unnecessarily mixes together different 
types of transports so that plugging in a USB device can move where the 
kernel decides to put your compact flash device on the next boot, and then 
passes responsibility to udev to untangle the mess the kernel made by 
commingling different transport types in the first place.

Is it even possible to use just _parts_ of the SCSI layer, without sucking in 
the whole thing?

I think the fact it's called a "layer" is a bit of a hint, actually.  Don't 
embedded folks generally try to _avoid_ unnecessary layering, and pulling in 
large code libraries to perform a small task?

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
--
To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
