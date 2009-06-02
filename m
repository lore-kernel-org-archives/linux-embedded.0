From: David VomLehn <dvomlehn@cisco.com>
Subject: Re: Representing Embedded Architectures at the Kernel Summit
Date: Tue, 2 Jun 2009 10:52:44 -0700
Message-ID: <20090602175244.GB10973@cuplxvomd02.corp.sa.net>
References: <1243956140.4229.25.camel@mulgrave.int.hansenpartnership.com> <20090602172941.GL3095@hansolo.jdub.homelinux.org> <1243964577.4229.49.camel@mulgrave.int.hansenpartnership.com>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1243964577.4229.49.camel@mulgrave.int.hansenpartnership.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=1369; t=1243965164; x=1244829164;
	c=relaxed/simple; s=sjdkim4002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn@cisco.com;
	z=From:=20David=20VomLehn=20<dvomlehn@cisco.com>
	|Subject:=20Re=3A=20Representing=20Embedded=20Architectures
	=20at=20the=20Kernel=20Summit
	|Sender:=20;
	bh=k29kutnx1fnVQS8IyU94vmBYngU0C/kKhTbP0QmfNpU=;
	b=OoCUzvQKpmin9gJI3g+qVbXJKe8AH0JeuWlI95NrDMgyAtT2T9y84klpCt
	BDqWMUDGtla3PBIky8hlYqAn2SBkwnGLnoozIXoKH17ChrYAypb/SLp5KA1g
	BHxU9FLx3J;
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Josh Boyer <jwboyer@linux.vnet.ibm.com>, ksummit-2009-discuss@lists.linux-foundation.org, linux-arch@vger.kernel.org, linux-embedded@vger.kernel.org

On Tue, Jun 02, 2009 at 12:42:57PM -0500, James Bottomley wrote:
> On Tue, 2009-06-02 at 13:29 -0400, Josh Boyer wrote:
> > Which leads me to suggest that it is at least worth having someone with an
> > embedded focus at KS to simply keep an eye out for impacts of generic changes.
> > "Feature parity" is something I often deal with in trying to keep ppc4xx up to
> > speed with the rest of the archs in the kernel.
> 
> We're fine with this, if that's how the embedded guys would like to do
> it ... how do you want to nominate the "someone with an embedded focus"?
> We chose the topic driven approach because that's the one it's easiest
> for the Kernel Summit Programme Committee to look at and make attendance
> decisions based upon.  However, if all the embedded people want to
> choose their own representatives, that's fine by us too ... as long as
> you can devise a fair process.

Now, James, I think you haven't been paying attention to the embedded Linux
world...asking us to devise *any* process is much more chaotic than herding
cats. Expecting something everyone agrees is fair would probably take until
at least KS 2010. That being said, we have three people who are listed in
MAINTAINERS under embedded Linux. We might start by seeing which of them
might take up the mantle and vote on the linux-embedded mailing list.

> James
