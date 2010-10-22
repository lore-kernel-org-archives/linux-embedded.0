From: Chris Simmonds <chris.simmonds@2net.co.uk>
Subject: Re: Embedded Linux Boot Time Poll
Date: Fri, 22 Oct 2010 16:33:48 +0100
Message-ID: <4CC1AEDC.2040405@2net.co.uk>
References: <AANLkTi=YBzPDG6nOmQfegGOT+8nXm_6EKJE_L2uswxeu@mail.gmail.com>
Reply-To: chris@2net.co.uk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=YBzPDG6nOmQfegGOT+8nXm_6EKJE_L2uswxeu@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Murray <amurray@mpcdata.com>
Cc: linux-embedded@vger.kernel.org

On 22/10/10 00:20, Andrew Murray wrote:
> Hello,
>
> I'm performing some research [for a CELF presentation] into reducing
> boot time on embedded systems and would like to see if the embedded
> community agree with the following statement as to why Linux
> [arguably] takes so long in the first place for an unoptimised system:
>
> "Linux is general purpose, convenient and flexible. As it's general
> purpose it's likely to contain un-required functionality which results
> in more initialisation and a larger image size. As it's convenient and
> flexible it will spent time discovering devices and verifying their
> existence."
>
> Do you largely agree or disagree?
> Also do you believe that boot time isn't the highest priority when it
> comes to improving the kernel?
>
> Thanks,
>
> Andrew Murray

 From my experience, your statements are broadly correct. As has been 
pointed out, there are techniques to optimise the boot time in a system, 
but they are not very well known to the majority of engineers working on 
embedded Linux devices. The situation is not helped by the poor choices 
made by many board and chip level vendors who bundle a Linux tool chain 
and rootfs with their hardware. So, I believe that it is mostly a 
problem of education, starting with the chip- and board- vendors.

Bye for now
Chris Simmonds
