From: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: YAFFS in the kernel tree?
Date: Thu, 29 May 2008 00:15:38 +0300
Message-ID: <1212009338.2236.30.camel@shinybook.infradead.org>
References: <200805290859.54396.manningc2@actrix.gen.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200805290859.54396.manningc2-jEEI2ySEPisjAXWc8ALWsQ@public.gmane.org>
Sender: linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Charles Manning <manningc2-jEEI2ySEPisjAXWc8ALWsQ@public.gmane.org>
Cc: linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, 2008-05-29 at 08:59 +1200, Charles Manning wrote:
> I'm the author of YAFFS. This is not in the kernel tree, but is fairly easy to 
> integrate by just pulling a tarball and running  patch-in script. 
> 
> I am curious as to whether people consider the current mechanism "good enough" 
> or whether it is worth the effort trying to get YAFFS into the kernel tree.

I've never paid close attention to YAFFS, and part of the reason for
that is that it's never been considered good enough to be merged into
the kernel tree. If it isn't even being posted for _review_, then it
might as well not exist.

There's a lot more to code review than the cosmetics of 'coding style'.

I would definitely encourage you to get the code into a shape where we
can consider merging it.

-- 
dwmw2

--
To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
