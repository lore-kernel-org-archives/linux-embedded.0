From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [POWER] battery calibration parameters from sysfs
Date: Fri, 18 Dec 2009 09:48:50 +0100
Message-ID: <20091218084850.GA1513@ucw.cz>
References: <A6D19A13FE030A409EC4362C172E091F0E0A1FA1@eseldmw101.eemea.ericsson.se>
	<20091207165628.GA24981@rakim.wolfsonmicro.main>
	<20091213132413.GB1437@ucw.cz>
	<20091214121247.GB22388@rakim.wolfsonmicro.main>
	<20091214212257.GA9213@elf.ucw.cz>
	<ed62800912141543v2ab7ef63v4b6b2c33018b3296@mail.gmail.com>
	<4B26FC52.6060307@billgatliff.com>
	<ed62800912151458p6bc1e551g54960af40c54facd@mail.gmail.com>
	<1260919938.10441.18.camel@utx.utx.cz>
	<4B28AAFC.5010108@warmcat.com>
Reply-To: Zaurus PDA developers list <zaurus-devel-cunTk1MwBs/k6gDgw6ADrEB+6BGkLq7r@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <zaurus-devel-bounces-cunTk1MwBs/k6gDgw6ADrEB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4B28AAFC.5010108-/Zus8d0mwwtBDgjK7y7TUQ@public.gmane.org>
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/zaurus-devel>,
	<mailto:zaurus-devel-request-cunTk1MwBs/k6gDgw6ADrEB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/zaurus-devel>
List-Post: <mailto:zaurus-devel-cunTk1MwBs/k6gDgw6ADrEB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:zaurus-devel-request-cunTk1MwBs/k6gDgw6ADrEB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/zaurus-devel>,
	<mailto:zaurus-devel-request-cunTk1MwBs/k6gDgw6ADrEB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: zaurus-devel-bounces-cunTk1MwBs/k6gDgw6ADrEB+6BGkLq7r@public.gmane.org
Errors-To: zaurus-devel-bounces-cunTk1MwBs/k6gDgw6ADrEB+6BGkLq7r@public.gmane.org
To: Andy Green <andy-/Zus8d0mwwtBDgjK7y7TUQ@public.gmane.org>
Cc: Bill Gatliff <bgat-uPd5UNENI//N9NzbbXoYwQ@public.gmane.org>, thommycheck-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cbou-JGs/UdohzUI@public.gmane.org, dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Brian Swetland <swetland-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, arminlitzel-S0/GAf8tV78@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dirk-ngtJ1GK09nrbFfAX06+HdQ@public.gmane.org, lenz-hcNo3dDEHLuVc3sceRu5cw@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Cyril Hrubis <metan-+ZI9xUNit7I@public.gmane.org>, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, zaurus-devel-cunTk1MwBs/k6gDgw6ADrEB+6BGkLq7r@public.gmane.org, Aras Vaichas <arasv-keogN4XODh2TDFy0n7wqsv6YP24DPgJO@public.gmane.org>

Hi!1


>>> Yes, but in that case you might as well just purchase a coulomb
>>> counter with a built-in accumulator and an I2C/SPI/microwire interface
>>> save yourself some PCB space and cost (maybe)

Hardware is already given.

>> Well, Pavel attempts to implement a "poor man's Coulomb counter" or at
>> least "poor man's Ampere meter" for devices that are not equipped with
>> any of it.
>
> I think the "poor man's Coulomb counter" is a loser, the errors will  
> overwhelm you too rapidly.  The estimated rate of discharge could
>> work,  

Actually android phones do "poor man's Coulomb counter", and it seems
to mostly work.

> based on what clocks, regulators and so on are running, but I am not  
> sure how useful that number is really given you can't realistically  
> integrate it due to the big error it is bound to have.
...
> Otherwise for L-ion batteries, looking at the voltage level alone,  
> filtered to remove GSM transmit slots etc, is really quite workable for  
> estimating charge status.

Well, you have to compensate for backlight power; and yes, that's what
I'm trying to do.
								Pavel 

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
