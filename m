From: Adrian Bunk <bunk@kernel.org>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Tue, 10 Jun 2008 13:36:54 +0300
Message-ID: <20080610103654.GC17556@cs181133002.pp.htv.fi>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806092253.11897.rob@landley.net> <20080610043020.GA31765@uranus.ravnborg.org> <200806100155.31904.rob@landley.net> <20080610075432.GB776@uranus.ravnborg.org> <20080610102018.GB25910@shareable.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080610102018.GB25910@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Rob Landley <rob@landley.net>, Leon Woestenberg <leon.woestenberg@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org

On Tue, Jun 10, 2008 at 11:20:18AM +0100, Jamie Lokier wrote:
> My only comment is I remember when Eric Raymond submitted a smart
> config thing (before Kconfig, which copied Eric's best ideas).
> 
> The main objection to Eric's patch was that it was written in Python,
> causing kernel builds to depend Python.
>...

Although the usage of Python was brought as a reason against it the 
main objection against CML2 was ESRs interaction with the kernel 
community, like the fact that he was not willing to split his
changes into appropriate pieces but only offered one big patch.

> -- Jamie

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

