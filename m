From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [RFC] Remove more code when IP_MULTICAST=n
Date: Wed, 24 Sep 2008 17:33:33 +0200
Message-ID: <20080924173333.4fa1e50d@surf>
References: <20080819150047.38f09acf@surf>
	<Pine.LNX.4.64.0808191618190.25348@vixen.sonytel.be>
	<20080825084826.19923151@surf>
	<20080826033345.GA30587@linux-sh.org>
	<48B432EF.1010403@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48B432EF.1010403@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Paul Mundt <lethal@linux-sh.org>, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, linux-embedded@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Michael Opdenacker <michael@free-electrons.com>

Le Tue, 26 Aug 2008 09:44:31 -0700,
Tim Bird <tim.bird@am.sony.com> a =C3=A9crit :

> In this particular case, I think we need to show that
> there are valid cases were an embedded product can use networking jus=
t
> fine, without IGMP support but with support for multicast.  (I believ=
e
> that's  the slice that this particular patch makes).  IMHO, what's
> needed is a test to show that this works.  This can then be presented
> to the netdev guys, who are, after all much more experienced with the
> networking stuff.  If they can show that multicast does indeed *need*
> IGMP to work correctly, then we need to back off.  The last thing I
> want is to find out in the field that some streaming feature I've
> built into a Sony camera that relies on multicast won't work in lots
> of network configurations.  If that's true, then David is doing me a
> favor by saying No. (Note that I might still make the decision to
> forego a feature for size reasons if the number of instances of
> non-workingness was small.)

The patch doesn't try to get multicast support to work without IGMP,
but tries to remove as much code as possible when multicast support is
not needed.

Two approaches have been tried :

 * The first one, by Matt Mackall, was to add a new CONFIG_IGMP option
   next to the existing CONFIG_MULTICAST option, to disable the parts
   of the IGMP protocol support that were still compiled-in when
   CONFIG_MULTICAST=3Dn

 * The second one, this patch, simply removes the IGMP protocol code
   when CONFIG_MULTICAST=3Dn, because my understanding is that the IGMP
   protocol code is useless when multicast is not used.

I might try to send this second approach to netdev, but it seems that
not everybody agrees on the approach of removing things for the kernel
by adding more and more configuration options. If the network
maintainers don't agree with this approach, then I'm not sure how we
can make this patch progress in any way (and this is not an accusation
towards the network maintainers, they also have valid and good
arguments against the addition of dozens of configuration options to
disable a few KB of code).

Sincerly,

Thomas
--=20
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
