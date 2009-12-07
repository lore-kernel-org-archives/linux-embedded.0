From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/9] Squashfs: Factor out remaining zlib dependencies
 into separate wrapper file
Date: Mon, 7 Dec 2009 14:58:03 -0800
Message-ID: <20091207145803.7e893bd7.akpm@linux-foundation.org>
References: <E1NHTHg-0001sR-PM@dylan.lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <E1NHTHg-0001sR-PM@dylan.lougher.demon.co.uk>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, phillip.lougher@gmail.com, tim.bird@am.sony.com

On Mon, 07 Dec 2009 02:25:08 +0000
Phillip Lougher <phillip@lougher.demon.co.uk> wrote:

> +void *zlib_init()
> ...
> +void zlib_free(void *strm)

More poorly-named globals.
