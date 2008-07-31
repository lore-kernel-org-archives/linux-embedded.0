From: Adrian Bunk <bunk@kernel.org>
Subject: Re: [patch 1/4] Configure out AIO support
Date: Thu, 31 Jul 2008 13:12:19 +0300
Message-ID: <20080731101219.GC4221@cs181140183.pp.htv.fi>
References: <20080731092703.661994657@free-electrons.com> <20080731093220.690886851@free-electrons.com> <20080731100929.GA9206@mx.loc>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080731100929.GA9206@mx.loc>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernhard Fischer <rep.dot.nop@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com, Matt Mackall <mpm@selenic.com>, bcrl@kvack.org, linux-aio@kvack.org, akpm@linux-foundation.org

On Thu, Jul 31, 2008 at 12:09:29PM +0200, Bernhard Fischer wrote:
> On Thu, Jul 31, 2008 at 11:27:04AM +0200, Thomas Petazzoni wrote:
> >This patchs adds the CONFIG_AIO option which allows to remove support
> >for asynchronous I/O operations, that are not necessarly used by
> >applications, particularly on embedded devices. As this is a
> >size-reduction option, it depends on CONFIG_EMBEDDED. It allows to
> >save ~7 kilobytes of kernel code/data:
> 
> Shouldn't this also make sure not to install aio_abi.h or at least an
> empty aio_abi.h?

The userspace headers are independent of any kernel configuration
(except for the architecture).

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
