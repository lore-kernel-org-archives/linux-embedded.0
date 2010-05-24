From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: [Squashfs-devel] [PATCH 1/2] Squashfs: add LZO decompression
 support
Date: Mon, 24 May 2010 03:49:05 +0100
Message-ID: <4BF9E921.6090609@lougher.demon.co.uk>
References: <001a01caf63e$0280ef50$0782cdf0$@jeong@lge.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <001a01caf63e$0280ef50$0782cdf0$@jeong@lge.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chan Jeong <chan.jeong@lge.com>
Cc: squashfs-devel@lists.sourceforge.net, 'Gunho Lee' <gunho.lee@lge.com>, 'Tim Bird' <tim.bird@am.sony.com>, linux-embedded@vger.kernel.org, 'Hyo Jun Im' <hyojun.im@lge.com>

Chan Jeong wrote:
> Hi,
> 
> This patch series adds LZO decompression support to Squashfs,
> using in-kernel LZO decompression library and Squashfs 
> decompressor entries.
> 
> The patch series also includes LZO support for Squashfs tools.
> 
> Signed-off-by: Chan Jeong <chan.jeong@lge.com>

Hi Chan

Thanks for the patches.  How much testing have these patches had?
 From an eyeball of the code (and a check of the LZO decompressor
code in the kernel) they look OK.

I'm currently considering whether to push these for mainline in
the current 2.6.35 merge window.  I'd like to push them in this
merge window, however, pushing them now is definitely cutting things
fine because they were only posted for review after the merge window
opened (and the established etiquette is the merge window is to push
things that were posted for review and ideally in linux-next well
before the merge window opened).

So, some idea of how much testing these patches have had would
increase my confidence about pushing them in this merge window.

Thanks

Phillip

