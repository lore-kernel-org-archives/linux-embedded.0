From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: Subject: [PATCH 01/16] Squashfs: inode operations
Date: Thu, 23 Oct 2008 09:42:17 +0100
Message-ID: <490038E9.7050902@lougher.demon.co.uk>
References: <E1KqrTW-0001xC-9M@dylan> <Pine.LNX.4.64.0810221907080.20919@vixen.sonytel.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0810221907080.20919@vixen.sonytel.be>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com

Geert Uytterhoeven wrote:

> Sparse with endian checking (make C=2 CHECKFLAGS="-D__CHECK_ENDIAN__") complains
> aibout these:
> 
> | fs/squashfs/inode.c:306:25: warning: cast to restricted __le16
> | fs/squashfs/inode.c:324:25: warning: cast to restricted __le16
> 
> and it seems to be right, as inode.i_mode is not __le16. I think the le16_to_cpu()
> should be removed.

Yes, you're right.  Fixed thanks.

> 
> BTW, there are also a few sparse warnings about different signednesses, so you
> probably want to run sparse yourself, too.

I'll do that.

Phillip
