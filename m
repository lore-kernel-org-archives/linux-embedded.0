From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] init: make init failures more explicit
Date: Fri, 18 Oct 2013 11:23:03 +0200
Message-ID: <CAMuHMdWXWfGqw041pkOYKzLjQ05GfCcz9jOFQaPa=d_RwhOUcg@mail.gmail.com>
References: <1382086049-14386-1-git-send-email-michael.opdenacker@free-electrons.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=o5kk8jwB8awGREvL1F74GvQeuwmpW97irt73z9WZn6k=;
        b=DJySCEU5ThX5QPfkfKzO1Dlpu3GJU/YII4+EYIZYXlf92jZNayR5JLh1gBW7h11ucL
         AXfW54kpKrMjvZXTtKkDaLfNCqdql8AJp1aEzTl8rY9tTfvQWCZNxjyhwQgdRq/lVAWc
         O3VSLubD3BNpV40LPPj5Qe4scs6DahfB9TCij7XKZQX1CYHhJCsMvRQCE/nBg7U2Iq0o
         k4LCpuYPDt7CyaOs19lfsZQROjpK6NX3CqhPQnYAHl3zLCvftfkRVw2oLGEMq98uUAVo
         gKz6nnwfdJULYU9J8h6nA6vZYrPKkXAzbLWJ5wvVBo84us2wAV05bkeM8/ECnza52RHG
         VRKg==
In-Reply-To: <1382086049-14386-1-git-send-email-michael.opdenacker@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Opdenacker <michael.opdenacker@free-electrons.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>

On Fri, Oct 18, 2013 at 10:47 AM, Michael Opdenacker
<michael.opdenacker@free-electrons.com> wrote:
> +       if (ret && ret != -ENOENT) {
> +               pr_err("Starting init: %s exists but couldn't execute it\n",

I think it makes sense to also print the value of ret here.
Apart from your -ENOEXEC case, peeking a bit around, it can be also be
-EINVAL, -ENOMEM (debug binary too big for small embedded system?),
-EACCES, -E2BIG, ...

> +                      init_filename);
> +       }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
