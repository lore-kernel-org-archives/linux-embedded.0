From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: v3.18-rc1 bloat-o-meter
Date: Mon, 20 Oct 2014 17:57:30 +0200
Message-ID: <CAADnVQJsbNHs-S9gMF7P6FwHvHTfFSTPGNTLXAo5tJ8mpB5t6Q@mail.gmail.com>
References: <alpine.DEB.2.02.1410201018230.24954@ayla.of.borg>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=tQPiB2xuy+375yAp6bJ3l4DXXf7tsPSjNBphBWFoPRA=;
        b=P8zjp0U6bhyFgz3xULVjE4rFulaVp71h+gvU9NDCQNTEIPN+qJXa1THBIAr6dFtBob
         nsGftOWjv9W6jCEWrz82qS/A0RyaBZJLrPvkZhwR15Vbp7exhz69hvIU1nRmNEhUTOwP
         tErKjtKf0XA+VzDyRwJhxm9WRPpEUz4aOCUKLr+B71369twZTPw5vwCxLi8UpC5mCA8H
         adXLH94BU48pwL8aC+q/VO/6W22Mfcl8iyHkoBsR/GM67b/yFnsHo19VK3a38oAwlrW/
         kSBIxhOXKHxdRkCPBZ2EomoV+/5y54f8cyJZYHR58FzTOQjdaw2KANOi9hCrDJiVpizA
         U0rg==
In-Reply-To: <alpine.DEB.2.02.1410201018230.24954@ayla.of.borg>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-embedded@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>

On Mon, Oct 20, 2014 at 10:37 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>         Hi all,
>
> Below is the bloat-o-meter output when comparing an m68k/atari_defconfig
> kernel for v3.17 and v3.18-rc1.
>
> Major culprit seems to be bpf. Can this become modular or optional?
> Currently it's always included if CONFIG_NET=y.

yes, the plan is to get it its own CONFIG_BPF so that tracing wouldn't
need to depend on whole NET and so it can be stubbed out.
