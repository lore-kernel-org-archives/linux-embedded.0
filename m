From: Linus Walleij <linus.ml.walleij@gmail.com>
Subject: Re: [PATCH 1/2] MMC Agressive clocking framework v2
Date: Wed, 17 Jun 2009 11:26:22 +0200
Message-ID: <63386a3d0906170226s6db81934o18eccc92c8751242@mail.gmail.com>
References: <63386a3d0906020536t5a3391f9r921959ba6d6dd96e@mail.gmail.com>
	<20090615210930.27afe27a@mjolnir.ossman.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.arm.linux.org.uk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arm.linux.org.uk; s=lists; h=MIME-Version:In-Reply-To:
	References:Date:Message-ID:Subject:From:To:Cc:List-Id:
	List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	Content-Type:Content-Transfer-Encoding:Sender; bh=QKnRSeOn0Y0ur0
	rFWd+i6pQZqa6mR/J3+5fr/9prljI=; b=rnZyq2yI5ybUkzaQ62IKsP4IDTUWGa
	i75zJHMtCW6GsRkNo9zxLcV+Ck56Fe8UtEm4RHUsBS4DvwjT4NU5jvd111GnHfKM
	pUv63duWPkOD7YUz+ZRbtr2c2xlvfYd9TsBhEZKmYrT99Vqe0M2fog6TOqduyqm8
	So1AisbVW45XY=
In-Reply-To: <20090615210930.27afe27a@mjolnir.ossman.eu>
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.arm.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.arm.linux.org.uk/lurker/list/linux-arm-kernel.html>
List-Post: <mailto:linux-arm-kernel@lists.arm.linux.org.uk>
List-Help: <mailto:linux-arm-kernel-request@lists.arm.linux.org.uk?subject=help>
List-Subscribe: <http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.arm.linux.org.uk?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.arm.linux.org.uk
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.arm.linux.org.uk
To: Pierre Ossman <pierre@ossman.eu>
Cc: linux-arm-kernel@lists.arm.linux.org.uk, linux-embedded@vger.kernel.org, Linus Walleij <linus.walleij@stericsson.com>

2009/6/15 Pierre Ossman <pierre@ossman.eu>:

> On Tue, 2 Jun 2009 14:36:28 +0200
> Linus Walleij <linus.ml.walleij@gmail.com> wrote:
>
>> This patch modified the MMC core code to optionally call the
>> set_ios() operation on the driver with the clock frequency set
>> to 0 to gate the hardware block clock (and thus the MCI clock)
>> for an MMC host controller after a grace period of at least 8
>> MCLK cycles. It is inspired by existing clock gating code found
>> in the OMAP and Atmel drivers and brings this up to the host
>> abstraction. Gating is performed before and after any MMC request
>> or IOS operation, the other optional host operations will not
>> ungate/gate the clock since they do not necessary touch the
>> actual host controller hardware.
>>
>> It exemplifies by implementing this for the MMCI/PL180 MMC/SD
>> host controller, but it should be simple to switch OMAP and
>> Atmel over to using this instead.
>>
>> Signed-off-by: Linus Walleij <linus.walleij@stericsson.com>
>> ---
>
> This looks pretty good. We might want to make it more runtime
> configurable in the future, but this lays a nice groundwork. It's also
> nicely commented to boot. :)
>
> The only thing that concerns me is the locking and reference counting.
> Wouldn't it be sufficient to enable the clock around requests?

Actually that's all it does now, I had it also in mmc_rescan() but don't
think that's necessary (will do some more deep testing before sending
the updated patch).

> Or
> when the host lock is grabbed? Either version would remove the need for
> both clk_users and clk_lock. I think it would also remove a lot of the
> special logic you have.

I have renamed clk_users to clk_requests because that's what it counts
now. Its still needed however: the problem here is that we need to keep
the clock running a number of cycles after the last request, so we solve it
by increasing .clk_requests by one for every request, then decreasing by
one for every request that ends.

Of course requests are serialized, but the request counter is used for the
disablement work to know if any new request came in when we were
delaying for the clk_disable() call, this work will actually not be schedul=
ed
until after a few requests end and provides the necessary hysteresis.

The requests count would not be needed unless we were splitting of a
separate work, but we have to do that in order to have a burst of requests
serviced without waiting 8 MCI clocks inbetween each of them.
The idea here is just to delay set_ios() with freq =3D 0 until we know for
sure that the current burst of requests is ended.

When I put in some prints I see that there are lots of requests coming
in bursts so this forms a nice "clock on" window around them.

