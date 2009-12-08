From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [POWER] battery calibration parameters from sysfs
Date: Tue, 8 Dec 2009 10:28:12 +0000
Message-ID: <20091208102812.GC28378@rakim.wolfsonmicro.main>
References: <A6D19A13FE030A409EC4362C172E091F0E0495F6@eseldmw101.eemea.ericsson.se>
 <20091204104930.GA28625@sirena.org.uk>
 <A6D19A13FE030A409EC4362C172E091F0E071EB9@eseldmw101.eemea.ericsson.se>
 <20091207114825.GA26965@rakim.wolfsonmicro.main>
 <A6D19A13FE030A409EC4362C172E091F0E0A1FA1@eseldmw101.eemea.ericsson.se>
 <20091207165628.GA24981@rakim.wolfsonmicro.main>
 <a55d774e0912072127u33cebd65xbfe341160c314a2e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a55d774e0912072127u33cebd65xbfe341160c314a2e@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Brian Swetland <swetland@google.com>
Cc: Rebecca Schultz Zavin <rebecca@android.com>, Mike Lockwood <lockwood@android.com>, Linus Walleij <linus.walleij@stericsson.com>, cbou@mail.ru, dwmw2@infradead.org, LKML <linux-kernel@vger.kernel.org>, linux-embedded@vger.kernel.org

On Mon, Dec 07, 2009 at 09:27:20PM -0800, Brian Swetland wrote:
> On Mon, Dec 7, 2009 at 8:56 AM, Mark Brown

> > I don't think the existing Android devices are much of an issue her=
e,
> > it's not as though end users have the ability modify the firmware o=
n
> > them (modulo the fairly small number of ADP devices). =A0This is an=
 issue
> > for people producing new devices who are already going to be doing =
some
> > development to get the kernel up and running on their hardware.

> My preference, from an Android point of view, would be to make sure w=
e
> have some reasonable userspace abstraction and provide a default
> implementation that will do the right thing with an intelligent
> battery driver (our usual design for inhouse work).  Then alternative
> implementations can be plugged in, should that not be sufficient.

It proably makes sense to have some of the performance tracking in ther=
e
by default - while there are some systems out there which are able to d=
o
high quality battery tracking there's several previous generations of
monitoring technology out there which have substantial accuracy issues
(especially in the face of removable battery packs) but which will
report information to userspace.  This makes it unwise to rely to
totally on the information you're getting from the kernel - the
smartness of a smart battery driver can vary greatly.
