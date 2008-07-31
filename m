From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: [patch 2/4] Configure out file locking features
Date: Thu, 31 Jul 2008 20:12:14 +0200
Message-ID: <20080731181214.GD8254@pengutronix.de>
References: <20080731092703.661994657@free-electrons.com> <20080731093220.969460336@free-electrons.com> <20080731135319.GA20212@cs181140183.pp.htv.fi> <20080731162007.285938e0@surf> <20080731153757.GB20212@cs181140183.pp.htv.fi> <20080731182616.4c20f0db@surf> <20080731164918.GE20212@cs181140183.pp.htv.fi> <4891F724.3030406@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4891F724.3030406@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@am.sony.com>
Cc: Adrian Bunk <bunk@kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com, Matt Mackall <mpm@selenic.com>, matthew@wil.cx, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org

On Thu, Jul 31, 2008 at 10:32:20AM -0700, Tim Bird wrote:
> > And for embedded systems with which applications is it 100% safe to
> > disable this option?
>
> Sony's digital cameras.

We have also several very small automation & measurement devices in the
field which run a very dedicated more or less single application which
can be carefully audited.

In the OSADL safety working group, people are discussing about Linux for
safety critical applications. If we want to achieve such scenarios,
stripped-down systems are an absolute must.

Although increasing processor power even in embedded applications lead
to more and more standard-line kernels plus normal userspace components
(i.e. glibc instead of uclibc), there are still applications where the
final product consists only of the kernel plus the app, whereas during
development time, the system has a full-blown configuration.

rsc
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hannoversche Str. 2, 31134 Hildesheim, Germany
   Phone: +49-5121-206917-0 |  Fax: +49-5121-206917-9
