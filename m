From: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [PATCHv6] UBI: new module ubiblk: block layer on top of UBI
Date: Mon, 26 Sep 2011 11:17:22 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.1109261103590.12195@lnxricardw.se.axis.com>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	<1316678312-8913-1-git-send-email-david.wagner@free-electrons.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1316678312-8913-1-git-send-email-david.wagner@free-electrons.com>
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: David Wagner <david.wagner@free-electrons.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-embedded <linux-embedded@vger.kernel.org>, Artem Bityutskiy <dedekind1@gmail.com>, lkml <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, Tim Bird <tim.bird@am.sony.com>, David Woodhouse <dwmw2@infradead.org>


On Thu, 22 Sep 2011, David Wagner wrote:

> ubiblk is a read-only block layer on top of UBI.  It presents UBI volumes=
 as
> ...

I decided to try this out, as I've been looking for a flexible =

block-device-on-ubi scheme for using a cramfs or squashfs root file system =

over UBI without having to resort to gluebi (which in its current =

implementation is too inflexible for my needs).

This can't be considered a complete test, as I basically just booted the =

system a couple of times, using a cramfs file system residing in an UBI =

volume. I compiled ubiblk built in to the kernel, not as a module; =

furthermore, I'm running 2.6.35 for various reasons, so had to backport =

kstrtoul from 2.6.39 in order to get it to build.

But for what it's worth, it does confirm that it in fact works to set up a =

ubiblk device at boot time for the root filesystem.

There doesn't seem to be a userspace application for attaching/detaching =

ubiblk devices. I hacked together something based on ubinfo, I could post =

it, but perhaps something more thorough is forthcoming?

A couple of comments below:

> +/**
> + * ubiblk_ctrl_ioctl - ioctl handling for proxying/unproxying a UBI volu=
me
> + *
> + * @file: the file on which the ioctl was invoked (usunsed)
                                                     ^^^^^^^ typo: unused
> + * @cmd: the ioctl type
> + * @arg: additional command informations
> + */
> +static long ubiblk_ctrl_ioctl(struct file *file, unsigned int cmd,
> +                             unsigned long arg)


> +/**
> + * ubiblk_parse_volume_param - parse the "volume" module parameter
> + *
> + * @ubi_num: where to store the UBI device number
> + * @vol_id: where to store the volume ID
> + */
> +static int __init ubiblk_parse_volume_param(int *ubi_num, int *vol_id)
> +{
> +       char *tokens[2] =3D {NULL, NULL};
> +       char buf[VOL_PARAM_MAXLEN];
> +       char *pbuf =3D buf;
> +       int len =3D strlen(buf);
                            ^^^  this needs to be volume, not buf.

/Ricard
-- =

Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
