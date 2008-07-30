From: Jamie Lokier <jamie@shareable.org>
Subject: Re: prevalence of C++ in embedded linux?
Date: Wed, 30 Jul 2008 11:25:23 +0100
Message-ID: <20080730102523.GB8992@shareable.org>
References: <alpine.LFD.1.10.0807281142430.4286@localhost.localdomain> <200807290951.34563.neundorf@eit.uni-kl.de> <1217319612.24988.15.camel@spike.firmix.at> <200807291058.06240.neundorf@eit.uni-kl.de> <1217324838.24988.41.camel@spike.firmix.at> <556445368AFA1C438794ABDA8901891C092D3CF7@USA0300MS03.na.xerox.net> <e2e108260807292146n581b655an3119be9e33af871c@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e2e108260807292146n581b655an3119be9e33af871c@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bart Van Assche <bart.vanassche@gmail.com>
Cc: "Leisner, Martin" <Martin.Leisner@xerox.com>, Bernd Petrovitsch <bernd@firmix.at>, Alexander Neundorf <neundorf@eit.uni-kl.de>, linux-embedded@vger.kernel.org

Bart Van Assche wrote:
> On Tue, Jul 29, 2008 at 10:08 PM, Leisner, Martin
> <Martin.Leisner@xerox.com> wrote:
> > If you're embedded device has a window system, than a language like C++
> > is fine...But...
> 
> C++ is suited for much more than just windowing systems. A good
> example is the GOLD project, a linker for ELF files. GOLD is a rewrite
> of the GNU linker (ld). See also
> http://google-opensource.blogspot.com/2008/04/gold-google-releases-new-and-improved.html.

Is C++ intrinsic to GOLD's linking superiority over ld?  Or was it
chosen because the author fancied using it?  (I don't know).

There's been a resistance to using C++ in GNU programming tools
generally for a long time - see GCC which only recently switched to
ANSI C.  That's because they want the tools to run on lots of
platforms, and C++ templates in particular haven't been standardly
implemented until the last few years, and probably still aren't on
some platforms that they'd like to run GNU tools on.

So using C++ in GOLD was a bit of a bold decision :-)

What I can't help noticing is that GOLD, while superior for linking
straight GNU/Linux applications due to better algorithms, and
extremely knowledgable author etc. - it explicitly does not support
anything but ELF.  It doesn't support the zillions of linker
capabilities of GNU binutils ld, and the author says he doesn't intend
it to.

So it won't ever be suitable for linking some embedded targets -
you'll still need to use Binutils ld/objdump or another tool, at least
for the last step :-)

Binutils' undoing is probably the complexity in its approach to
generically supporting every kind of linkable object anywhere.  That
complexity is the reason we have the ugly 'elf2flt' instead of simply
a backend which emits uClinux executable formats.  The authors of
uClinux tools found it easier to postprocess the output than to write
another format backend.

I don't think C++ would help a lot with that complexity if you wanted
to still support lots of different formats - although another language
with versatile metaprogramming might.  (There's a lot to choose from).
I could be wrong of course.

-- Jamie
