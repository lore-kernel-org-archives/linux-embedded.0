From: Linus WALLEIJ <linus.walleij@stericsson.com>
Subject: RE: [PATCH] RFC: AMBA bus discardable probe() function
Date: Thu, 5 Aug 2010 08:26:00 +0200
Message-ID: <CEE6BB42CAD6E947908279175AF8470A0262E58F8B@EXDCVYMBSTM006.EQ1STM.local>
References: <1280925543-6862-1-git-send-email-linus.walleij@stericsson.com>
 <20100804194319.GA30722@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100804194319.GA30722@suse.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Greg KH <gregkh@suse.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Brownell <dbrownell@users.sourceforge.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Viresh KUMAR <viresh.kumar@st.com>

[Greg]
> [Me]
> > +	spin_lock(&amba_bustype.p->klist_drivers.k_lock);
> 
> Ick, nope, you can't do this, sorry.  That's a "private" structure for
> a reason.

Yeah I get it, but in the platform bus case what's that traversal of 
the klists actually for? I didn't get it, and was guessing that it
was considering the case where devices spawn new devices.

> So what's the real driving force here, just saving a few hundred bytes
> after booting?  Or something else?

A few thousand actually according to Russells measurements.
And no I don't think it's worth it unless someone else challenge this...

Yours,
Linus Walleij
