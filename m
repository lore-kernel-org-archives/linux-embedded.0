From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [POWER] battery calibration parameters from sysfs
Date: Mon, 14 Dec 2009 11:50:24 +0000
Message-ID: <20091214115023.GA22388@rakim.wolfsonmicro.main>
References: <A6D19A13FE030A409EC4362C172E091F0E0495F6@eseldmw101.eemea.ericsson.se>
 <20091204104930.GA28625@sirena.org.uk>
 <A6D19A13FE030A409EC4362C172E091F0E071EB9@eseldmw101.eemea.ericsson.se>
 <20091207114825.GA26965@rakim.wolfsonmicro.main>
 <A6D19A13FE030A409EC4362C172E091F0E0A1FA1@eseldmw101.eemea.ericsson.se>
 <20091213131921.GA1437@ucw.cz>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20091213131921.GA1437@ucw.cz>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>
Cc: Linus Walleij <linus.walleij@stericsson.com>, cbou@mail.ru, dwmw2@infradead.org, LKML <linux-kernel@vger.kernel.org>, linux-embedded@vger.kernel.org

On Sun, Dec 13, 2009 at 02:19:22PM +0100, Pavel Machek wrote:

> ...but then there are all the systems that rely on /proc/apm
> emulation, like openembedded popular on sharp zaurus...

OpenEmbedded is a meta-distribution so doesn't use any particular
software here - I suspect you're referring to things like the GPE stack
which isn't so actively developed these days.
