From: Andy Green <andy@warmcat.com>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi,	lightweight
 bootloader
Date: Wed, 23 Dec 2009 09:29:22 +0000
Message-ID: <4B31E2F2.4010206@warmcat.com>
References: <20091221193038.38CB63F6EF@gemini.denx.de> <4B2FD7DB.10008@warmcat.com> <20091221213829.1A8B93F6EF@gemini.denx.de> <4B2FF8E7.505@warmcat.com> <20091221231922.GO22533@pengutronix.de> <4B3081C3.3000909@warmcat.com> <20091222111250.GW22533@pengutronix.de> <4B3146E9.3010101@warmcat.com> <20091222232804.GB22533@pengutronix.de> <4B31D6F0.2040009@warmcat.com> <20091223085607.GE22533@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:sender:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=kJsNZTLXMmlbkkH+RYY0Puw1NYqFFLaAwtkFXSNs7P4=;
        b=jkhIZDw11pumLnMXph92OUGIEeReL07Lb432/x1sGRC6GeT7DlG2F+s4cwBW6UAQQ1
         Y/r3NT+hErl8/c7wI75B5IMcIH8/Ki4Zwf3fXCVWvAJxA67FivrZl0erl6VX8nUq5U9d
         vmHBYofYjWb62q95TUO6WlhTGuz9MPyOxhpIc=
In-Reply-To: <20091223085607.GE22533@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: Wolfgang Denk <wd@denx.de>, celinux-dev@tree.celinuxforum.org, linux-embedded@vger.kernel.org

On 12/23/09 08:56, Somebody in the thread at some point said:

Hi -

>> yourself because it's the buildroot mindset, that whole task
>> disappears  with a distro basis.
>
> If you don't step into for example toolchain problems or other crazy
> things...

Again this is buildroot thinking.  The distro provides both the native 
and cross toolchains for you.  You're going to want to use the same 
distro as you normally use on your box so the cross toolchain installs 
as a package there.

If all that's left is the risk of "crazy things" happening well that's a 
risk whatever you do or even if you do nothing :-)

> The oftree is currently provided by the bootloader, and much of what it
> contains is unprobable peripherals, i.e. the IP cores in the SoC cpus.
> For example for i.MX (which we happen to maintain in the mainline),
> there is a strong aim for having one kernel that runs on as many devices
> as possible. If you want to do this and if you can't probe significant
> parts of the hardware, you need an instance outside of the kernel who
> tells you what's actually there.

The only thing I know of that matches "outside the kernel" requirement 
is the machine ID that's passed in on ATAG.  I agree it's generally good 
to have a single build that's multipurpose.

On iMX you have to go read IIM to get device info but actually that's 
not hard.  But that device ID will itself alone tell you the on-SoC 
peripherals since there's an ID per die; it makes no difference if this 
expanded SoC oftree data itself lives in the kernel then.  The non-SoC 
stuff can just be probed.

> We have customers who care about "splash in 0.5 s" vs. "shell runs after
> 3 s, then qt starts". People may be used to that kind of noticable boot

That's fine, they can pay for the extra time to market and work done on 
the crap in their bootloader :-)  Many customers don't care if it acts 
in line with their general expectation and was delivered faster and 
cheaper than they expected.

> Do you remember the times when we had analog TV? We could zap through 5

But your CRT took a while to warm up / "boot" as well...

-Andy
