From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH] console - Add configurable support for console charset translation
Date: Wed, 4 Jun 2008 12:36:11 -0500
Message-ID: <200806041236.12349.rob@landley.net>
References: <48447615.5050806@am.sony.com> <4845C7A3.1020607@zytor.com> <20080604025648.GA17524@linux-sh.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080604025648.GA17524@linux-sh.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Mundt <lethal@linux-sh.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Tuesday 03 June 2008 21:56:48 Paul Mundt wrote:
> On Tue, Jun 03, 2008 at 03:37:23PM -0700, H. Peter Anvin wrote:
> > Rob Landley wrote:
> > >>Actually, lots have frame buffers these days.
> > >
> > >Cell phones, for instance.
> >
> > Sure, but do you want to use them as consoles?
>
> Unless your name is Pavel, no one actually wants a console on their
> phone. So no, just framebuffers, as is to be expected :-)

Actually if you ever need to diagnose early boot stuff on _any_ platform, you 
do need a console.  But it can be serial or netconsole, as long as that 
works...

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
