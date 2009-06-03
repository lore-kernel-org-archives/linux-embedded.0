From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [Ksummit-2009-discuss] Representing Embedded Architectures at
	the Kernel Summit
Date: Wed, 3 Jun 2009 07:24:41 +0100
Message-ID: <20090603062441.GB23561@linux-mips.org>
References: <1243956140.4229.25.camel@mulgrave.int.hansenpartnership.com> <20090602172941.GL3095@hansolo.jdub.homelinux.org> <20090602222132.GK6399@game.jcrosoft.org>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090602222132.GK6399@game.jcrosoft.org>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Josh Boyer <jwboyer@linux.vnet.ibm.com>, James Bottomley <James.Bottomley@HansenPartnership.com>, linux-arch@vger.kernel.org, linux-embedded@vger.kernel.org, ksummit-2009-discuss@lists.linux-foundation.org

On Wed, Jun 03, 2009 at 12:21:32AM +0200, Jean-Christophe PLAGNIOL-VILLARD wrote:

> I'd like to propose AMP and kernel relocate
> as more and SoC will came with multiple core with or without the same arch

AMP is very interesting.  It's not uncommon two have only a single of like
16 cores running Linux and the others running bare metal code.  A typical
example would be networking code.  Each vendor provides their own AMP
infrastructure and so far it all looks crude.  With an every increasing
number of cores there also is the question if AMP could be generally useful
for the kernel.

  Ralf
