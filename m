From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [POWER] battery calibration parameters from sysfs
Date: Mon, 14 Dec 2009 12:14:10 +0000
Message-ID: <20091214121409.GC22388@rakim.wolfsonmicro.main>
References: <A6D19A13FE030A409EC4362C172E091F0E0495F6@eseldmw101.eemea.ericsson.se>
 <20091204104930.GA28625@sirena.org.uk>
 <A6D19A13FE030A409EC4362C172E091F0E071EB9@eseldmw101.eemea.ericsson.se>
 <20091207114825.GA26965@rakim.wolfsonmicro.main>
 <A6D19A13FE030A409EC4362C172E091F0E0A1FA1@eseldmw101.eemea.ericsson.se>
 <20091213131921.GA1437@ucw.cz>
 <20091214115023.GA22388@rakim.wolfsonmicro.main>
 <20091214115826.GA2280@elf.ucw.cz>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757194AbZLNMOO@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20091214115826.GA2280@elf.ucw.cz>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>
Cc: Linus Walleij <linus.walleij@stericsson.com>, cbou@mail.ru, dwmw2@infradead.org, LKML <linux-kernel@vger.kernel.org>, linux-embedded@vger.kernel.org

On Mon, Dec 14, 2009 at 12:58:26PM +0100, Pavel Machek wrote:
> On Mon 2009-12-14 11:50:24, Mark Brown wrote:

> > OpenEmbedded is a meta-distribution so doesn't use any particular
> > software here - I suspect you're referring to things like the GPE stack
> > which isn't so actively developed these days.

> Both Opie and GPE have the problem IIRC...

Yeah, if you're working on older systems like that you'll probably have
to do some userspace work as well as kernel work.
