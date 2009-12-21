From: Matt Hsu <matt@0xlab.org>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi, lightweight
 bootloader
Date: Mon, 21 Dec 2009 13:51:23 +0800
Message-ID: <4B2F0CDB.3050305@0xlab.org>
References: <4B29EC68.1040109@0xlab.org> <200912202045.37159.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200912202045.37159.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rob Landley <rob@landley.net>
Cc: celinux-dev@tree.celinuxforum.org, linux-embedded@vger.kernel.org, Andy Green <andy@warmcat.com>

Rob Landley wrote:
> However, if that's your minimum then you can't use the bootloader to re-flash 
> the device, which is kind of handy.  (It gives you an un-bricking fallback 
> short of pulling out a jtag.) 
    Hi Rob,

    Well, Boot from SD is your good friend.

    If you look at the platform that Qi which is supported, most of them 
all have this feature.
    If you notice the trend of SoC, booting from peripherals becomes a 
must.

    Once you step into kernel via Qi, kernel provides you everything 
such as mtd utils to re-flash device.
    We don't need to support programming the device in the bootloader 
anymore.
    Don't reinvent the wheel.  
>
> Looking at the screen shot there, you've got code to parse ext2 filesystems.  
> What is your definition of "minimal"?
>   
    Enough to boot into Linux.
> Rationale for not providing a boot menu is you don't want to mess with video 
> init.  
    Nope, the centric idea of Qi, is let kernel deal with everything it 
could handle.
    The video init should be handled by kernel stead of bootloader.

    The following clip demonstrate the advantage of Qi bootloader:

    http://www.youtube.com/watch?v=ol9LWBKXXwQ&feature=related

    - Faster booting time
    - Get rid of flash on display device when stepping into kernel

    Hope these could clear your doubt.

    Cheers,  
    Matt
