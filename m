From: David VomLehn <dvomlehn@cisco.com>
Subject: Re: Kernel crashing and log buffers...
Date: Thu, 11 Jun 2009 18:07:07 -0700
Message-ID: <20090612010707.GB23715@cuplxvomd02.corp.sa.net>
References: <200906102126.40410.rgetz@blackfin.uclinux.org> <20090611175303.GA10058@cuplxvomd02.corp.sa.net> <8bd0f97a0906111627h128cc561y2bf4a0b2b30d7187@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8bd0f97a0906111627h128cc561y2bf4a0b2b30d7187@mail.gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=1662; t=1244768827; x=1245632827;
	c=relaxed/simple; s=sjdkim1004;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn@cisco.com;
	z=From:=20David=20VomLehn=20<dvomlehn@cisco.com>
	|Subject:=20Re=3A=20Kernel=20crashing=20and=20log=20buffers
	...
	|Sender:=20;
	bh=N5gNp7EyBdd/rhrwxRCHfHtM9UKKsba+VxHA4nZPNA8=;
	b=FPDd41xHlK2ed24Kt64RuCFJP6TXOhkfZCr2Q1hKcTJ7QUroRLVn4Z83X1
	+SRspG/i5HCSmJdcr6qBkMpnkTcldPVytJgMrBUlOj6f/dtW2VxjwP0nffNG
	Siuws9kQkMGiyh98Q9unCUfEk19rCVknM8hJdlcdOaIDIZzEmXqxo=;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: Robin Getz <rgetz@blackfin.uclinux.org>, Greg Ungerer <gerg@snapgear.com>, Russell King <rmk@arm.linux.org.uk>, Paul Mundt <lethal@linux-sh.org>, Tim Bird <tim.bird@am.sony.com>, Wolfgang Denk <wd@denx.de>, Grant Erickson <gerickson@nuovations.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Thu, Jun 11, 2009 at 07:27:16PM -0400, Mike Frysinger wrote:
> On Thu, Jun 11, 2009 at 13:53, David VomLehn wrote:
> > On Wed, Jun 10, 2009 at 09:26:40PM -0400, Robin Getz wrote:
=2E..
> > Our kernel does crash, so we have to do this. I had submitted a pat=
ch a
> > while ago that tweaks emit_log_char, but this was bounced, reasonab=
ly,
> > because it would be interferring with the great majority of people =
who
> > are not interested in capturing log output. The suggestion was made=
 that
> > we do this with a console driver. I've recently got a version worki=
ng, as
> > a module, but I've only started testing of the version integrated i=
nto the
> > kernel tree. =A0Still, post early, post often, so I've appended a v=
ersion
> > of the patch here to see if this seems to be the right direction.
>=20
> i guess there's two distinct crash types: early and late.  your
> console driver seems like it should be able to handle the "late"
> variety ok (i.e. the kernel is up and running and at some point, it
> blows up).  but it doesnt address the early crashes which is what
> we're currently looking for (i.e. kernel crash occurs before the
> serial console is up and running).
>=20
> i think extending this driver to include early printk support should
> address that ?

If you really want to see really early output, I don't think this will =
give
you more benefit than simply looking at log_buf through your favorite k=
ernel
debugging tool. Which is something I do with some regularity, so I know=
 that
it can be a bit of a pain. It may be helpful if you can say a bit more =
about
the problem you are trying to solve.

> -mike

David VomLehn
