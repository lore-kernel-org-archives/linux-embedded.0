From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PATCH/RFC] Add Alternative Log Buffer Support for printk Messages
Date: Tue, 25 Nov 2008 14:19:14 -0600
Message-ID: <492C5DC2.9040402@billgatliff.com>
References: <20081125135519.038abf23@zod.rchland.ibm.com>	 <C5518C2F.13137%gerickson@nuovations.com>	 <b5e2fc790811251131g63ea9444x57ec0829ca0b069e@mail.gmail.com>	 <492C573E.9030309@billgatliff.com> <b5e2fc790811251207g38d429f3q4eb698b92162d6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <b5e2fc790811251207g38d429f3q4eb698b92162d6@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Sealey <matt@genesi-usa.com>
Cc: Grant Erickson <gerickson@nuovations.com>, linuxppc-dev@ozlabs.org, Stefan Roese <sr@denx.de>, Wolfgang Denx <wd@denx.de>, linux-embedded@vger.kernel.org

Matt Sealey wrote:
> Yes, there's FirmWorks, CodeGen SmartFirmware, IBM SLOF and OpenBIOS..
> they're all linked from the OpenBIOS website (along with a bunch of the
> documentation from http://www.openfirmware.org in more-readable formats
> like PDF)
> 
> http://www.openbios.org/
> 
> 
> But here's the real question; why do you need an opensource
> implementation? Curiosity?

That, and I prefer Free *ware whenever that's an option.  :)

Nothing against the commercial alternatives, of course.  But I'm
already doing my own heavy lifting, because my platforms are all
full-custom with very limited production runs.  Since I'm into the
guts of all my code anyway, I'm not inclined to outsource a bootloader
development effort.

Just trying to figure out where the walls of this "sandbox" are.  I've
been aware of the concept of Open Firmware for a while, but haven't
really looked into it before now--- mostly because my impression until
now was that the available implementations were both closed-source,
and not supporting embedded, non-PPC targets like ARM.


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
