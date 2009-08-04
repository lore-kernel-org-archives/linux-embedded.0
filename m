From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/6] include/linux/unaligned/{l,b}e_byteshift.h: Fix
 usage for compressed kernels
Date: Tue, 4 Aug 2009 15:55:50 -0700
Message-ID: <20090804155550.3203f5f4.akpm@linux-foundation.org>
References: <20090731093107.GA29704@merkur.ravnborg.org>
	<1249311501-23102-1-git-send-email-albin.tonnerre@free-electrons.com>
	<1249311501-23102-2-git-send-email-albin.tonnerre@free-electrons.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1249311501-23102-2-git-send-email-albin.tonnerre@free-electrons.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Cc: sam@ravnborg.org, hpa@zytor.com, linux@arm.linux.org.uk, alain@knaff.lu, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, albin.tonnerre@free-electrons.com

On Mon,  3 Aug 2009 16:58:17 +0200
Albin Tonnerre <albin.tonnerre@free-electrons.com> wrote:

> When unaligned accesses are required for uncompressing a kernel (such as
> for LZO decompression on ARM in a patch that follows), including
> <linux/kernel.h> causes issues as it brings in a lot of things that are
> not available in the decompression environment.
> However, those files apparently use nothing from <linux/kernel.h>, all
> they need is the declaration of types such as u32 or u64, so
> <linux/types.h> should be enough

Again, please provide a full description of thes "issues" which a patch
addresses so that the patch's importance can be understood by others,
thanks.
