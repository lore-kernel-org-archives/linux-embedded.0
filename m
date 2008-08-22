From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: Adding a new platform
Date: Fri, 22 Aug 2008 05:53:27 +0100
Message-ID: <48AE4647.5060407@lougher.demon.co.uk>
References: <48AB0A7A.8040209@cisco.com> <7d1d9c250808192129j3fb7ef28p8f404c6affd82078@mail.gmail.com> <f608b67d0808192215q5b8ffbf0w70531c31cdd66bcd@mail.gmail.com> <200808211502.58206.manningc2@actrix.gen.nz> <Pine.LNX.4.64.0808211044590.20704@vixen.sonytel.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0808211044590.20704@vixen.sonytel.be>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: Charles Manning <manningc2@actrix.gen.nz>, vb <vb@vsbe.com>, Paul Gortmaker <paul.gortmaker@gmail.com>, Linux Embedded Maillist <linux-embedded@vger.kernel.org>, corbet@lwn.net

Geert Uytterhoeven wrote:
> On Thu, 21 Aug 2008, Charles Manning wrote:
> 
>> Luckily APIs for drivers (the most common stuff that people work on) don't 
>> change that much, and the interfaces are reasonably clear. If you want some 
>> hell then try working on file systems :-).
> 
> Really? So how come so few changes are needed to keep squashfs working?
> 

It only uses a relatively small subset of the VFS, and goes nowhere near 
the MTD subsystem.  Recently dusting off an MTD patch I wrote for 
Squashfs a couple of years ago, I found it had to be completely 
rewritten for modern kernels.

Having said that the bit of the VFS Squashfs is interested in has 
changed in each of 2.6.23, 2.6.24, 2.6.25, 2.6.26 and now 2.6.27, and so 
I wouldn't say it was immune anyway.

Phillip
