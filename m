From: "Steven J. Magnani" <steve@digidescorp.com>
Subject: Re: Embedded Linux Boot Time Poll
Date: Fri, 22 Oct 2010 09:24:51 -0500
Message-ID: <1287757491.2589.89.camel@iscandar.digidescorp.com>
References: <AANLkTi=YBzPDG6nOmQfegGOT+8nXm_6EKJE_L2uswxeu@mail.gmail.com>
Reply-To: steve@digidescorp.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=YBzPDG6nOmQfegGOT+8nXm_6EKJE_L2uswxeu@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Murray <amurray@mpcdata.com>, linux-embedded@vger.kernel.org

Andrew Murray <amurray@mpcdata.com> wrote:

> Hello,
> 
> I'm performing some research [for a CELF presentation] into reducing
> boot time on embedded systems and would like to see if the embedded
> community agree with the following statement as to why Linux
> [arguably] takes so long in the first place for an unoptimised system:
> 
> "Linux is general purpose, convenient and flexible. As it's general
> purpose it's likely to contain un-required functionality which
> results in more initialisation and a larger image size.

I think if you are going to use "more" and "larger" you need to define
your point of comparison. i.e., vs. bare metal? eCos? WinCE? An
incandescent light bulb?  :)

Kconfig goes a long way towards allowing developers to prune extraneous
code from the kernel. Also great pains have been taken to optimize away
calls that aren't needed in certain configurations (i.e. spinlocks on 
uniprocessor systems).

> As it's convenient and flexible it will spent time discovering devices 
> and verifying their existence."
> 
> Do you largely agree or disagree?

I largely disagree mainly because I don't think anyone would use an
"unoptimised" kernel in an embedded device. Kernels can be built to look
for only the subset of devices the system supports (platform bus, device
tree, etc.).

> Also do you believe that boot time isn't the highest priority when it
> comes to improving the kernel?

There was some discussion of this at ELC 2009. Andre Puschmann gave a
presentation which you can find here:
http://tree.celinuxforum.org/CelfPubWiki/ELC2009Presentations?action=AttachFile&do=view&target=ELC09_boottime_reduction.pdf

Different classes of embedded devices may have different priorities. In
some cases there are regulatory requirements; David Woodhouse pointed
out that for mobile phones, it must be possible to make an emergency
call within X seconds. In other cases the question is one of "user
experience"; for devices like an iTouch, users can become accustomed to
a relatively 'long' boot. In other cases users expect a device to behave
like an incandescent light and be usable more or less immediately, and
have a frustration level that increases exponentially with
time-until-usability.

It might help the discussion to consider some alternative priorities.
Many of these have a userland dimension.
* Stability (i.e. MTBF for long-running systems)
* Power management
* Robustness against sudden removal of power
* Shutdown time
* Solid-state storage
* Security
* Field failure analysis (i.e. crash dumps)
* Others?

For the product I'm involved with, robustness is probably the top
concern, with boot time a close second.

Regards,
------------------------------------------------------------------------
 Steven J. Magnani               "I claim this network for MARS!
 www.digidescorp.com              Earthling, return my space modulator!"

 #include <standard.disclaimer>

