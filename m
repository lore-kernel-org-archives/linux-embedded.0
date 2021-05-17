From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 3/3] lib/vsprintf: Use pr_crit() instead of long fancy
 messages
Date: Mon, 17 May 2021 08:21:12 +0200
Message-ID: <CAMuHMdXQArCn9BS_8p0iUAgomfEHWe8ypg=B_SGfvJu8c_L5vg@mail.gmail.com>
References: <20210331093104.383705-1-geert+renesas@glider.be>
 <20210331093104.383705-4-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <20210331093104.383705-4-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
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
To: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Petr Mladek <pmladek-IBi9RG/b67k@public.gmane.org>, Sergey Senozhatsky <sergey.senozhatsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Marco Elver <elver-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Linux Embedded <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, John Ogness <john.ogness-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Rasmus Villemoes <linux-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux IOMMU <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Vlastimil Babka <vbabka-AlSwsSmVLrQ@public.gmane.org>

On Wed, Mar 31, 2021 at 11:59 AM Geert Uytterhoeven
<geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org> wrote:
> While long fancy messages have a higher probability of being seen than
> small messages, they may scroll of the screen fast, if visible at all,
> and may still be missed.  In addition, they increase boot time and
> kernel size.
>
> The correct mechanism to increase importance of a kernel message is not
> to draw fancy boxes with more text, but to shout louder, i.e. increase
> the message's reporting level.  Making sure the administrator of the
> system is aware of such a message is a system policy, and is the
> responsability of a user-space log daemon.
>
> Fix this by increasing the reporting level from KERN_WARNING to
> KERN_CRIT, and removing irrelevant text and graphics.
>
> This reduces kernel size by ca. 0.5 KiB.
>
> Fixes: 5ead723a20e0447b ("lib/vsprintf: no_hash_pointers prints all addresses as unhashed")
> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

No comments?
Unlike the cases handled by the other two patches in this series,
this one cannot be configured out.

Thanks!

> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -2193,20 +2193,9 @@ static int __init no_hash_pointers_enable(char *str)
>
>         no_hash_pointers = true;
>
> -       pr_warn("**********************************************************\n");
> -       pr_warn("**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **\n");
> -       pr_warn("**                                                      **\n");
> -       pr_warn("** This system shows unhashed kernel memory addresses   **\n");
> -       pr_warn("** via the console, logs, and other interfaces. This    **\n");
> -       pr_warn("** might reduce the security of your system.            **\n");
> -       pr_warn("**                                                      **\n");
> -       pr_warn("** If you see this message and you are not debugging    **\n");
> -       pr_warn("** the kernel, report this immediately to your system   **\n");
> -       pr_warn("** administrator!                                       **\n");
> -       pr_warn("**                                                      **\n");
> -       pr_warn("**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **\n");
> -       pr_warn("**********************************************************\n");
> -
> +       pr_crit("This system shows unhashed kernel memory addresses\n");
> +       pr_crit("via the console, logs, and other interfaces. This\n");
> +       pr_crit("might reduce the security of your system.\n");
>         return 0;
>  }
>  early_param("no_hash_pointers", no_hash_pointers_enable);

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
