From: Gilad Ben-Yossef <gilad@codefidence.com>
Subject: Re: ramfs/tmpfs for application partition
Date: Sun, 18 Jan 2009 15:55:27 +0200
Message-ID: <497334CF.5020400@codefidence.com>
References: <FF584854D6FFE547AB2F7515A798AC3A045716A1B4@venus.imagineil.tv> <8bd0f97a0901150904p134def6ay66797705cab99595@mail.gmail.com> <4972E3F4.1020508@codefidence.com> <FF584854D6FFE547AB2F7515A798AC3A045716A316@venus.imagineil.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <FF584854D6FFE547AB2F7515A798AC3A045716A316@venus.imagineil.tv>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Jacob Avraham <jacob@imaginecommunications.com>
Cc: Mike Frysinger <vapier.adi@gmail.com>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

Jacob Avraham wrote:

> Gilad,
>
> Not out of the woods yet.
>
> I can=92t just burn a tar ball straight into a raw mtd partition. Whe=
n=20
> I=92ll try to untar it, if I=92ll do:
>
> tar zxf /dev/mtd6
>
> tar will read the whole mtd partition, and I don=92t think it=92s a g=
ood=20
> idea to use a raw device as tar file.
>
> So should I package the tar in a filesystem, like cramfs?
>
That's certainly possible - just make sure your tar file is smaller the=
n=20
the 256Mb file limit of cramfs (if memory serves me right) - otherwise=20
just use squashfs.


I'll add that if you're already going to have a file system (and your=20
reasons seems to make sense to me) I would have just forgot about the=20
tar file and put the file in cramfs/squashfs to begin with and just cop=
y=20
them over the initramfs during boot (something like cp -a /mnt/mtd6/* /=
).

> In that case, I don=92t need to compress the tar file, as cramfs is=20
> compressed, right?
>
That is correct.


Gilad




--=20
Gilad Ben-Yossef=20
Chief Coffee Drinker

Codefidence Ltd.
The code is free, your time isn't.(TM)

Web:    http://codefidence.com
Email:  gilad@codefidence.com
Office: +972-8-9316883 ext. 201
=46ax:    +972-8-9316885
Mobile: +972-52-8260388

	The Doctor: Don't worry, Reinette, just a nightmare.=20
	Everyone has nightmares. Even monsters from under the=20
	bed have nightmares, don't you, monster?
	Reinette: What do monsters have nightmares about?
	The Doctor: Me!=20
