From: Jamie Lokier <jamie@shareable.org>
Subject: Re: prevalence of C++ in embedded linux?
Date: Wed, 30 Jul 2008 11:16:35 +0100
Message-ID: <20080730101634.GA8992@shareable.org>
References: <alpine.LFD.1.10.0807281142430.4286@localhost.localdomain> <200807290951.34563.neundorf@eit.uni-kl.de> <1217319612.24988.15.camel@spike.firmix.at> <200807291058.06240.neundorf@eit.uni-kl.de> <1217324838.24988.41.camel@spike.firmix.at> <556445368AFA1C438794ABDA8901891C092D3CF7@USA0300MS03.na.xerox.net>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <556445368AFA1C438794ABDA8901891C092D3CF7@USA0300MS03.na.xerox.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Leisner, Martin" <Martin.Leisner@xerox.com>
Cc: Bernd Petrovitsch <bernd@firmix.at>, Alexander Neundorf <neundorf@eit.uni-kl.de>, linux-embedded@vger.kernel.org

Leisner, Martin wrote:
> I've found you can understand spaghetti C code with some effort -- its
> nearly impossible to understand spaghetti C++ code.  Much professional
> programming is "kitchen sink mentality" -- if there's a feature, use it.
> 
> I find it interesting K&R is about 200 pages, Stroustrup is 1000+ pages.
> What percentage of the 200 pages is understood by the average C
> programmer versus the 1000+ pages by the average C++ programmers?
> 
> I program by the quote by Einstein "Things should be as simple as
> possible, no simpler".
> 
> Much of the C++ code I've seen has more complicated implementation
> details than the problem being solved (I'm a believer in Halstead
> metrics, a lot of solutions I've seen in C++ would be much smaller in
> C).  Of course, that's the solutions in C++ I've seen...not all of
> them....

Ok, but most of what you say applies the same to "generic" programming
and not particularly to embedded.  I.e. if you agree with your points,
you won't use C++ much in general, and if you disagree and like C++ in
general, then why not use it for embedded as well.

> I think C++ lends itself to coming up with complicated solutions to
> simple problems...(of course really good C++ is simple and
> clever...but much C++ I see is poorly designed raw overcooked
> spaghetti).

If you think C lends itself to simple solutions, go read a Linux
kernel sometime :-)

> Also its very useful to have an understanding how the hardware works in
> systems where memory/time is an issue (and it almost always should be an
> issue).  I have a good understanding of what will happen in my C
> compiler 
> (a good algorithm in C runs rings around bad algorithms in assembler).
> [nowadays, instead of processor performance, you think about cache
> performance].  I doubt there's generally a good understand of time/space
> of C++ features in the compiler and standard library...]

Actually, the C++ standard library specification _defines_ time
requirements for many of its algorithms.  That's better than C - in
theory.  (Whether implementations follow the spec that far in practice
is a different question.

I can honestly say I've both read and written simple to understand,
and lousy and complex C code.  And the same with C++.

For some problems, C++ has expressed the solution far more clearly
than the equivalent C.  Most notably in a video game with lots of
characters and representations of physical objects, and in a GUI -
very object oriented systems by nature - fit a C++ expression very
well.

You can imagine in a video game, time/space performance is critical.
Some understanding of what goes on behind the scenes in C++ is very
helpful to manage performance.  I guess knowing C and machine code
helps one's understanding of what a C++ compiler produces :-)

Aside from time/space performance, another factor in many types of
embedded programming is time to deliver the product - or how good can
you make it in the fixed time available.  If C helps, go for it; if
C++ is familiar to you and gets you a better looking product in the
same time, though, it might be prefereable for some parts.  (Same for
choice of libraries, tools, etc.).  That really depends what kind of
device you're making.

-- Jamie
