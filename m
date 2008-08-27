From: "Parag Warudkar" <parag.lkml@gmail.com>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c - bisected
Date: Tue, 26 Aug 2008 21:08:13 -0400
Message-ID: <f7848160808261808p3391c99ekfa1d8991bbf73c10@mail.gmail.com>
References: <mzBsPw3QUOF.A.87F.wZGsIB@albercik>
	 <200808261111.19205.rusty@rustcorp.com.au>
	 <alpine.LFD.1.10.0808261019450.3363@nehalem.linux-foundation.org>
	 <20080826183051.GB10925@cs181140183.pp.htv.fi>
	 <alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org>
	 <20080826205916.GB11734@cs181140183.pp.htv.fi>
	 <alpine.LFD.1.10.0808261403360.3363@nehalem.linux-foundation.org>
	 <f7848160808261554j2f4eaaa6i1ee8801ae75ca7bf@mail.gmail.com>
	 <alpine.LFD.1.10.0808261644260.3363@nehalem.linux-foundation.org>
	 <48B4A577.3020303@snapgear.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=V/wAKQBdaB7vrfrxfc710fKfGpuuXC0VKFXR1qSjH0E=;
        b=Mv6l6jEtAEkl0CMEaM/e+53H3Ctujfe9VDUfSJOHwSHRfjJpa2PDncDzyaPtcT8y1y
         3/3sasiBzdlSGrXll9bHpdy1h+31PCuGFLXEnWT9xHQ6dQdTVh0+2P+RF/3ihPxAtXUV
         X2dazBHqmlvH5PtypQusEDrkO4EHmCSiYOcfA=
In-Reply-To: <48B4A577.3020303@snapgear.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg Ungerer <gerg@snapgear.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Adrian Bunk <bunk@stusta.de>, Rusty Russell <rusty@rustcorp.com.au>, "Alan D. Brunelle" <Alan.Brunelle@hp.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kernel Testers List <kernel-testers@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Arjan van de Ven <arjan@linux.intel.com>, Ingo Molnar <mingo@elte.hu>, linux-embedded@vger.kernel.org

On Tue, Aug 26, 2008 at 8:53 PM, Greg Ungerer <gerg@snapgear.com> wrote:

> I have some simple devices (network access/routers) with 8MB of RAM,
> at power up not really being configured to do anything running 25
> processes. (Heck there is over 10 kernel processes running!). Configure
> some interfaces and services and that will easily push past 40.
> I'd be happy with a 160k saving :-)
>

So you really need to run all 25 processes on that 8Mb box?
(For reference even the NGW100 development board comes with 16Mb RAM).

Even if you do need those all 25 processes on the 8Mb box, fixing the
memory usage of those user space hogs is lot better than trying to
save 160Kb in kernel stacks.
Last I looked, user space wasn't particularly frugal with memory usage.

Parag
