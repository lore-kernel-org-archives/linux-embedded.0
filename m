From: Wolfgang Denk <wd@denx.de>
Subject: Re: Kernel crashing and log buffers...
Date: Sat, 13 Jun 2009 20:59:26 +0200
Message-ID: <20090613185926.BAB66832E416@gemini.denx.de>
References: <200906102126.40410.rgetz@blackfin.uclinux.org> <20090613102642.GB7976@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: <20090613102642.GB7976@flint.arm.linux.org.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Russell King <rmk@arm.linux.org.uk>
Cc: Robin Getz <rgetz@blackfin.uclinux.org>, Mike Frysinger <vapier@gentoo.org>, Greg Ungerer <gerg@snapgear.com>, Paul Mundt <lethal@linux-sh.org>, Tim Bird <tim.bird@am.sony.com>, Grant Erickson <gerickson@nuovations.com>, linux-embedded <linux-embedded@vger.kernel.org>

Dear Russell King,

In message <20090613102642.GB7976@flint.arm.linux.org.uk> you wrote:
>
> The other way I've seen people read out crash messages is using a
> debugger to dump the kernel's log buffer directly.  That seems to work
> as well as any other method, and has the advantage that it doesn't
> require any kernel modifications.

This works well in the lab during hardware bringup or BSP development.

But we are also interested in a solution that allows to get  more  or
less  automatic access to the log buffer content after a crash - when
you have several ten thousand systems in the field,  such  a  feature
can save you a lot of money.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
