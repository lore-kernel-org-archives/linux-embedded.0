From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] init: make init failures more explicit
Date: Fri, 18 Oct 2013 14:20:54 +0200
Message-ID: <CAMuHMdXas3ALeMXkj1YuDARVAL4Ln19UjXm8oRiGoLyKBc_B7A@mail.gmail.com>
References: <1382097633-10166-1-git-send-email-michael.opdenacker@free-electrons.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=H5MVgA5ric/5BKUwu9b/2H5S7Sz+lO+KxGlTweAff4o=;
        b=M7cWSdcNg9UzW/4scK3qu86xDgyrdUVW60KqJ/Q14o1lVLxzDOnF+sJd6xBtN2gX8J
         O7Y9HFIQvoNGBhM88kKNne7sY647UyyXQD1/3s6Sxkj82SkQcnWdicMOkBY1lD+y/33G
         CSNFHPHupH/85LvoNPBwwEZTtUgcLSrEKsNBx3z9ss4HONsVxTtamfdfnIr7t1YjBzmV
         fwkOZl2FLI1bnqZfTIlGIJX4KrqJs6RinV9NRN407yru84oDL/pYJhYt0gG0vk4KyWUq
         wRYt/BoqcNYpNBAZbq3EfHaeqOlGGOehRr7kcfZoVvILBOREt5APQjW4Bk2KYApDdN0o
         RIeQ==
In-Reply-To: <1382097633-10166-1-git-send-email-michael.opdenacker@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Opdenacker <michael.opdenacker@free-electrons.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, janne.karhunen@gmail.com

On Fri, Oct 18, 2013 at 2:00 PM, Michael Opdenacker
<michael.opdenacker@free-electrons.com> wrote:
> +               pr_err("Starting init: %s exists but couldn't execute it (error: %d - see errno-base.h and errno.h)\n",

IMHO the "- see errno-base.h and errno.h" is a bit overkill.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
