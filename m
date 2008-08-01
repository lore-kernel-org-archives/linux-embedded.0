From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: [patch 2/4] Configure out file locking features
Date: Fri, 1 Aug 2008 09:28:13 +0200
Message-ID: <20080801072813.GK8254@pengutronix.de>
References: <20080731092703.661994657@free-electrons.com> <20080731093220.969460336@free-electrons.com> <20080731135319.GA20212@cs181140183.pp.htv.fi> <20080731162007.285938e0@surf> <20080731153757.GB20212@cs181140183.pp.htv.fi> <20080731182616.4c20f0db@surf> <20080731164918.GE20212@cs181140183.pp.htv.fi> <4891F724.3030406@am.sony.com> <20080731181214.GD8254@pengutronix.de> <20080731193126.GB23516@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080731193126.GB23516@cs181140183.pp.htv.fi>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@kernel.org>
Cc: Robert Schwebel <r.schwebel@pengutronix.de>, Tim Bird <tim.bird@am.sony.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com, Matt Mackall <mpm@selenic.com>, matthew@wil.cx, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org

On Thu, Jul 31, 2008 at 10:31:26PM +0300, Adrian Bunk wrote:
> > In the OSADL safety working group, people are discussing about Linux
> > for safety critical applications. If we want to achieve such
> > scenarios, stripped-down systems are an absolute must.
> >...
>
> My first reaction is that as soon as you enable CONFIG_EMBEDDED you
> can easily enter codepaths noone else has used for a while and that
> got unnoticed broken.

That may be no problem; if we ever come to a safety kernel, it will have
to be audited and carefully tested anyway.

rsc
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hannoversche Str. 2, 31134 Hildesheim, Germany
   Phone: +49-5121-206917-0 |  Fax: +49-5121-206917-9

