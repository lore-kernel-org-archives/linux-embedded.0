From: Bernd Petrovitsch <bernd@firmix.at>
Subject: Re: prevalence of C++ in embedded linux?
Date: Tue, 29 Jul 2008 11:47:18 +0200
Message-ID: <1217324838.24988.41.camel@spike.firmix.at>
References: <alpine.LFD.1.10.0807281142430.4286@localhost.localdomain>
	 <200807290951.34563.neundorf@eit.uni-kl.de>
	 <1217319612.24988.15.camel@spike.firmix.at>
	 <200807291058.06240.neundorf@eit.uni-kl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200807291058.06240.neundorf@eit.uni-kl.de>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexander Neundorf <neundorf@eit.uni-kl.de>
Cc: linux-embedded@vger.kernel.org

On Tue, 2008-07-29 at 10:58 +0200, Alexander Neundorf wrote:
> On Tuesday 29 July 2008 10:20:12 you wrote:
> > On Tue, 2008-07-29 at 09:51 +0200, Alexander Neundorf wrote:
> ...
> > Yes, one *can* use the above features and get small features. But most
> > people simply can't - if only that they use some tool/lib written in C++
> > (and coming from the "normal" world) which simply uses them without
> > thinking about space and wonder why the device won't run with "only"
> > 128MB flash and run in 16MB RAM.
> 
> Well, if somebody carelessly uses general purpose apps/libs in a tiny embedded 
> project he will have problems, no matter if it's C or C++.

Of course.
But it is IMHO much more easier and seductive to use the code bloating
features with C++ - especially if you don't know what to do and do not
realize (until it's too late).

Evey other potential customer asks about C++ on an embedded device. And
if you say "yes" they *expect* to use all that g++ allows. Period.

Getting exceptions and restrictions to the use of C++ (including any 3rd
party software - known and unknown) in an offer?
Please be serious.

Discussing afterwards that these templates are a very bad idea (and need
to be converted to "a pure virtual class and lots of classes" to avoid
code bloat and that it will cost a few man-weeks and calendar time)?
I can hear it already: "But you said that C++ is OK and this is plain C
++".

> > BTW why should I use C++ if I don't use any "fancy features"?
> 
> If you just skip RTTI and exceptions you have enough fancy features left :-)

Hmm, does g++ has options to completely disabled these (and other)
"fancy features"? At least one could check 3rd party software more
easily if they actually use that.

Multiple inheritance[0] is in my experience not really necessary (if
ever used).
I already have "Safe C" with gcc anyways (if I want and enable some
warnings;-).
OO design is a question of design and not of the implementation
language. I can't see much difference between
- declaring a class and using a method or
- declaring a struct and use a pointer to an instance as the first
   parameter in several functions.
Leaves operator/function overloading and default values for parameters.
But it adds usually libstdc++.so ....

> Just know what you're doing if you're using templates and multiple 

ACK. But what is with the other 90%?

> inheritance, there is no problem with them. Templates are so much better than 
> macros, and if used carefully they don't bloat the code size.

Don't get me wrong - I'm not religiously against C++ in anyway.
It's just that you *really* need to know what you do and that implies
IMHO for C++ that you must know how templates work/are implemented.
Similar for exceptions (and no, using exceptions usually doesn't save
space anywhere - at least not if your calling depth is < 100). if you
use them (or use a library that uses them).
And may need or may not need libstdc++.so - an additional piece of code
using space.
Of course, if you have 1GB of flash and 256M RAM, who cares. But most of
the devices I see are not that "fat".

In short: It is far from easy to *not* shoot yourself in the foot with
C++. At least compared to plain C.

	Bernd

[0]: Yes, I know what's the difference between normal and virtual
         inheritance.
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services

