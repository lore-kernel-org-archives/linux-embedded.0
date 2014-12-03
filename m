From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v5] selftest: size: Add size test for Linux kernel
Date: Wed, 3 Dec 2014 19:00:16 +0100
Message-ID: <CAMuHMdVk9QLDRYDs3q7=51=qTMNRY+MQVhkqGE25XqYOkLbCxg@mail.gmail.com>
References: <547E854E.5060101@sonymobile.com>
	<1417578191.16722.11.camel@concordia>
	<547F3A57.7000106@sonymobile.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=C/7OiQiXEzHFe1GQrX2d0RMp4U+h/gC0qE1A3kUbmKE=;
        b=xr5PQpHy+whwvzV/OHtUapbTiSK2hzUGyZ8iIiBTWbDezZJOeQAtsWe5npSFfrCby/
         qIp4v9JwltKouJ/QoFSokHcfpYITHdpaN0eeIUHWi4PHiLsK0tT5yXPkISfab+c5SXXA
         TxelwFEqT0ls6pI7TbAJ4Vx/yuXULs+2O+eSLoyTq4u/xnyv+z6zNKS5kLu4ORIM86AR
         7xCFHWjrcuqxApj6AJ6lg1owgboW5mPOVWcs0XrbusOqPp/8gX3ZC3YkxWcCLqok0ZL+
         Bd3syKWcMrz92A9+nKqnK2QQl8WnP5m1XpHRelXn2rjl2BJZi5rbA2/pDnHA8Onl+ikW
         SLNA==
In-Reply-To: <547F3A57.7000106@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@sonymobile.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Shuah Khan <shuahkh@osg.samsung.com>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, Josh Triplett <josh@joshtriplett.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

On Wed, Dec 3, 2014 at 5:29 PM, Tim Bird <tim.bird@sonymobile.com> wrote:
>>> diff --git a/tools/testing/selftests/size/Makefile b/tools/testing/selftests/size/Makefile
>>> new file mode 100644
>>> index 0000000..47f8e9c
>>> --- /dev/null
>>> +++ b/tools/testing/selftests/size/Makefile
>>> @@ -0,0 +1,15 @@
>>> +#ifndef CC
>>> +    CC = $(CROSS_COMPILE)gcc
>>> +#endif
>>
>> I think the following is preferable:
>>
>>   CC := $(CROSS_COMPILE)$(CC)
>>
>>
>> It allows optionally setting a custom CC, as well as optionally CROSS_COMPILE.
>
> I'm not sure I follow this.
>
> If CC is unset, you get only the CROSS_COMPILE prefix.
> If CC is set to e.g. 'gcc', then you get a nicely formatted toolchain string.
> But if CC already has the prefix applied, then this will result in
>   having it duplicated, which surely won't work correctly.
>
> In the long run, I would hope that a higher level Makefile or environment setting
> will be setting the toolchain string appropriately (as well as handling build flags)
> which is why I wanted to use an ifndef (which Thomas correctly pointed out is just
> wrong).
>
> Actually, after getting this tiny program accepted, my next task was working on a
> proper fix for handling cross compilation in a more generic (not case-by-case) way.
>
> CROSS_COMPILE prefix usage looks a bit uncoordinated in the tools directory, but most
> tests seem to be favoring $(CROSS_COMPILE)gcc.
>
>  $ cd tools ; mgrep CROSS

[...]

> I agree it's desirable not to hardcode gcc, but we seem to be doing it all over
> the place already.

Seems like it's time to start integrating the tests with the regular Kbuild
system, which handles cross-compilation fine...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
