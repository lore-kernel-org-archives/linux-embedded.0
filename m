From: Ben Nizette <bn@niasdigital.com>
Subject: Re: UIO - interrupt performance
Date: Tue, 21 Oct 2008 20:32:07 +1100
Message-ID: <1224581527.3954.123.camel@moss.renham>
References: <5958B8D7916AB84781FE0E7B57C218CB75AB98@306900ANEX2.global.avaya.com>
	 <1224498501.3954.50.camel@moss.renham>
	 <Pine.LNX.4.58.0810200258210.2562@vlab.hofr.at>
	 <1224540757.3954.59.camel@moss.renham>  <48FD7D65.1070409@grandegger.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48FD7D65.1070409@grandegger.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Wolfgang Grandegger <wg@grandegger.com>
Cc: Nicholas Mc Guire <hofrat@hofr.at>, linux-embedded <linux-embedded@vger.kernel.org>


On Tue, 2008-10-21 at 08:57 +0200, Wolfgang Grandegger wrote:
> Ben Nizette wrote:
> > 
> > As in examples of the userspace half?  Unfortunately uio-smx isn't ready
> > to fly thanks to some significant production delays but the userspace
> > half of the Hilscher CIF driver can be found at
> > http://www.osadl.org/projects/downloads/UIO/user/
> 
> As I see it, mainly the license conditions attract people to use UIO.
> Performance is not that important.
> 

Ohw god I hope not.  If people want to keep their stuff proprietary they
can supply binary-only modules a la nvidia.  Thankfully such nonsense is
fairly uncommon these days.

UIO is not a set of hooks for general userspace drivers, it can't
replace 99% of kernel drivers.  It exists to allow easy and
high-performance interfacing to a particular family of devices - those
which simply need to shift data around and have an interrupt telling you
when they're done.

	--Ben.
