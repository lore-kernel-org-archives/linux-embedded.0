From: Michael Schnell <mschnell@lumino.de>
Subject: Re: AMP on an SMP system
Date: Mon, 05 Aug 2013 11:04:07 +0200
Message-ID: <51FF6A87.6080100@lumino.de>
References: <51FB6EE1.3090708@lumino.de> <20130802114225.GR3880@pengutronix.de> <51FBA261.10301@lumino.de> <51FBC7FE.4000403@gmail.com> <20130803191149.GU3880@pengutronix.de> <51FF535E.2050006@lumino.de> <20130805081758.GI30920@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20130805081758.GI30920@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: 
Cc: linux-embedded@vger.kernel.org

On 08/05/2013 10:17 AM, Robert Schwebel wrote:
> On Mon, Aug 05, 2013 at 09:25:18AM +0200, Michael Schnell wrote:
>>> You can't. And you can't, even if you try to run bare-metal softwar=
e
>>> on a dedicated core. I can't imagine how for example the cache
>>> influences between the cores could be determined.
>> This would render all efforts for hard realtime embedded Linux
>> applications useless. You always need to calculate the max latency.
> You can't calculate the max latency with today's complex processor
> hardware any more. It's all a matter of system failure probabilities.
So don't use them for realtime embedded applications ?

There are companies such as SysGo that seem to claim this possibility=20
with their PikeOS (see=20
http://www.sysgo.com/products/pikeos-rtos-and-virtualization-concept/rt=
os-technology/=20
). AFAIK, they don't even are able to use dedicated cores (yet). Of=20
course they don't support "virtual peripheral" technology here, but=20
strict determinism is a strung requirement with the critical "security"=
=20
applications they have in mind.


> Nevertheless, there always have been settings where you could get rid=
=20
> of all realtime complexity by spending a 1-Euro microcontroller to th=
e=20
> BOM.=20

=46or "virtual peripherals" applications you will need either a fast CP=
U=20
or an FPGA.

> AM335x has PRU subprocessors (not ARM architecture).
The 4788 page "AM335x Applications Processor Technical Reference Manual=
"=20
(SPRUH73 =96 October 2011) on page 226 depicts the "ARM Cortex M3 Memor=
y=20
Map".

> What kind of application is that?

At first we are discussion DMX I/O (there already is a running project=20
doing this with the 335x PRUS (on a BeagleBone board).

But this is only sample "virtual peripheral" project with rather low=20
demand that easily could be done with "a 1-Euro microcontroller". (and=20
in fact we already did this using a PIC33).

But in future we are planning for several kinds of propriety digital=20
waveforms that are to be generated or analyzed.

-Michael
