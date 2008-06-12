From: "Bill Traynor" <wmat@naoi.ca>
Subject: Re: Cross Compiler and loads of issues
Date: Thu, 12 Jun 2008 14:39:59 -0400 (EDT)
Message-ID: <402b1f4b315f572ac6459f78fa8b5ee4.squirrel@www.geekisp.com>
References: <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shaz <shazalive@gmail.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

> Hi,
>
> I have been following "Re: [PATCH 0/1] Embedded Maintainer(s)" and
> felt like asking that is there one good way to get a cross compiler
> work. I tried buildroot, scratchbox and even openMoko with
> openEmbedded but all of them had lots of issues and don't know which
> will be the best alternative.

There is no "one good way".  I've had decent success building Dan Kegel's
"crosstool" in the past: http://www.kegel.com/crosstool/
>
> I also went through the material provided freely by Free Electron but
> still I am not successful to build a custom kernel. Next I am trying
> MontaVista's kit. I just wish I don't get lost.

I'd continue the search for prebuilt toolchains.  CodeSourcery has a Lite
version of it's ARM, Coldfire, MIPS, and Power toolchains.

>
> Anyways, I liked the idea of Qemu based cross compiler. Is it possible
> for the inexperienced to get it working and emulate the exact model
> and devices.
>
> --
>
> Shaz
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

