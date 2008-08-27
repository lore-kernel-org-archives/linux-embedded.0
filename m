From: "Parag Warudkar" <parag.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c - bisected
Date: Wed, 27 Aug 2008 12:24:08 -0400
Message-ID: <f7848160808270924v7ba4882bh45fc4cace51a2d77@mail.gmail.com>
References: <mzBsPw3QUOF.A.87F.wZGsIB@albercik>
	 <alpine.LFD.1.10.0808261019450.3363@nehalem.linux-foundation.org>
	 <20080826183051.GB10925@cs181140183.pp.htv.fi>
	 <alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org>
	 <20080826205916.GB11734@cs181140183.pp.htv.fi>
	 <alpine.LFD.1.10.0808261403360.3363@nehalem.linux-foundation.org>
	 <20080826232411.GC11734@cs181140183.pp.htv.fi>
	 <20080827092528.780916bd@lxorguk.ukuu.org.uk>
	 <f7848160808270552u2ee66167x912a68e0bf8b25bf@mail.gmail.com>
	 <20080827142142.303cdba8@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=VJaK7kWDopuZBbF9g47uepTUlqtfeEQWbc1M3SJTkJQ=;
        b=TKXxzP8LgHLz5IvAP3BJ3Y8XNoWCmck76yqMBhTtNfwKqsBP3lhitpYqvNJkyYJWf/
         J7pgnEj6f0ZuTTXo7NcUYQDjHwLJx/huF+IEo9C7I5QFAZQaCEkTYBf8xF8SPe1VmDRm
         U04Yaml6ZlY9shZrI2XgSfx+ZaveHtLFWcwqM=
In-Reply-To: <20080827142142.303cdba8-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
Content-Disposition: inline
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
Cc: Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, "Alan D. Brunelle" <Alan.Brunelle-VXdhtT5mjnY@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kernel Testers List <kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arjan van de Ven <arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Aug 27, 2008 at 9:21 AM, Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org> wrote:
>> By your logic though, XFS on x86 should work fine with 4K stacks -
>> many will attest that it does not and blows up due to stack issues.
>>
>> I have first hand experiences of things blowing up with deep call
>> chains when using 4K stacks where 8K worked just fine on same
>> workload.
>>
>> So there is definitely some other problem with 4K stacks.
>
> Nothing of the sort. If it blows up with a 4K stack it will almost
> certainly blow up with an 8K stack *eventually* - when a heavy stack usage
> coincides with a heavy stack using IRQ handler.
>
> You won't catch it in simple testing, you won't catch it in trivial
> simulation and it'll be incredibly hard to reproduce. Not the kind of bug
> you want in a production system really. IRQ stacks make things much more
> predictable.


I see - so if I end up having a workload on 8k where heavy stack using
IRQs and deep kernel call chains come at the same time - even 8K will
blow up.
So 4K will blow too except that it doesn't require IRQs also to use
heavy stack, just XFS is good enough :)

It then seems like the IRQs using lot of stack is not so much of a
problem in the current kernel as much as deeper call chains and stack
usage of normal non-irq path code is.
So 8k makes it possible for the deeper call chains of non-irq path to
survive since they get better part of the 8K to themselves and IRQs
can do with less almost always.

At least that's what I can derive from the fact that we do not have
lots of reports of 8K stack blowing up.

Thanks

Parag
