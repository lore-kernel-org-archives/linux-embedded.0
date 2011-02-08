From: Tim Bird <tbird20d@gmail.com>
Subject: Re: [PATCH] Remove CONFIG_PM altogether, enable power management all
 the time
Date: Tue, 8 Feb 2011 15:35:32 -0800
Message-ID: <AANLkTimWnT8f=PyLgOOrZOaMx0pdv+yNtPw2T7=kO2G-@mail.gmail.com>
References: <1297081335-13631-1-git-send-email-broonie@opensource.wolfsonmicro.com>
	<201102072046.48763.rjw@sisk.pl>
	<20110207201803.GU10564@opensource.wolfsonmicro.com>
	<201102072215.59921.rjw@sisk.pl>
	<20110208122159.GA8284@elte.hu>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=Tg79Q2NgGBUH/VY64lOBEKqKiN462t9xbNmUW5aQ6mE=;
        b=mJL/IfZ1ik/94gdRsKtsUzizF5SILBUHLetpzKzvM7pK2FTQNypvE5G/Go7Vov1J0d
         1cVO7QhYfXpCfo3uetU4LZxqIri1qBHSqLAPu2ZMbdT7zNGuPynsOUUtsrhn7zgOu/hy
         luPQVAwlSWXdQQGM9oTjryC9PkARV2XZVqK6Y=
In-Reply-To: <20110208122159.GA8284@elte.hu>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Len Brown <len.brown@intel.com>, Alan Stern <stern@rowland.harvard.edu>, linux-pm@lists.linux-foundation.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-embedded@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

On Tue, Feb 8, 2011 at 4:21 AM, Ingo Molnar <mingo@elte.hu> wrote:
> Rafael, could you do a defconfig-ish x86 build with and without CONFIG_PM, and post
> the 'size vmlinux' comparison - so that we can see the size difference? We make some
> things CONFIG_EXPERT configurable just to enable folks who *really* want to cut down
> on kernel size to configure it out.

I'm one of those people who *really* wants to cut down the kernel size.
I've recently worked on a product where the kernel RAM budget is ~1M.

>
> Note that those usecases, even if they want a super-small kernel, might not care
> about PM at all while they care about size: small boot kernels in ROMs, or simple
> devices where CPU-idling implies deep low power mode, etc.
>
> So the vmlinux size comparisons would be needed really. If it's 5k nobody will care.
I care about 5K.  (But honestly, I don't actively hunt stuff less than
10K in size, because
there's too many of them to chase, currently).

 -- Tim
