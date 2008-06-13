From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Thu, 12 Jun 2008 20:22:49 -0500
Message-ID: <4851CBE9.9090204@billgatliff.com>
References: <1209577322.25560.402.camel@pmac.infradead.org> <8bd0f97a0806120905u532ce5f9sf231e185173de791@mail.gmail.com> <alpine.LFD.1.10.0806121208320.22877@localhost.localdomain> <200806121925.35883.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200806121925.35883.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Rob Landley wrote:

> I just did a "make distclean" on a qemu tree I had lying around.  On my 1.7 
> ghz 64 bit laptop, it took 9.2 seconds to figure out it had nothing to do, 
> just because it had to recurse into so many subdirectories to do it.

Which is precisely why recursive makes are considered bad.


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
