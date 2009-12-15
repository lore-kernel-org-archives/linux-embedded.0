From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [POWER] battery calibration parameters from sysfs
Date: Mon, 14 Dec 2009 21:02:42 -0600
Message-ID: <4B26FC52.6060307@billgatliff.com>
References: <A6D19A13FE030A409EC4362C172E091F0E0495F6@eseldmw101.eemea.ericsson.se>	 <20091204104930.GA28625@sirena.org.uk>	 <A6D19A13FE030A409EC4362C172E091F0E071EB9@eseldmw101.eemea.ericsson.se>	 <20091207114825.GA26965@rakim.wolfsonmicro.main>	 <A6D19A13FE030A409EC4362C172E091F0E0A1FA1@eseldmw101.eemea.ericsson.se>	 <20091207165628.GA24981@rakim.wolfsonmicro.main>	 <20091213132413.GB1437@ucw.cz>	 <20091214121247.GB22388@rakim.wolfsonmicro.main>	 <20091214212257.GA9213@elf.ucw.cz> <ed62800912141543v2ab7ef63v4b6b2c33018b3296@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <ed62800912141543v2ab7ef63v4b6b2c33018b3296@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Aras Vaichas <arasv@magellan-technology.com>
Cc: Pavel Machek <pavel@ucw.cz>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Linus Walleij <linus.walleij@stericsson.com>, cbou@mail.ru, dwmw2@infradead.org, LKML <linux-kernel@vger.kernel.org>, linux-embedded@vger.kernel.org, Brian Swetland <swetland@google.com>, rpurdie@rpsys.net, lenz@cs.wisc.edu, Dirk@opfer-online.de, arminlitzel@web.de, Cyril Hrubis <metan@ucw.cz>, thommycheck@gmail.com, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, dbaryshkov@gmail.com, omegamoon@gmail.com, eric.y.miao@gmail.com, utx@penguin.cz, zaurus-devel@lists.linuxtogo.org

Aras Vaichas wrote:
> Unfortunately the simple coulomb counting chips have the disadvantage
> that the CPU has to be running to accumulate the pulses. Of course,
> the pulses could wake the CPU from a suspend mode, but I'd rather not
> do that just to add "one" to a counter ...
>   

Could you have the coulomb-counting chip connected to a tiny
microcontroller, or even a dedicated hardware counter?  Then the main
CPU wouldn't need to wake as often, it could just ask the
microcontroller over I2C, or read/reset the hardware counter.


b.g.

-- 
Bill Gatliff
bgat@billgatliff.com
