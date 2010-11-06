From: James Hogan <james@albanarts.com>
Subject: Re: [PATCH 01/16 v2] pramfs: documentation
Date: Sat, 6 Nov 2010 10:39:35 +0000
Message-ID: <20101106103935.GA13172@gandalf.local>
References: <4CD51832.7070309@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4CD51832.7070309@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Andrew Morton <akpm@linux-foundation.org>

Hi,

On Sat, Nov 06, 2010 at 09:56:18AM +0100, Marco Stornelli wrote:
> From: Marco Stornelli <marco.stornelli@gmail.com>
> +PRAMFS is write protected. The page table entries that map the backing-store
> +RAM are normally marked read-only. Write operations into the filesystem
> +temporarily mark the affected pages as writeable, the write operation is
> +carried out with locks held, and then the page table entries is +marked read-only again.
> +This feature provides protection against filesystem corruption caused by errant

Looks like an accidental lost newline in the patch here, should that be
"are marked" or is there some text missing?

Cheers
James
