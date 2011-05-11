From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH 0/4] Speed up the symbols' resolution process V4
Date: Tue, 10 May 2011 23:32:46 -0400
Message-ID: <BANLkTi=y60Jt3-OMzbxQJzGkvzCzNJfJtA@mail.gmail.com>
References: <1302960373-5309-1-git-send-email-abogani@kernel.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=7Ou7Igs65CmD2AU/AfSuvX3rxam5L7dPrAYLy0mQfxA=;
        b=dltAEZoRL/V48zUpO4PNZYQtoYB67WUaTvBg6WjOaC7Ww1EI0/FUJRATatP5spjeNQ
         xn4sVzpodEPAkaieGucCJmQYgfuKoRo8iHvZVpC6ocT10J03rIg9if9JGsMmTEAuq7Jc
         4LikWYCyt0k+FB3GWdDxDYTnjmMVbdnsPtJo0=
In-Reply-To: <1302960373-5309-1-git-send-email-abogani@kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessio Igor Bogani <abogani@kernel.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Tim Abbott <tabbott@ksplice.com>, Anders Kaseorg <andersk@ksplice.com>, Jason Wessel <jason.wessel@windriver.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>

On Sat, Apr 16, 2011 at 09:26, Alessio Igor Bogani wrote:
> In the first place I changed the code for place every symbol in a different
> section (for example: "___ksymtab" sec "__" #sym) at compile time (this the
> above mentioned trick!). Thus I request to the linker to sort and merge all
> these sections into the appropriate ones (for example: "__ksymtab") at link
> time using the linker scripts. Once all symbols are sorted we can use binary
> search instead of the linear one.

this breaks symbol prefixed arches (like Blackfin):
  CC      kernel/softirq.o
/tmp/ccp3A6LU.s: Assembler messages:
/tmp/ccp3A6LU.s:3734: Error: symbol `___ksymtab__local_bh_enable' is
already defined
make[1]: *** [kernel/softirq.o] Error 1

this is because your new system of section naming happens to overlap
actual symbol names and the gnu assembler does not allow you to
declare a section and a symbol with the same name.

might be better to pick a separator that cannot appear in a symbol
name.  so rather than "__", use "+".  or some other funky char.
-mike
