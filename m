From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Wed, 11 Jun 2008 15:47:36 +1000
Message-ID: <484F66F8.4020409@snapgear.com>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806100155.31904.rob@landley.net> <20080610075432.GB776@uranus.ravnborg.org> <200806102235.09598.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200806102235.09598.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rob Landley <rob@landley.net>
Cc: Sam Ravnborg <sam@ravnborg.org>, Leon Woestenberg <leon.woestenberg@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org

Hi Rob,

Rob Landley wrote:
> On Tuesday 10 June 2008 02:54:32 Sam Ravnborg wrote:
>>> (Maybe I _am_ the only person who still cares about
>>> building on a host without perl.  If I wasn't, somebody else would have
>>> acked the patch...)
>> perl is pretty standard
> 
> An implementation is not the same thing as a standard.  If you mean "there is 
> one implementation everybody uses, ala excel and Word, and even the Perl guys 
> can't reproduce it from scratch as parrot showed", then you're using a 
> different definition of the word "standard" than I am.
> 
> Or do you mean it comes preinstalled on most modern systems, the way Windows 
> does, and who could object to that?
> 
> I know from experience that it's an _amazing_ pain to try to cross compile the 
> sucker...

Ain't that the truth!


>> and I fail to see the benefits of avoiding it. 
>> For embedded development I see even less benefits as I assume
>> any sane embedded development environment are based on a
>> cross-toolchain so you do the build on a high perfomance box.
>>
>> Building everything for my arm board on the arm board would be a disater
>> for example.
> 
> I build everything for my arm board natively, on an arm system running under 
> qemu, calling out to the cross compiler via distcc to accelerate the limited 
> parts of the process that cross compiling doesn't actually break.  To get to 
> that point, I cross compile just enough to get a native development 
> environment, and then I avoid cross compiling from then on because it's an 
> enormous source of complexity and random breakage.

Random breakage?


> I did this because throwing hardware at the problem is cheaper than throwing 
> engineering time at the problem, because Moore's Law is on my side, and 

Are you sure about that?
How well does qemu do SMP?  At all?

Modern x86 and friends are getting most new performance from
more cores. A cross compile today can take advantage of those
for the most part. Your emulated system probably can't.

An order of magnitude compile time (or more) for a native build
is quite a high price to pay :-)

Regards
Greg



> because I find native compiling (where possible) more straightforward and 
> conceptually cleaner.
> 
> Before 2.6.25, I had a complete self-bootstrapping environment with seven 
> packages (busybox, uClibc, make, gcc, binutils, bash, and linux).  Building 
> glibc needs perl, if you're using a uClibc based system you may _never_ need 
> Perl, and could go up through Linux From Scratch and beyond to a fairly 
> powerful system.
> 
> I can probably natively build perl under the mini-native environment running 
> inside qemu, but it wasn't needed before and there really wasn't a good 
> reason to add it.  The task being performed and the build dependency brought 
> in to perform it are hugely disproportionate.
> 
> Rob

-- 
------------------------------------------------------------------------
Greg Ungerer  --  Chief Software Dude       EMAIL:     gerg@snapgear.com
Secure Computing Corporation                PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
