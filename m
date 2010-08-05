From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] RFC: AMBA bus discardable probe() function
Date: Wed, 4 Aug 2010 23:43:26 -0700
Message-ID: <201008042343.27043.dmitry.torokhov@gmail.com>
References: <1280925543-6862-1-git-send-email-linus.walleij@stericsson.com> <20100804194319.GA30722@suse.de> <CEE6BB42CAD6E947908279175AF8470A0262E58F8B@EXDCVYMBSTM006.EQ1STM.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=ZT5AyTLHTv/vw80DkpsfAiNTp10N9AGea0Y7PSkzOUA=;
        b=RRwXHLMCAsUrGRab+/V6zQd1edV04bxi5nf2fccTzEI4L/xk2gq3jl1Tpo3JIiofRa
         gafjMDG5XHaCnoYOnEjNtqVGKzkpqXYbUy8p4uudAcHMnOWvH+OzPAdA+GOoQNvDVnrL
         wSVcOhwQxZNmqymfB5ZmteZAFMpo/lUNiYQh4=
In-Reply-To: <CEE6BB42CAD6E947908279175AF8470A0262E58F8B@EXDCVYMBSTM006.EQ1STM.local>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Linus WALLEIJ <linus.walleij@stericsson.com>
Cc: Greg KH <gregkh@suse.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Brownell <dbrownell@users.sourceforge.net>, Russell King <linux@arm.linux.org.uk>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Viresh KUMAR <viresh.kumar@st.com>

On Wednesday, August 04, 2010 11:26:00 pm Linus WALLEIJ wrote:
> [Greg]
> 
> > [Me]
> > 
> > > +	spin_lock(&amba_bustype.p->klist_drivers.k_lock);
> > 
> > Ick, nope, you can't do this, sorry.  That's a "private" structure for
> > a reason.
> 
> Yeah I get it, but in the platform bus case what's that traversal of
> the klists actually for? I didn't get it, and was guessing that it
> was considering the case where devices spawn new devices.

It is to check if the driver actually bound to any devices and fail driver
registration if it did not - then, in case of modular build, entire driver
module might get unloaded from memory as well.

-- 
Dmitry
