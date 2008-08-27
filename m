From: "Parag Warudkar" <parag.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c - bisected
Date: Tue, 26 Aug 2008 22:16:16 -0400
Message-ID: <f7848160808261916x6e2a3abfj2c28fa665da792b4@mail.gmail.com>
References: <mzBsPw3QUOF.A.87F.wZGsIB@albercik>
	 <20080826183051.GB10925@cs181140183.pp.htv.fi>
	 <alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org>
	 <20080826205916.GB11734@cs181140183.pp.htv.fi>
	 <alpine.LFD.1.10.0808261403360.3363@nehalem.linux-foundation.org>
	 <f7848160808261554j2f4eaaa6i1ee8801ae75ca7bf@mail.gmail.com>
	 <alpine.LFD.1.10.0808261644260.3363@nehalem.linux-foundation.org>
	 <48B4A577.3020303@snapgear.com>
	 <f7848160808261808p3391c99ekfa1d8991bbf73c10@mail.gmail.com>
	 <48B4AE68.4040205@snapgear.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=arah67lYpOjwhifSAk+sXbdcginZwiBDGdt0oLLWb58=;
        b=MrHHsm5y3tGw8BHPeYaJdYXRSL+hfWlQaZVh2g+jClvy5ERsZieDnhahneKMjD8ZGA
         Lp2831RZ4rukCdoLIuQVHFtbR7ZNJf2PLtNgEyop09JM7XeZXKpPkyrr4VMJ3n6AxqdZ
         /y4xEBocGszJGY1aXXY50SAM4FJmQZRaq18A8=
In-Reply-To: <48B4AE68.4040205-XXXsiaCtIV5Wk0Htik3J/w@public.gmane.org>
Content-Disposition: inline
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg Ungerer <gerg-XXXsiaCtIV5Wk0Htik3J/w@public.gmane.org>
Cc: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Adrian Bunk <bunk-HeJ8Db2Gnd6zQB+pC5nmwQ@public.gmane.org>, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, "Alan D. Brunelle" <Alan.Brunelle-VXdhtT5mjnY@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kernel Testers List <kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arjan van de Ven <arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, Aug 26, 2008 at 9:31 PM, Greg Ungerer <gerg-XXXsiaCtIV5Wk0Htik3J/w@public.gmane.org> wrote:

>
> And the pressure will still be on in _real_ products to reduce
> the RAM footprint as much as possible. There are exceptions but
> generally less is cheaper. Simple economics really.

Well, sure  - but the industry as a whole seems to have gone the other
way - do more with more at the similar or lower price points!
By that definition of less is better we should try and make the kernel
memory pageable (or has someone already done that?) - Windows does it,
by default ;)

Parag
