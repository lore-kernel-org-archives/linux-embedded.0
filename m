From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [patch 2/4] Configure out file locking features
Date: Tue, 29 Jul 2008 21:00:08 +0100
Message-ID: <20080729200006.GA25885@shareable.org>
References: <20080729154520.728594017@free-electrons.com> <20080729154747.872888047@free-electrons.com> <20080729181751.GA24924@parisc-linux.org> <1217357875.15724.167.camel@calx>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1217357875.15724.167.camel@calx>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Mackall <mpm@selenic.com>
Cc: Matthew Wilcox <matthew@wil.cx>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org

Matt Mackall wrote:
> The typical embedded NFS-based devices are NAS servers and media players
> and are going to be more concerned about things like page cache
> balancing.

Oh, those.

It would be really annoying to buy a home NAS and find it doesn't
support NFS locks or SMB oplocks.  NASes are vaguely useful for more
than one computer in the house at the same time.

That said, I bought a big, expensive one, found it far too slow for my
needs, send it back for a refund and bought a portable cheap USB disk
which had *so* much higher performance.  The convenience of serving
multiple machines just wasn't worth the lousy performance.

-- Jamie