>> diff --git a/drivers/mmc/core/Kconfig b/drivers/mmc/core/Kconfig
>> index ab37a6d..6ae2156 100644
>> --- a/drivers/mmc/core/Kconfig
>> +++ b/drivers/mmc/core/Kconfig
>> @@ -14,3 +14,14 @@ config MMC_UNSAFE_RESUME
>> =A0 =A0 =A0 =A0 This option is usually just for embedded systems which u=
se
>> =A0 =A0 =A0 =A0 a MMC/SD card for rootfs. Most people should say N here.
>>
>> +config MMC_CLKGATE
>> + =A0 =A0 bool "MMC host clock gaing (EXPERIMENTAL)"
>> + =A0 =A0 depends on EXPERIMENTAL
>> + =A0 =A0 help
>> + =A0 =A0 =A0 This will attempt to agressively gate the clock to the MMC=
 host,
>> + =A0 =A0 =A0 which typically also will gate the MCI clock to the card. =
This
>> + =A0 =A0 =A0 is done to save power due to gating off the logic and bus =
noise
>> + =A0 =A0 =A0 when MMC is not in use. Your host driver has to support th=
is in
>> + =A0 =A0 =A0 order for it to be of any use.
>
> The last sense isn't true anymore, is it?

I rewrote it a bit: all drivers that want to perform clock gating still have
to handle the freq field being set to 0 and take apropriate action. This
is not the case when you don't enable clock gating, you get a few
requests with freq set to 0 in the initialization code but once it's set
to something it never goes to 0 again. Most drivers aren't written to
handle frequency 0, some will probably even get a division by 0
error if you try it (just a guess).

>> +
>> + =A0 =A0 =A0 Of unsure, say N.
>
> "If" :)
>
>> +/*
>> + * Internal work. Work to disable the clock at some later point.
>> + */
>> +static void mmc_clk_disable_work(struct work_struct *work)
>> +{
>> + =A0 =A0 struct mmc_host *host =3D container_of(work, struct mmc_host,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 clk_disable_work);
>> +
>> + =A0 =A0 mmc_clk_disable_delayed(host);
>> +}
>
> I think I did a bad job explaining my comments about this the last
> time. What I was trying to say was that why have this
> mmc_clk_disable_work() when you could give mmc_clk_disable_delayed()
> directly to the workqueue?

Because mmc_clk_disable_delayed() is also called in mmc_clk_exit()
like this:

if (cancel_work_sync(&host->clk_disable_work))
       mmc_clk_disable_delayed(host);

This is if we cancel a pending clock gating and need to make sure that
the clock is eventually gated off before stopping it. In this case if
cancel_work_sync() returns non-zero the work is cancelled but its
pending task still need to be fulfilled so we need to call
mmc_clk_disable_delayed() outside the work, and we cannot just
call the ios with freq set to 0 because we have no idea as to whether
8 MCI cycles (or whatever you configure) have actually passed since
the last request.

>> +/*
>> + * =A0 mmc_clk_remove - shut down clock gating code
>> + * =A0 @host: host with potential hardware clock to control
>> + */
>> +static inline void mmc_clk_remove(struct mmc_host *host)
>> +{
>> + =A0 =A0 if (cancel_work_sync(&host->clk_disable_work))
>> + =A0 =A0 =A0 =A0 =A0 =A0 mmc_clk_disable_delayed(host);
>> + =A0 =A0 BUG_ON(host->clk_users > 0);
>> +}
>
> I'm not sure why you call mmc_clk_disable_delayed() here. Is the clock
> properly enabled again when this function exits? It should be, but the
> disable call there has me confused.

Some previous request may have made the clock go on, then the
request has completed, but the 8 clock cycles have not yet passed.
So we cannot exit MMC until they have finished.

This way the clock gating framework will assure that the set_ios()
is called with freq =3D 0 before exiting MMC.

>> @@ -80,6 +235,8 @@ struct mmc_host *mmc_alloc_host(int extra, struct
>> device *dev)
>> =A0 =A0 =A0 host->class_dev.class =3D &mmc_host_class;
>> =A0 =A0 =A0 device_initialize(&host->class_dev);
>>
>> + =A0 =A0 mmc_clk_alloc(host);
>> +
>> =A0 =A0 =A0 spin_lock_init(&host->lock);
>> =A0 =A0 =A0 init_waitqueue_head(&host->wq);
>> =A0 =A0 =A0 INIT_DELAYED_WORK(&host->detect, mmc_rescan);
>> @@ -156,6 +313,8 @@ void mmc_remove_host(struct mmc_host *host)
>> =A0 =A0 =A0 device_del(&host->class_dev);
>>
>> =A0 =A0 =A0 led_trigger_unregister_simple(host->led);
>> +
>> + =A0 =A0 mmc_clk_remove(host);
>> =A0}
>>
>> =A0EXPORT_SYMBOL(mmc_remove_host);
>
> alloc and remove don't form a nice pair. I suggest add/remove or
> perhaps init/exit.

OK renamed it *init *exit.

Yours,
Linus Walleij

-------------------------------------------------------------------
List admin: http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-kernel
FAQ:        http://www.arm.linux.org.uk/mailinglists/faq.php
Etiquette:  http://www.arm.linux.org.uk/mailinglists/etiquette.php
