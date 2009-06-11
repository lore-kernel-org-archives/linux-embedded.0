From: Grant Erickson <gerickson@nuovations.com>
Subject: Re: Kernel crashing and log buffers...
Date: Thu, 11 Jun 2009 15:57:56 -0700
Message-ID: <C656DA04.1708D%gerickson@nuovations.com>
References: <200906111452.39210.rgetz@blackfin.uclinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200906111452.39210.rgetz@blackfin.uclinux.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robin Getz <rgetz@blackfin.uclinux.org>, David VomLehn <dvomlehn@cisco.com>
Cc: Mike Frysinger <vapier@gentoo.org>, Greg Ungerer <gerg@snapgear.com>, Russell King <rmk@arm.linux.org.uk>, Paul Mundt <lethal@linux-sh.org>, Tim Bird <tim.bird@am.sony.com>, Wolfgang Denk <wd@denx.de>, linux-embedded <linux-embedded@vger.kernel.org>, Hariprasad Nellitheertha <hari@in.ibm.com>

On 6/11/09 11:52 AM, Robin Getz wrote:
> On Thu 11 Jun 2009 13:53, David VomLehn pondered:
>> On Wed, Jun 10, 2009 at 09:26:40PM -0400, Robin Getz wrote:
>>> I would be interested in Paul and Russell - how have you solved this
>>> issue? (Or do your kernel's never crash? :)
>> 
>> Our kernel does crash, so we have to do this. I had submitted a patch a
>> while ago that tweaks emit_log_char, but this was bounced, reasonably,
>> because it would be interferring with the great majority of people who
>> are not interested in capturing log output. The suggestion was made that
>> we do this with a console driver. I've recently got a version working,
>> as a module, but I've only started testing of the version integrated
>> into the kernel tree.  Still, post early, post often, so I've appended
>> a version of the patch here to see if this seems to be the right
>> direction. 
> 
> Yeah - it looks like n people have done this n ways.
> 
> I think even Andrew M had mentioned that he had done something in a past
> embedded life.
> 
> I think what you have would do what I need it to do - I'm not so sure about
> what Wolfgang/Grant had in mind (- since they wanted also to dump buffers
> from the bootloader into the console for syslog processing)...

Regrettably, I have not had the time to follow-up on this since my last
commentary in March:

    http://lkml.org/lkml/2009/3/31/293

However, from what I can glean of the discussion, you are correct that this
does not precisely cover what Wolfgang (originally) or, later, I was working
towards in that neither boot loader logs nor round-trip log buffering
(bootloader to kernel and back again) are covered.

However, the value and what's being proposed here and what I and others
proposed--at least in the embedded kingdom--seems high and the features and
implementation needn't be mutually exclusive.

Regards,

Grant

