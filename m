From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH V2 6/8] lzma: Make lzma available to non
 initramfs/initrd code
Date: Wed, 6 Jan 2010 16:31:13 -0800
Message-ID: <20100106163113.637e47db.akpm@linux-foundation.org>
References: <E1NIuOW-0001ol-RC@dylan.lougher.demon.co.uk>
	<20100106140409.ba0f63d1.akpm@linux-foundation.org>
	<4B4528C8.3020603@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4B4528C8.3020603@lougher.demon.co.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, phillip.lougher@gmail.com, tim.bird@am.sony.com, Stephen Rothwell <sfr@canb.auug.org.au>, Albin Tonnerre <albin.tonnerre@free-electrons.com>

On Thu, 07 Jan 2010 00:20:24 +0000
Phillip Lougher <phillip@lougher.demon.co.uk> wrote:

> Andrew Morton wrote:
> 
> > So what to do?  I guess I could go ahead with the mainline merge, and
> > Stephen drops <whatever that tree was> from linux-next until it has
> > been fixed up?
> > 
> 
> Yes, I'm happy with that.  The following patch is the necessary fix
> that needs to go into linux-next when you've gone ahead with the
> mainline merge of the lib-add-support-for-lzo-compressed-kernels.patch.

ooh, goody, thanks.

> diff --git a/lib/decompress_unlzo.c b/lib/decompress_unlzo.c
> index db521f4..edd82c3 100644
> --- a/lib/decompress_unlzo.c
> +++ b/lib/decompress_unlzo.c
> @@ -39,6 +39,7 @@
> 
>   #include <linux/types.h>
>   #include <linux/lzo.h>
> +#include <linux/decompress/unlzo_mm.h>
>   #include <linux/decompress/mm.h>
> 
>   #include <linux/compiler.h>

Your email client is doing space-stuffing.
