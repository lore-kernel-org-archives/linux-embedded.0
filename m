From: Petr Mladek via iommu <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
Subject: Re: [PATCH 3/3] lib/vsprintf: Use pr_crit() instead of long fancy
 messages
Date: Thu, 20 May 2021 14:51:50 +0200
Message-ID: <YKZbZhACyIENhM8S@alley>
References: <20210331093104.383705-1-geert+renesas@glider.be>
 <20210331093104.383705-4-geert+renesas@glider.be>
 <CAMuHMdXQArCn9BS_8p0iUAgomfEHWe8ypg=B_SGfvJu8c_L5vg@mail.gmail.com>
Reply-To: Petr Mladek <pmladek-IBi9RG/b67k@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1621515111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VbT6WFYy0bkSk8HAYhg7anUqtgOM3QEr3KjCoKwSfHQ=;
 b=gOKAeXWpE3pQwkKpXwPHYoc4ERb31lQ3gBN7nTVt1yldwdnn1/3/XyAFth9rfgDimJkoQH
 agqxk+9Aox0SUUfXdjH85VkMEQazH8fYJyaFRs2tPVAJC3VdcHlyCnVzQyWN5LMIv2YHXJ
 O5RoTQ3j+3gflRxjf1BSBzx8QDoYDOo=
Content-Disposition: inline
In-Reply-To: <CAMuHMdXQArCn9BS_8p0iUAgomfEHWe8ypg=B_SGfvJu8c_L5vg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Sender: "iommu" <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Marco Elver <elver-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Linux Embedded <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, John Ogness <john.ogness-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Rasmus Villemoes <linux-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, Sergey Senozhatsky <sergey.senozhatsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux IOMMU <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vlastimil Babka <vbabka-AlSwsSmVLrQ@public.gmane.org>

On Mon 2021-05-17 08:21:12, Geert Uytterhoeven wrote:
> On Wed, Mar 31, 2021 at 11:59 AM Geert Uytterhoeven
> <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org> wrote:
> > While long fancy messages have a higher probability of being seen than
> > small messages, they may scroll of the screen fast, if visible at all,
> > and may still be missed.  In addition, they increase boot time and
> > kernel size.
> >
> > The correct mechanism to increase importance of a kernel message is not
> > to draw fancy boxes with more text, but to shout louder, i.e. increase
> > the message's reporting level.  Making sure the administrator of the
> > system is aware of such a message is a system policy, and is the
> > responsability of a user-space log daemon.
> >
> > Fix this by increasing the reporting level from KERN_WARNING to
> > KERN_CRIT, and removing irrelevant text and graphics.
> >
> > This reduces kernel size by ca. 0.5 KiB.
> >
> > Fixes: 5ead723a20e0447b ("lib/vsprintf: no_hash_pointers prints all addresses as unhashed")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> 
> No comments?
> Unlike the cases handled by the other two patches in this series,
> this one cannot be configured out.

IMHO, the best solution would be to create a generic API for
eye-catching messages.

I am sure that WARN() is misused on many locations all over the kernel
because people just wanted eye-catching message, for example, see
https://lore.kernel.org/r/2149df3f542d25ce15d049e81d6188bb7198478c.camel-RPVEmwYF7IOGWTQfUlqXWgC/G2K4zDHf@public.gmane.org

It might be a win-win solution.

Best Regards,
Petr
