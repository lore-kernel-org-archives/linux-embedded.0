From: Chris Simmonds <chris.simmonds@2net.co.uk>
Subject: Re: debugging multi threaded applicatiosn on arm - status?
Date: Fri, 17 Jun 2011 13:46:05 +0100
Message-ID: <4DFB4C8D.40208@2net.co.uk>
References: <20110617093927.GA28305@merkur.ravnborg.org>
Reply-To: chris@2net.co.uk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20110617093927.GA28305@merkur.ravnborg.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-embedded@vger.kernel.org

On 17/06/11 10:39, Sam Ravnborg wrote:
> Is it possible to bebug multi-threaded applications using gdb on ARM these days?
>
> We have had trobules getting this to work - but I do not have the details at hand atm.
> I am just curious if this is supposed to work or not.
>
> We have an arm target running: 2.6.32.8 #1 PREEMPT
> CPU: ARM926EJ-S rev 5 (v5l) (Atmel AT91SAM9263)
>
> The kernel is only lightly modifed - mostly with a few
> propriatary drivers and a few driver hacks (not suitable for mainline).
>
> It is a long story why we use such an old version.
>
> Our applications uses threads and we use glibc 2.10.1 with NPTL enabled.
> So far we have survived using the powerfull printf debugging :-)
>
> 	Sam

It works for me, using various ARM 926 and Cortex A8 chips and kernel 
versions from 2.6.27 to the present day. Which version of gbd do you 
have? gdb version 7.x works much better than 6.x in my experience.

Chris Simmonds
