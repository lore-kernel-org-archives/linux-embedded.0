From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: Re: [PATCH] Wait for console to become available, v2
Date: Sun, 19 Apr 2009 18:39:23 +0200
Message-ID: <20090419163923.GS14687@one.firstfloor.org>
References: <20090416190837.GA26734@cuplxvomd02.corp.sa.net> <874owlqcce.fsf@basil.nowhere.org> <49EB5008.1090000@cisco.com>
Mime-Version: 1.0
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <49EB5008.1090000-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linux Embedded Mailing List <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Sun, Apr 19, 2009 at 09:23:36AM -0700, David VomLehn wrote:
> Andi Kleen wrote:
> >VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org> writes:
> >>History
> >>v2	Wait for the preferred console rather than any console. Make the
> >>	delay interval a tunable.
> >
> >CONFIG tunables are usually a bad idea. What should a binary distribution
> >kernel set? Better make it a boot option with a reasonable default.
> 
> Your point about boot options is well taken; I released a more recent 
> version of this patch with boot options last Friday and would appreciate 
> your comments.

Ah missed that sorry.

> 
> >Also a setting to panic in this case might be useful, normally a system
> >without console is not very useful and needs to be rebooted anyways.
> 
> Umm, those of us in the embedded space have the, perhaps misguided, 
> notion that our systems are quite useful without consoles...

That seems more like a special case that shouldn't be default?

-Andi

-- 
ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org -- Speaking for myself only.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
