From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: embedded rootfs utility
Date: Wed, 30 Jul 2008 08:09:25 -0600
Message-ID: <20080730140925.GA21958@secretlab.ca>
References: <488FCF7D.5010005@websterwood.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <488FCF7D.5010005@websterwood.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Behan Webster <behanw@websterwood.com>
Cc: linux-embedded@vger.kernel.org

On Tue, Jul 29, 2008 at 10:18:37PM -0400, Behan Webster wrote:
> A quick announcement of the release of elbs, or the "Embedded Linux
> Build System" (it seemed like a good name at the time I started writing
> it...)  So far it's just a few utilities that I wrote to make a few of
> my own projects easier.
> 
> However, most notably it contains a utility called "elbs-rootfs" which
> makes it easy to create an embedded rootfs for any architecture
> supported by the Debian projecy (or Ubuntu Linux).  The idea is to get a
> rootfs up and working quickly via nfs (or a flash drive) which allows
> you to install any debian package and/or to do native development.  This
> is (not yet) meant as a tool to make your final rootfs fit on a small
> flash partition.

Hey Behan, thanks for posting this.  For anybody looking at this tool, I
can attest to it's usefulness.  For my work it has simplified getting a
full development environment setup for embedded targets.

What mailing list should be used for any discussion/patches on this tool?

Cheers,
g.
