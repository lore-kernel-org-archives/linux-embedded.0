From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 01/32] init.h: remove __cpuinit sections from the kernel
Date: Mon, 24 Jun 2013 15:10:32 -0700
Message-ID: <1372111832.1245.33.camel@joe-AO722>
References: <1372102237-8757-1-git-send-email-paul.gortmaker@windriver.com>
	 <1372102237-8757-2-git-send-email-paul.gortmaker@windriver.com>
	 <1372103478.1245.23.camel@joe-AO722>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1372103478.1245.23.camel@joe-AO722>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, linux-embedded <linux-embedded@vger.kernel.org>

On Mon, 2013-06-24 at 12:51 -0700, Joe Perches wrote:
> On Mon, 2013-06-24 at 15:30 -0400, Paul Gortmaker wrote:
> > The __cpuinit type of throwaway sections might have made sense
> > some time ago when RAM was more constrained, but now the savings
> > do not offset the cost and complications.  For example, the fix in
> > commit 5e427ec2d0 ("x86: Fix bit corruption at CPU resume time")
> > is a good example of the nasty type of bugs that can be created
> > with improper use of the various __init prefixes.
> 
> Hi Paul.
> 
> Could you please post the sizes of a generic kernel build
> with and without this?

Nevermind...

I just checked using readelf -S.

Seems sensible to me.
