From: Wolfgang Denk <wd@denx.de>
Subject: Re: Kernel crashing and log buffers...
Date: Fri, 12 Jun 2009 07:33:10 +0200
Message-ID: <20090612053310.9E9D9832E416@gemini.denx.de>
References: <200906111452.39210.rgetz@blackfin.uclinux.org> <C656DA04.1708D%gerickson@nuovations.com> <20090612003302.GA23715@cuplxvomd02.corp.sa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: <20090612003302.GA23715@cuplxvomd02.corp.sa.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David VomLehn <dvomlehn@cisco.com>
Cc: Grant Erickson <gerickson@nuovations.com>, Robin Getz <rgetz@blackfin.uclinux.org>, Mike Frysinger <vapier@gentoo.org>, Greg Ungerer <gerg@snapgear.com>, Russell King <rmk@arm.linux.org.uk>, Paul Mundt <lethal@linux-sh.org>, Tim Bird <tim.bird@am.sony.com>, linux-embedded <linux-embedded@vger.kernel.org>, Hariprasad Nellitheertha <hari@in.ibm.com>

Dear David VomLehn,

In message <20090612003302.GA23715@cuplxvomd02.corp.sa.net> you wrote:
>
> > However, the value and what's being proposed here and what I and others
> > proposed--at least in the embedded kingdom--seems high and the features and
> > implementation needn't be mutually exclusive.
> 
> I agree. In this case, we have three different approaches to three different
> problems (bootloader buffers, continuous state logging, and in-kernel capture
> of logging). All are problems that need to be solved. Personally, I'd love
> to have the continuous state logging, though I don't need the bootloader
> buffer part.

Question is: do we need three different solutions, or can we come up
with one solution that covers all?

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
"If it ain't broke, don't fix it."                       - Bert Lantz
