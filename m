From: Ben Nizette <bn@niasdigital.com>
Subject: Re: Atmel AT91SAM7S and AT91SAM7A3
Date: Sat, 28 Jun 2008 18:36:24 +1000
Message-ID: <1214642184.4265.9.camel@moss.renham>
References: <20080625171645.GN7064@freenet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080625171645.GN7064@freenet.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michelle Konzack <linux4michelle@tamay-dogan.net>
Cc: Embedded <linux-embedded@vger.kernel.org>


On Wed, 2008-06-25 at 19:16 +0200, Michelle Konzack wrote:
> Hello,
> 
> I have several projects where I have the need for a microcontroller  and
> I considered to use 8051 compatibles but not it  is  not  more  possible
> because I need an USBHID-PDU device interface,  which  can  only  solved
> using Linux.
> 
> I like to use the AT91SAM7S and the AT91SAM7A3 (it has 16 AD-Converters)
> and want to know, whether there is support for accessing the  8  and  16
> AD-Converters directly via the Kernel.
> 
> Also I like to know, which memory size for the AT91 you recommend.
> 

I would recommend posting this to a forum at http://www.at91.com.  This
is a list more for discussion of embedded issues in the kernel than SoC
end-user support :-)

> The current projects are:
> 
> 1)  Solar-Volatge regulator
>     (Uin <=68V, Uout=30V) with USB interface to PC or Master controller)
> 
> 2)  24V PbGel charger
>     (Uin=30V and nearly the same hardware as above)
> 
> 3)  24V DV modular ATX PSU
>     (special for solarsystems and must support minimal features of an
>     UPS to protect the computer)
> 
> Q:  I have downloaded nearly all stuff about  specifications  to  USBHID
>     and like to know, whether someone can point me to sample  codes  HOW
>     to code the device stuff...  which seems currently not availlable in
>     the Kernel...  (It seems, I am the first one WHO  need  this  stuff,
>     but I am not a genie in C programming)
> 
> Note: "eCosCentric" sell USB stacks,  but  for  an  inacceptable  price, 
>       since I build only small quantities for my projects.
> 
> Thanks, Greetings and nice Day/Evening
>     Michelle Konzack
>     Systemadministrator
>     24V Electronic Engineer
>     Tamay Dogan Network
>     Debian GNU/Linux Consultant
> 
> 
