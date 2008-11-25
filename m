From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH/RFC] Add Alternative Log Buffer Support for printk Messages
Date: Tue, 25 Nov 2008 13:45:10 -0800
Message-ID: <200811251345.11350.david-b@pacbell.net>
References: <20081125135519.038abf23@zod.rchland.ibm.com> <492C5DC2.9040402@billgatliff.com> <1227646490.5404.5.camel@cuplxvomd02.corp.sa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1227646490.5404.5.camel@cuplxvomd02.corp.sa.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: dvomlehn@cisco.com, Grant Erickson <gerickson@nuovations.com>
Cc: Bill Gatliff <bgat@billgatliff.com>, Matt Sealey <matt@genesi-usa.com>, linuxppc-dev@ozlabs.org, Stefan Roese <sr@denx.de>, Wolfgang Denx <wd@denx.de>, linux-embedded@vger.kernel.org

No comment from me on $SUBJECT beyond "it seems plausible", but ...

On Tuesday 25 November 2008, David VomLehn wrote:
> The important point, though, is that device tree is the only
> thing approaching a standard on any non-x86-based platform for passing
> structured information from the bootloader to the kernel. The command
> line is just not sufficient for this.

Me, I'll be happier if I don't have to try using that device tree.
Having board-specific code in the kernel is a more complete solution,
and makes it a lot easier to cope with all the hardware goofage.

Recall that the *original* notion behind OpenBoot (now "OpenFirmware")
was to have tables for the stuff that was table-friendly, and call
out to FORTH code (possibly not just at boot time) for the rest.
(Given the choice of FORTH vs ACPI bytecodes, I'd go for FORTH; but
the better option is "neither".)

Right now I see an awful lot of work going into trying to force lots
of stuff into table format.  Even when it's the sort of one-off or
board-specific quirkery that was an original motivation for having
FORTH escapes (tasks that were not table-friendly).

- Dave
