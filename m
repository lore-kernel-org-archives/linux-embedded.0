From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [POWER] battery calibration parameters from sysfs
Date: Wed, 16 Dec 2009 23:53:28 +0100
Message-ID: <20091216225328.GG21102@elf.ucw.cz>
References: <A6D19A13FE030A409EC4362C172E091F0E0495F6@eseldmw101.eemea.ericsson.se>
	<20091204104930.GA28625@sirena.org.uk>
	<A6D19A13FE030A409EC4362C172E091F0E071EB9@eseldmw101.eemea.ericsson.se>
	<20091207114825.GA26965@rakim.wolfsonmicro.main>
	<A6D19A13FE030A409EC4362C172E091F0E0A1FA1@eseldmw101.eemea.ericsson.se>
	<20091207165628.GA24981@rakim.wolfsonmicro.main>
	<20091213132413.GB1437@ucw.cz>
	<20091214121247.GB22388@rakim.wolfsonmicro.main>
Reply-To: Zaurus PDA developers list <zaurus-devel-cunTk1MwBs/k6gDgw6ADrEB+6BGkLq7r@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <zaurus-devel-bounces-cunTk1MwBs/k6gDgw6ADrEB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20091214121247.GB22388-HF5t3jzXg/6ND3a5+9QAFujbO/Zr0HzV@public.gmane.org>
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
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: thommycheck-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lenz-hcNo3dDEHLuVc3sceRu5cw@public.gmane.org, dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Brian Swetland <swetland-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, arminlitzel-S0/GAf8tV78@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dirk-RZHw+W3AUBHbFfAX06+HdQ@public.gmane.org, cbou-JGs/UdohzUI@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, Cyril Hrubis <metan-+ZI9xUNit7I@public.gmane.org>, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, zaurus-devel-cunTk1MwBs/k6gDgw6ADrEB+6BGkLq7r@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>

On Mon 2009-12-14 12:12:47, Mark Brown wrote:
> On Sun, Dec 13, 2009 at 02:24:14PM +0100, Pavel Machek wrote:
> 
> > > actual charger hardware.  My main concern here is that battery
> > > performance monitoring has no pressing need to be in kernel and that
> > > pushing it into the kernel creates a barrier to implementing more
> > > advanced schemes in userspace, which is especially serious given how
> > > involved this needs to be in order to be accurate.  
> 
> > Well, kernel provides /proc/apm emulation and many systems still rely
> > on it. So it would be nice to provide something halfway-decent there.
> 
> Unfortunately that's really painful in kernel since you really need to
> do state tracking over reboots, and even if you do that it's really
> not trivial.

No, I do not want to get _that_ advanced. But I'd really like to get
beyond "battery %age is linear function of measured battery voltage".

> > Plus you need to shutdown/suspend machine on battery critical. That
> > has to be in kernel and already needs those tricky parts.
> 
> Power failure detection based on voltage drop is much more reasonable
> but it's a very different thing to general battery capacity
> estimation.

Not sure...

> Normally you'd want to do the power failure detection separately anyway,
> monitoring the system supply voltage rather than the battery voltage.

Well, that way you'll discharge batteries too much and kill them
rather quickly, no? What is "system supply voltage" for PDA class
system, anyway? I don't think zaurus has ADCs on anything else than
thermistor, AC in voltage, battery voltage...

> Something like "Measure Battery Capacity Precisely in Medical Design"
> by Bernd Krafthoefer in Power Electronics Technology Jan 2005 might be
> useful here.

Thanks, it looks interesting. I'm not sure if it will be possible to
apply on zaurus, but... (While measuring voltage my underestimate the
old battery, I'm afraid they may overestimate it in bad conditions;
energy left is battery is useless if battery can't supply enough
current to keep CPU happy, because its too cold).
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
