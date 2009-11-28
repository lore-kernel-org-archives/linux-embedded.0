From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH 0/6] Generic PWM API implementation
Date: Sat, 28 Nov 2009 13:38:06 -0800
Message-ID: <200911281338.06907.david-b@pacbell.net>
References: <cover.1224093510.git.bgat@billgatliff.com> <4B0A9832.20908@billgatliff.com> <fa686aa40911230939q3c65c681jee8c4098331f70ee@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <fa686aa40911230939q3c65c681jee8c4098331f70ee@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Bill Gatliff <bgat@billgatliff.com>, Mike Frysinger <vapier.adi@gmail.com>, linux-embedded@vger.kernel.org

On Monday 23 November 2009, Grant Likely wrote: 
> *however* I do agree that it is the responsibility of platform code to
> set up chip-internal pin muxing and routing.

Fo over 95% of systems, I'd agree -- given that "platform" code
includes the arch/.../mach-X/board-Y.c files.  It's not realistic
to expect boot loaders to always handle that stuff.  If for no
other reason than the way they're produced:  get something that
will boot <OS> and call it done.  There will be nuances that need
to be corrected later.


> Actually, further than 
> that, I think it is actually firmware's responsibility to set up chip
> internal pin muxing because it leads to more common platform code in
> the kernel (less board specific fixups), but the kernel can fix it up
> in a pinch.

That something-less-than-5% remaining includes a lot of developer
boards, where there are multiple viable configurations.  The OS
needs to know which config it's going into at boot time.

And there's even a crazed subset of that 5% which wants to do
runtime reconfiguration.  Those folk do not accept static board
configs, whether done by a bootloader or anything else.

Some of that subset isn't entirely crazed.  I was reading a
chip errata document not long ago, which pointed out an issue
I've seen before:  suspend/resume cycles needed to reconfigure
things dynamically, to prevent leakage.  That's board-specific
and non-static.


>  But I'm not arguing about the pin (hardware) setup code.

That's good, since I don't think there's a Grand Scheme that
can be agreed to in that space, either for boot time setup
or runtime reconfiguration.  The hardware varies too much.

- Dave
