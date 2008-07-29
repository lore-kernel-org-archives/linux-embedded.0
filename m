From: Alexander Neundorf <neundorf@eit.uni-kl.de>
Subject: Re: prevalence of C++ in embedded linux?
Date: Tue, 29 Jul 2008 09:51:34 +0200
Message-ID: <200807290951.34563.neundorf@eit.uni-kl.de>
References: <alpine.LFD.1.10.0807281142430.4286@localhost.localdomain> <488EC964.2030400@coritel.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <488EC964.2030400@coritel.it>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marco Stornelli <marco.stornelli@coritel.it>
Cc: Embedded Linux mailing list <linux-embedded@vger.kernel.org>

On Tuesday 29 July 2008 09:40:20 Marco Stornelli wrote:
> Robert P. J. Day ha scritto:
> >   just curious -- how many folks are working in C++ in their embedded
> > linux work?
> >
> > rday
> > --
> >
> > To unsubscribe from this list: send the line "unsubscribe linux-embedded"
> > in the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> Like Linus Torvals said "...C++ is an horrible language" :)

If you avoid RTTI and exceptions and if you are handle templates and multiple 
inheritance carefully I see nothing which speaks against using it for 
embedded and real-time software.
e.g. the kernel eCos is implemented in C++.

Alex
