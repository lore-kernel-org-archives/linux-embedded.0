From: Ray Lee <ray-lk@madrabbit.org>
Subject: Re: [PATCH] PM: Hide CONFIG_PM from users
Date: Mon, 7 Feb 2011 17:17:59 -0800
Message-ID: <AANLkTimh=8pSmQ6i-5H5+agSso7dCOcOrUJ6Uq_fu7nh@mail.gmail.com>
References: <20110207152132.GM10564@opensource.wolfsonmicro.com>
 <Pine.LNX.4.44L0.1102071035320.1924-100000@iolanthe.rowland.org> <20110207154953.GN10564@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:from
         :date:x-google-sender-auth:message-id:subject:to:cc:content-type;
        bh=B4Y3INFhbZEA9Rl8KI1S6+wtj/xZU2/+dLG9ATap2l8=;
        b=hNz8mEyzqnbHsxH5JhV1TDCap+k7lFrDkKqWJMfm2UyeZ/a8XYYIWPKxPviaExlAEU
         1xQzz210b5MzH1pHLUBpIHY+V49LQLFMNgHOZ1+JcWdumPj/AxMuHW/lJYlW/+ywgepM
         wSYl3fuEEEvUIxk1C4nHc6ILTZzcmoMIqOf8U=
In-Reply-To: <20110207154953.GN10564@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Stephen Rothwell <sfr@canb.auug.org.au>, Geert Uytterhoeven <geert@linux-m68k.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, Len Brown <len.brown@intel.com>, linux-pm@lists.linux-foundation.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-embedded@vger.kernel.org, ppc-dev <linuxppc-dev@lists.ozlabs.org>

On Mon, Feb 7, 2011 at 7:49 AM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> I'm rather hoping that they'll notice the mailing list thread or that
> someone else who knows what's going on with them does

Surely you're joking. I mean, do _you_ scan every message that comes
through lkml and its various sister lists?

Do a git blame and add them to the CC:. It's the polite thing to do.
