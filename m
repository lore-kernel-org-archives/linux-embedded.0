From: Aras Vaichas <arasv@magellan-technology.com>
Subject: Re: [POWER] battery calibration parameters from sysfs
Date: Wed, 16 Dec 2009 09:58:16 +1100
Message-ID: <ed62800912151458p6bc1e551g54960af40c54facd@mail.gmail.com>
References: <A6D19A13FE030A409EC4362C172E091F0E0495F6@eseldmw101.eemea.ericsson.se>
	<A6D19A13FE030A409EC4362C172E091F0E071EB9@eseldmw101.eemea.ericsson.se>
	<20091207114825.GA26965@rakim.wolfsonmicro.main>
	<A6D19A13FE030A409EC4362C172E091F0E0A1FA1@eseldmw101.eemea.ericsson.se>
	<20091207165628.GA24981@rakim.wolfsonmicro.main>
	<20091213132413.GB1437@ucw.cz>
	<20091214121247.GB22388@rakim.wolfsonmicro.main>
	<20091214212257.GA9213@elf.ucw.cz>
	<ed62800912141543v2ab7ef63v4b6b2c33018b3296@mail.gmail.com>
	<4B26FC52.6060307@billgatliff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4B26FC52.6060307@billgatliff.com>
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bill Gatliff <bgat@billgatliff.com>
Cc: thommycheck@gmail.com, Linus Walleij <linus.walleij@stericsson.com>, linux-embedded@vger.kernel.org, lenz@cs.wisc.edu, dbaryshkov@gmail.com, Brian Swetland <swetland@google.com>, arminlitzel@web.de, Mark Brown <broonie@opensource.wolfsonmicro.com>, LKML <linux-kernel@vger.kernel.org>, Dirk@opfer-online.de, utx@penguin.cz, cbou@mail.ru, rpurdie@rpsys.net, omegamoon@gmail.com, Pavel Machek <pavel@ucw.cz>, Cyril Hrubis <metan@ucw.cz>, eric.y.miao@gmail.com, dwmw2@infradead.org, zaurus-devel@lists.linuxtogo.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

2009/12/15 Bill Gatliff <bgat@billgatliff.com>:
> Aras Vaichas wrote:
>> Unfortunately the simple coulomb counting chips have the disadvantage
>> that the CPU has to be running to accumulate the pulses. Of course,
>> the pulses could wake the CPU from a suspend mode, but I'd rather not
>> do that just to add "one" to a counter ...
>>
>
> Could you have the coulomb-counting chip connected to a tiny
> microcontroller, or even a dedicated hardware counter? =A0Then the main
> CPU wouldn't need to wake as often, it could just ask the
> microcontroller over I2C, or read/reset the hardware counter.
>
> b.g.

Yes, but in that case you might as well just purchase a coulomb
counter with a built-in accumulator and an I2C/SPI/microwire interface
save yourself some PCB space and cost (maybe)

Google for, say,  "coulomb counter i2c" and you'll get something like
this: http://eu.st.com/stonline/products/literature/ds/15269.pdf as an
example

The only time we used a pulse-and-polarity-output coulomb counter was
with an ATmega128. The CPU had to run all the time in order to
maintain its RTC so we could use it to accumulate pulses as well. It
wasn't a Linux project though.

Aras
