From: Tim Bird <tim.bird@am.sony.com>
Subject: new ipdelay= option for faster netboot (was Re: New fast(?)-boot
 results on ARM)
Date: Mon, 17 Aug 2009 15:35:01 -0700
Message-ID: <4A89DB15.6060101@am.sony.com>
References: <20090814170228.GM13320@pengutronix.de> <1158166a0908141304y70300ab3p899b0d4609efded9@mail.gmail.com> <20090814204305.GA31727@pengutronix.de> <4A89AC40.2040109@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758217AbZHQWfd@vger.kernel.org>
In-Reply-To: <4A89AC40.2040109@am.sony.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: Denys Vlasenko <vda.linux@googlemail.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>, kernel@pengutronix.de

Tim Bird wrote:
> See the definitions of CONF_PRE_OPEN and CON_POST_OPEN
> in net/ipv4/ipconfig.c
> 
> They are set to ridiculously long values.  In my experience,
> you can cut them down considerably with no dangerous side
> effects (but I haven't asked the network guys about the
> possible downsides).

It turns out that others have seen this delay.  Simon
Arlott recently posted a patch to make the delay avoidable
at boot time from the kernel command line.

See http://patchwork.kernel.org/patch/31678/
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================
