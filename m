From: Florian Fainelli <florian@openwrt.org>
Subject: Re: [PATCH] net: phy: Add config option to specify external switch port to be used if switch is used as PHY
Date: Thu, 8 Sep 2011 10:39:35 +0200
Message-ID: <201109081039.35272.florian@openwrt.org>
References: <4E68668F.9060008@televic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=sender:from:organization:to:subject:date:user-agent:cc:references
         :in-reply-to:mime-version:content-type:content-transfer-encoding
         :message-id;
        bh=et3+8Le2HBHgEfGy9Nb18Tq3aok2RzzLBrKofMfWNQs=;
        b=L9MoaHJwaZwvuGL20dp6eQ0o/1Yl4R6F9lCZXy9DAJ4tV1c8hUkIZRIWyoQ3UPpScB
         0CmnwDsApwZvYHOigRXyCfxTRcGl1wvqWD+k/Gy6qbIAg0KM6cncxoGivqPMRtiE8jxO
         ZfRGB8ouh0PTb4k+Gp/IyKwZc3e88RHgW68sA=
In-Reply-To: <4E68668F.9060008@televic.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="windows-1252"
To: Lambrecht =?utf-8?q?J=C3=BCrgen?= <J.Lambrecht@televic.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

Hello Jurgen,

On Thursday 08 September 2011 08:54:07 Lambrecht J=C3=BCrgen wrote:
> Hello,
>=20
> In our embedded designs, this is a useful patch. Maybe it can be usef=
ul
> for somebody else too.
> Or maybe there are already better solutions?
> I know I could also write a driver for our switch, but that is too mu=
ch
> effort just to select the active port.

This is not going to work well with all switches out there. You could u=
se the=20
fixed-PHY driver to make your ethernet driver see the link as always up=
 between=20
the MAC and switch CPU port.

A better solution would be to have proper switch drivers and user-space=
, which=20
reminds me that we (OpenWrt) should at some point propose our switch dr=
ivers=20
[1] for review.

[1]:=20
https://dev.openwrt.org/browser/trunk/target/linux/generic/files/driver=
s/net/phy/

>=20
> Kind regards,
> J=C3=BCrgen
>=20
>    In embedded design, instead of a PHY, sometimes a switch is used t=
hat
>            behaves as a PHY through its MII port. For example to use =
a
> daisy chain network configuration instead of an expensive star config=
=2E In
> that case, many phy ports are available, but only 1 should be used
>            to check link status, and not the first one available as i=
s
> the case
>            without this configuration (that is, set to its default va=
lue
> 0). So this options specifies the switch port number to be used to ch=
eck
>            link status, because if the link is down, no data is sent =
by the
>            TCP/IP stack.
>=20
> Signed-off-by: J=C3=BCrgen Lambrecht <J.Lambrecht@televic.com>
> ---
>   drivers/net/phy/Kconfig    |   14 ++++++++++++++
>   drivers/net/phy/mdio_bus.c |    9 +++++++++
>   2 files changed, 23 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
> index a702443..554561f 100644
> --- a/drivers/net/phy/Kconfig
> +++ b/drivers/net/phy/Kconfig
> @@ -13,6 +13,20 @@ menuconfig PHYLIB
>=20
>   if PHYLIB
>=20
> +config SWITCH_PHY
> +       int "External switch port to be used if switch is used as PHY=
"
> +       default "0"
> +       help
> +         In embedded design, instead of a PHY, sometimes a switch is
> used that
> +         behaves as a PHY through its MII port. For example to use a=
 daisy
> +         chain network configuration instead of an expensive star co=
nfig.
> +         In that case, many phy ports are available, but only 1 shou=
ld
> be used
> +         to check link status, and not the first one available as is
> the case
> +         without this configuration (that is, set to its default val=
ue 0).
> +         So this options specifies the switch port number to be used=
 to
> check
> +         link status, because if the link is down, no data is sent b=
y the
> +         TCP/IP stack.
> +
>   comment "MII PHY device drivers"
>=20
>   config MARVELL_PHY
> diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
> index 6c58da2..016437a 100644
> --- a/drivers/net/phy/mdio_bus.c
> +++ b/drivers/net/phy/mdio_bus.c
> @@ -112,7 +112,14 @@ int mdiobus_register(struct mii_bus *bus)
>          if (bus->reset)
>                  bus->reset(bus);
>=20
> +       /* The config below is always availble with CONFIG_PHYLIB. If=
 0,
> the +          behavior is as before without this patch (or P0 of the
> switch is +          taken because it is the first one found). */
> +#if CONFIG_SWITCH_PHY
> +       i =3D CONFIG_SWITCH_PHY;
> +#else
>          for (i =3D 0; i < PHY_MAX_ADDR; i++) {
> +#endif
>                  if ((bus->phy_mask & (1 << i)) =3D=3D 0) {
>                          struct phy_device *phydev;
>=20
> @@ -122,7 +129,9 @@ int mdiobus_register(struct mii_bus *bus)
>                                  goto error;
>                          }
>                  }
> +#if !CONFIG_SWITCH_PHY
>          }
> +#endif
>=20
>          bus->state =3D MDIOBUS_REGISTERED;
>          pr_info("%s: probed\n", bus->name);
> --
> 1.7.1
> N=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDr=EF=BF=BD=EF=BF=BDy=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDb=EF=BF=BDX=EF=BF=BD=EF=BF=BD=C7=A7v=EF=
=BF=BD^=EF=BF=BD)=DE=BA{.n=EF=BF=BD+=EF=BF=BD=EF=BF=BD=EF=BF=BDz=EF=BF=BD=
^=EF=BF=BD)=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDw*=1Fjg=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=1E=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=DD=A2j/=EF=BF=
=BD=EF=BF=BD=EF=BF=BDz=EF=BF=BD=DE=96=EF=BF=BD=EF=BF=BD2=EF=BF=BD=DE=99=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD
> &=EF=BF=BD)=DF=A1=EF=BF=BDa=EF=BF=BD=EF=BF=BD=7F=EF=BF=BD=EF=BF=BD=1E=
=EF=BF=BDG=EF=BF=BD=EF=BF=BD=EF=BF=BDh=EF=BF=BD=0F=EF=BF=BDj:+v=EF=BF=BD=
=EF=BF=BD=EF=BF=BDw=EF=BF=BD=EF=BF=BD=D9=A5

--=20
=46lorian
