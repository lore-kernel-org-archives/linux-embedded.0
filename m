From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [PATCH] console - Add configurable support for console charset translation
Date: Mon, 9 Jun 2008 12:38:56 +0100
Message-ID: <20080609113856.GD25541@shareable.org>
References: <48447615.5050806@am.sony.com> <200806041236.12349.rob@landley.net> <20080605004630.GA26259@linux-sh.org> <200806051835.57140.rob@landley.net> <484A0207.4000405@zytor.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <484A0207.4000405@zytor.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Rob Landley <rob@landley.net>, Paul Mundt <lethal@linux-sh.org>, linux-embedded <linux-embedded@vger.kernel.org>

H. Peter Anvin wrote:
> >When you imply it's stupid to think anyone will ever have a console on an 
> >embedded system (because we all know the embedded world is far more 
> >uniform than crazy diverse things like the desktop space), which of these 
> >are _you_ referring to?
> 
> I'm talking about the virtual console stuff, which is *not* inherently 
> tied to VGA.
> 
> The issue is whether it makes sense to have virtual console capability 
> on a device which is so constrained that you want a *subset* of the 
> functionality in place.

The uClinux devices I ship do have that.  System console is the serial
port on a board header.  But field engineers are instructed to plug in
a USB keyboard and Alt-F2 to get a diagnostic screen (we call it a
"shell" ;-).  Occasionally even customers with specific requirements
get to use that.

We had to patch the kernel to get the combination of virtual terminal
capability on a framebuffer, but system console messages not to the
framebuffer.  The uClinux (2.4.x) disables system console on a virtual
terminal, but due to some confusion(*), it has the side effect that
you can't attach a VT to a framebuffer at all.  Several howtos provide
a "con2fb" program which didn't work with uClinux.  We had to fix that.

(*) - the word "console" is used for four different concepts in the
kernel, sometimes in the same code, and it seems to have confused
someone.(**)  In the following, CONFIG_VT_CONSOLE should not control
take_over_console(); the two "console" are not the same concept:

#ifdef CONFIG_VT_CONSOLE
    take_over_console(&fb_con, first_fb_vc, last_fb_vc, fbcon_is_default);
#endif

(**) So I suggest using "virtual terminal" consistently in the code,
and when talking about them, would be an improvement.

-- Jamie
