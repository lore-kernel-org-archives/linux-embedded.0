From: Pierre Ossman <pierre@ossman.eu>
Subject: Re: [PATCH 1/2] MMC Agressive clocking framework v2
Date: Mon, 15 Jun 2009 21:09:30 +0200
Message-ID: <20090615210930.27afe27a@mjolnir.ossman.eu>
References: <63386a3d0906020536t5a3391f9r921959ba6d6dd96e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1; protocol="application/pgp-signature"; boundary="=_freyr.ossman.eu-28951-1245092974-0001-2"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <63386a3d0906020536t5a3391f9r921959ba6d6dd96e@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Linus Walleij <linus.ml.walleij@gmail.com>
Cc: linux-arm-kernel@lists.arm.linux.org.uk, linux-embedded@vger.kernel.org, Linus Walleij <linus.walleij@stericsson.com>

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_freyr.ossman.eu-28951-1245092974-0001-2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 2 Jun 2009 14:36:28 +0200
Linus Walleij <linus.ml.walleij@gmail.com> wrote:

> This patch modified the MMC core code to optionally call the
> set_ios() operation on the driver with the clock frequency set
> to 0 to gate the hardware block clock (and thus the MCI clock)
> for an MMC host controller after a grace period of at least 8
> MCLK cycles. It is inspired by existing clock gating code found
> in the OMAP and Atmel drivers and brings this up to the host
> abstraction. Gating is performed before and after any MMC request
> or IOS operation, the other optional host operations will not
> ungate/gate the clock since they do not necessary touch the
> actual host controller hardware.
>=20
> It exemplifies by implementing this for the MMCI/PL180 MMC/SD
> host controller, but it should be simple to switch OMAP and
> Atmel over to using this instead.
>=20
> Signed-off-by: Linus Walleij <linus.walleij@stericsson.com>
> ---

This looks pretty good. We might want to make it more runtime
configurable in the future, but this lays a nice groundwork. It's also
nicely commented to boot. :)

The only thing that concerns me is the locking and reference counting.
Wouldn't it be sufficient to enable the clock around requests? Or
when the host lock is grabbed? Either version would remove the need for
both clk_users and clk_lock. I think it would also remove a lot of the
special logic you have.

> diff --git a/drivers/mmc/core/Kconfig b/drivers/mmc/core/Kconfig
> index ab37a6d..6ae2156 100644
> --- a/drivers/mmc/core/Kconfig
> +++ b/drivers/mmc/core/Kconfig
> @@ -14,3 +14,14 @@ config MMC_UNSAFE_RESUME
>  	  This option is usually just for embedded systems which use
>  	  a MMC/SD card for rootfs. Most people should say N here.
>=20
> +config MMC_CLKGATE
> +	bool "MMC host clock gaing (EXPERIMENTAL)"
> +	depends on EXPERIMENTAL
> +	help
> +	  This will attempt to agressively gate the clock to the MMC host,
> +	  which typically also will gate the MCI clock to the card. This
> +	  is done to save power due to gating off the logic and bus noise
> +	  when MMC is not in use. Your host driver has to support this in
> +	  order for it to be of any use.

The last sense isn't true anymore, is it?

> +
> +	  Of unsure, say N.

"If" :)

> +/*
> + * Internal work. Work to disable the clock at some later point.
> + */
> +static void mmc_clk_disable_work(struct work_struct *work)
> +{
> +	struct mmc_host *host =3D container_of(work, struct mmc_host,
> +					      clk_disable_work);
> +
> +	mmc_clk_disable_delayed(host);
> +}

I think I did a bad job explaining my comments about this the last
time. What I was trying to say was that why have this
mmc_clk_disable_work() when you could give mmc_clk_disable_delayed()
directly to the workqueue?

> +/*
> + *	mmc_clk_remove - shut down clock gating code
> + *	@host: host with potential hardware clock to control
> + */
> +static inline void mmc_clk_remove(struct mmc_host *host)
> +{
> +	if (cancel_work_sync(&host->clk_disable_work))
> +		mmc_clk_disable_delayed(host);
> +	BUG_ON(host->clk_users > 0);
> +}

I'm not sure why you call mmc_clk_disable_delayed() here. Is the clock
properly enabled again when this function exits? It should be, but the
disable call there has me confused.

> @@ -80,6 +235,8 @@ struct mmc_host *mmc_alloc_host(int extra, struct
> device *dev)
>  	host->class_dev.class =3D &mmc_host_class;
>  	device_initialize(&host->class_dev);
>=20
> +	mmc_clk_alloc(host);
> +
>  	spin_lock_init(&host->lock);
>  	init_waitqueue_head(&host->wq);
>  	INIT_DELAYED_WORK(&host->detect, mmc_rescan);
> @@ -156,6 +313,8 @@ void mmc_remove_host(struct mmc_host *host)
>  	device_del(&host->class_dev);
>=20
>  	led_trigger_unregister_simple(host->led);
> +
> +	mmc_clk_remove(host);
>  }
>=20
>  EXPORT_SYMBOL(mmc_remove_host);

alloc and remove don't form a nice pair. I suggest add/remove or
perhaps init/exit.

Rgds
--=20
     -- Pierre Ossman

  WARNING: This correspondence is being monitored by the
  Swedish government. Make sure your server uses encryption
  for SMTP traffic and consider using PGP for end-to-end
  encryption.

--=_freyr.ossman.eu-28951-1245092974-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEARECAAYFAko2nG0ACgkQ7b8eESbyJLjtyACeJxm9pTEhyO33HvnMsyZ7L7SA
+08An2T6UoAwOZmpKH1m0griD6E5Xz9q
=XLT7
-----END PGP SIGNATURE-----

--=_freyr.ossman.eu-28951-1245092974-0001-2--
