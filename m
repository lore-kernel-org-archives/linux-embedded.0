From: Linus WALLEIJ <linus.walleij@stericsson.com>
Subject: RE: [PATCH] RFC: AMBA bus discardable probe() function
Date: Thu, 5 Aug 2010 08:22:13 +0200
Message-ID: <CEE6BB42CAD6E947908279175AF8470A0262E58F84@EXDCVYMBSTM006.EQ1STM.local>
References: <1280925543-6862-1-git-send-email-linus.walleij@stericsson.com>
 <20100804222410.GB12502@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20100804222410.GB12502@n2100.arm.linux.org.uk>
Content-Language: en-US
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>, David Brownell <dbrownell@users.sourceforge.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Viresh KUMAR <viresh.kumar@st.com>

[Russell]

> which gives a total of 5188 bytes for all the above probe functions.
> However, in order to free this, we're adding 184 bytes of code and
> literal pool to achieve this:
> (...) 
> The overall kernel size is 3877020 bytes, which means we're potentially
> allowing for 0.13% of the kernel to be freed at run time - which may
> equate to one or at most two additional pages.

We have the PL022 as well, and the PL08x is being added but it will
likely stay in that ballpark figure.

But overall that does not seem to be worth it, so let's drop it
for the time being. CC:ing the linux-embedded folks that
often worry about footprint size to see if someone oppose. Also
CC Viresh who works on a platform for e.g. set-top boxes using
these PrimeCells which I think may be memory-constrained.

Yours,
Linus Walleij

