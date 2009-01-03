From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Sat, 3 Jan 2009 23:54:30 +0100
Message-ID: <c384c5ea0901031454n451bc899w166bb146c96f6164@mail.gmail.com>
References: <200901020207.30359.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=gxbBID+zfMo/078L71NFXy0JThR3cirpsPb4eb3KJiw=;
        b=vFMBX612Nc/pZ5B4vRxfXjoxZbPrkN/inJIK4shH/8mE6i5VM6tI6hmfZgO61e3eXC
         oCWbVIobQnIX3Wz3xBZY63SVmVqc0JGMGr0XljwqKsBh9AmTS3LLMOr1QK4CBB9Q7lP+
         V3HgzcZ2zD8jiprYRzQTPodjPkXf1E/t2MKBQ=
In-Reply-To: <200901020207.30359.rob@landley.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Landley <rob@landley.net>
Cc: Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

Hello all,

On Fri, Jan 2, 2009 at 9:07 AM, Rob Landley <rob@landley.net> wrote:
> Before 2.6.25 (specifically git bdc807871d58285737d50dc6163d0feb72cb0dc2 )
> building a Linux kernel never required perl to be installed on the build
> system.  (Various development and debugging scripts were written in perl and
> python and such, but they weren't involved in actually building a kernel.)
> Building a kernel before 2.6.25 could be done with a minimal system built from
> gcc, binutils, bash, make, busybox, uClibc, and the Linux kernel, and nothing
> else.  (Embedded developers creating clean cross compile environments that
>

I agree with Rob that the amount of required dependencies should be
kept to a minimum.

If we only use 0.5% of a certain language (or: dependent package),
then rather implement
that 0.5% in the existing language.

Dependencies very quickly become dependency hell. If A requires B,
then A also inherits all
(future) requirements of B, etc. etc.

In my daily software development work with Linux and GNU software in
general, 10% of it is spent fighting/removing these extremely "thin"
or false depencies, so that it is usuable in embedded devices.


Regards,
-- 
Leon
