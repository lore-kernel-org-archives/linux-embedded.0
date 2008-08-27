From: "Parag Warudkar" <parag.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c - bisected
Date: Tue, 26 Aug 2008 20:58:15 -0400
Message-ID: <f7848160808261758q7b84aab1m188c1ebb59304818@mail.gmail.com>
References: <mzBsPw3QUOF.A.87F.wZGsIB@albercik>
	 <alpine.LFD.1.10.0808251326500.3363@nehalem.linux-foundation.org>
	 <200808261111.19205.rusty@rustcorp.com.au>
	 <alpine.LFD.1.10.0808261019450.3363@nehalem.linux-foundation.org>
	 <20080826183051.GB10925@cs181140183.pp.htv.fi>
	 <alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org>
	 <20080826205916.GB11734@cs181140183.pp.htv.fi>
	 <alpine.LFD.1.10.0808261403360.3363@nehalem.linux-foundation.org>
	 <f7848160808261554j2f4eaaa6i1ee8801ae75ca7bf@mail.gmail.com>
	 <alpine.LFD.1.10.0808261644260.3363@nehalem.linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=zTp9qdzW8hfJ/V/re83MiI6vNSZrWM/GcCMaYItHzu0=;
        b=eOvDRbJCiUcnidyv9M9JQd45SAkZxyq9eBUUOsSJpoCVF3sa3pcIvO8ZkofsV8Wa2v
         GVJE8AMNDKDK0l4IXEYu/WJfUccO6feAY0M/PdGP7ERwxf9gnDpG6lsFywuGaksaOFyP
         WbC7wY4PiOIeX/sW9cK6tNMNUPnly9slCVNNo=
In-Reply-To: <alpine.LFD.1.10.0808261644260.3363-nfNrOhbfy2R17+2ddN/4kux8cNe9sq/dYPYVAmT7z5s@public.gmane.org>
Content-Disposition: inline
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Adrian Bunk <bunk-HeJ8Db2Gnd6zQB+pC5nmwQ@public.gmane.org>, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, "Alan D. Brunelle" <Alan.Brunelle-VXdhtT5mjnY@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kernel Testers List <kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arjan van de Ven <arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, Aug 26, 2008 at 7:47 PM, Linus Torvalds
<torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org> wrote:

> If that matters, then so should the difference of 3-8 processes' kernel
> stack usage when you have a 4k/8k stack choice.

The savings part -financial ones- are not always realizable with the
way memory is priced/sized/fitted.
Savings in few Mb of Kernel stack are not necessarily going to allow
getting rid of a single memory chip of 64M or so.
Either that or embedded manufacturing/configurations are different
than the desktop world.

(If my device has 2 memory slots and my user space requires 100Mb
including kernel memory - I anyways have to put in 64Mx2 there to take
advantage of mass manufactured, general purpose memory - so no big
deal if I saved 1.2Mb in Kernel stack or not. And savings of 64Mb
Kernel memory are not feasible anyways to allow user space to work
with 64Mb.)

On the other hand reducing  user space memory usage on those devices
(not counting savings from kernel stack size) is a way more attractive
option.

And although you said in your later reply that Linux x86 with 4K
stacks should be more than usable - my experiences running a untainted
desktop/file server with 4K stack have been always disastrous XFS or
not.  It _might_ work for some well defined workloads but you would
not want to risk 4K stacks otherwise.

I understand the having 4K stack option as a non-default for very
specific workloads is a good idea but apart from that I think no one
else seems to bother with reducing stack sizes (by no one I mean other
OSes.)

Parag
