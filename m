From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH] console - Add configurable support for console charset translation
Date: Wed, 4 Jun 2008 13:55:37 -0500
Message-ID: <200806041355.38322.rob@landley.net>
References: <48447615.5050806@am.sony.com> <200806041236.12349.rob@landley.net> <4846D3EE.1070802@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4846D3EE.1070802@billgatliff.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: Paul Mundt <lethal@linux-sh.org>, "H. Peter Anvin" <hpa@zytor.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Wednesday 04 June 2008 12:42:06 Bill Gatliff wrote:
> Rob Landley wrote:
> > On Tuesday 03 June 2008 21:56:48 Paul Mundt wrote:
> >> On Tue, Jun 03, 2008 at 03:37:23PM -0700, H. Peter Anvin wrote:
> >>> Rob Landley wrote:
> >>>>> Actually, lots have frame buffers these days.
> >>>>
> >>>> Cell phones, for instance.
> >>>
> >>> Sure, but do you want to use them as consoles?
> >>
> >> Unless your name is Pavel, no one actually wants a console on their
> >> phone. So no, just framebuffers, as is to be expected :-)
> >
> > Actually if you ever need to diagnose early boot stuff on _any_ platform,
> > you do need a console.  But it can be serial or netconsole, as long as
> > that works...
>
> ... who says I _always_ want it to look and feel like a "cell phone"?

With the little bluetooth earpieces, cellphone "look and feel" is decidedly 
mutable these days.

(Ok, cell phones started out with the star-tac flip open phone, a fairly 
obvious rip-off from Star Trek TOS.  We now have the banana in Uhura's ear, 
running off of bluetooth.  Now I'm waiting for the communicator badges.  It's 
only a matter of time...)

That said, the cell phone and PDA spaces are converging, and thingies like the 
iPhone and Nokia 810 are the next logical step beyond laptops.  (If you want 
to hook them up to a big screen and keyboard, your "docking station" can just 
be USB.  If it wasn't for the need to provide power to the suckers, it could 
be bluetooth.)

You only need to carry around one pack of electronics with you, and everybody 
has a cell phone these days.  The rest is a question of user interface and 
letting Moore's Law crank long enough...

Rob

P.S. I agree with what Peter seems to be saying, that the old "vga console" 
code is a side issue.  /dev/console doesn't even provide a controlling tty, 
and the PTY code shouldn't really have anything in commonwith the old virtual 
console stuff except an API.  (Honestly it just attaches a cursor position, 
screen size, and some signals to a pipe.  The rest of the stuff it does like 
setting serial port hardware rates and beeping the speaker probably should 
have been done via ioctl on /dev nodes or something.)
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
