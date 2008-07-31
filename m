From: Adrian Bunk <bunk@kernel.org>
Subject: Re: [patch 2/4] Configure out file locking features
Date: Thu, 31 Jul 2008 22:31:26 +0300
Message-ID: <20080731193126.GB23516@cs181140183.pp.htv.fi>
References: <20080731092703.661994657@free-electrons.com> <20080731093220.969460336@free-electrons.com> <20080731135319.GA20212@cs181140183.pp.htv.fi> <20080731162007.285938e0@surf> <20080731153757.GB20212@cs181140183.pp.htv.fi> <20080731182616.4c20f0db@surf> <20080731164918.GE20212@cs181140183.pp.htv.fi> <4891F724.3030406@am.sony.com> <20080731181214.GD8254@pengutronix.de>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080731181214.GD8254@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: Tim Bird <tim.bird@am.sony.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com, Matt Mackall <mpm@selenic.com>, matthew@wil.cx, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org

On Thu, Jul 31, 2008 at 08:12:14PM +0200, Robert Schwebel wrote:
> On Thu, Jul 31, 2008 at 10:32:20AM -0700, Tim Bird wrote:
> > > And for embedded systems with which applications is it 100% safe to
> > > disable this option?
> >
> > Sony's digital cameras.
> 
> We have also several very small automation & measurement devices in the
> field which run a very dedicated more or less single application which
> can be carefully audited.
> 
> In the OSADL safety working group, people are discussing about Linux for
> safety critical applications. If we want to achieve such scenarios,
> stripped-down systems are an absolute must.
>...

My first reaction is that as soon as you enable CONFIG_EMBEDDED you can 
easily enter codepaths noone else has used for a while and that got 
unnoticed broken.

> rsc

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
