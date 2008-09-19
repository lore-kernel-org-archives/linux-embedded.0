From: <linux-embedded-owner@reliableembeddedsystems.com>
Subject: Re: Marvel 88E6063-RCJ1 driver
Date: Fri, 19 Sep 2008 09:27:27 -0500
Message-ID: <8801446f0d0aa8bc9236644771db95fd@reliableembeddedsystems.com>
References: <d7555edbde4d54b0693fa7bddb894cfe@reliableembeddedsystems.com> <1EE62668-5A00-483F-9301-EB9AAAAE118F@kernel.crashing.org> <8ff29df80809171524k415583b1x62ee2106ec0b1bd8@mail.gmail.com> <8ff29df80809171529o7b83dafft30edf4c7217a04e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <8ff29df80809171529o7b83dafft30edf4c7217a04e@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pawel Pastuszak <pawelpastuszak@gmail.com>
Cc: linux-embedded@vger.kernel.org

Thanks Pawel,

It's for a Sigma SMP8634 (MIPS 4KEc) chipset.
In the meantime we got it working.
And yes, no special driver is needed for it.

Regards,

Robert

--
Robert Berger
Embedded Software Specialist

Reliable Embedded Systems
Consulting Training Engineering
Tel.: (+30) 697 593 3428
Fax.:(+30 210) 684 7881
URL: http://www.reliableembeddedsystems.com
--
...If you've found 3 bugs in a program, best estimate is that there are 3
more.-Jack Ganssle


On Wed, 17 Sep 2008 18:29:04 -0400, "Pawel Pastuszak"
<pawelpastuszak@gmail.com> wrote:
> You don't need any driver for the 88E6063 it uses phy id to talk to
> all its ports.. so all you have to do is make sure you set up your
> board to not to bind to any phy address then you can uses it as a
> switch..
> 
> Which Processor is this for...I created couple tool for the marvell
> switch i uses 3 different type in that family of switch's
> 
> Pawel
