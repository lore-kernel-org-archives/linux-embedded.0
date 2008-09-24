From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: [RFC] Remove more code when IP_MULTICAST=n
Date: Wed, 24 Sep 2008 10:08:22 -0700
Message-ID: <48DA7406.8050209@am.sony.com>
References: <20080819150047.38f09acf@surf>	<Pine.LNX.4.64.0808191618190.25348@vixen.sonytel.be>	<20080825084826.19923151@surf>	<20080826033345.GA30587@linux-sh.org>	<48B432EF.1010403@am.sony.com> <20080924173333.4fa1e50d@surf>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080924173333.4fa1e50d@surf>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Paul Mundt <lethal@linux-sh.org>, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, linux-embedded@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Michael Opdenacker <michael@free-electrons.com>

Thomas Petazzoni wrote:
> The patch doesn't try to get multicast support to work without IGMP,
> but tries to remove as much code as possible when multicast support is
> not needed.

Ok, that's different than I thought.  Sorry I missed that in your
original message. I thought this was making an
extra slice (a'la approach one).  Instead it's just making the
existing slice more accurate.

> Two approaches have been tried :
> 
>  * The first one, by Matt Mackall, was to add a new CONFIG_IGMP option
>    next to the existing CONFIG_MULTICAST option, to disable the parts
>    of the IGMP protocol support that were still compiled-in when
>    CONFIG_MULTICAST=n
> 
>  * The second one, this patch, simply removes the IGMP protocol code
>    when CONFIG_MULTICAST=n, because my understanding is that the IGMP
>    protocol code is useless when multicast is not used.

This is correct.  IGMP ONLY makes sense if you have multicast support!

> I might try to send this second approach to netdev, but it seems that
> not everybody agrees on the approach of removing things for the kernel
> by adding more and more configuration options.

That would be irrelevant for this patch.

> If the network
> maintainers don't agree with this approach, then I'm not sure how we
> can make this patch progress in any way (and this is not an accusation
> towards the network maintainers, they also have valid and good
> arguments against the addition of dozens of configuration options to
> disable a few KB of code).

Well, if we're not adding a new config option, but just making
the existing option better, I have a hard time seeing the problem,
even if the savings are small.

It's kind of dumb to have dead code lying around.  Since the new
patch adds nothing to the configuration space, the only downside
I can see is the possible increase in maintenance burden caused
by conditional code.  But, then again, I'm not a networking guy.
I think we should submit this.  If the networking
guys want to see CONFIG_MULTICAST removed, that's a completely
separate argument (and one I would disagree with).  But we
shouldn't need to fight that fight here.

My understanding is that the network guys have not see this new
patch yet.  I think we should make sure they see it and get their
response.  (Not in any confrontational way).
They may yet have valid reasons why slicing this stuff
out will hurt something.  But if their only complaint is that they
don't like multicast going away, that's something else.
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================
