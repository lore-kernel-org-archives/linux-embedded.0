From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: execve(NULL, argv, envp) for nommu?
Date: Tue, 12 Sep 2017 13:30:51 +0200
Message-ID: <CAMuHMdXQn47LK6RLtdgW3JJtL1VwqK7ZvUdmLgaZat8TA30KtQ@mail.gmail.com>
References: <324c00d9-06a6-1fc5-83fe-5bd36d874501@landley.net>
 <CAMuHMdUPUaLfbbFF1kZoEUy7or-9sVOt=ykAHT+S6NBvFy5V=g@mail.gmail.com>
 <20170905142436.262ed118@alans-desktop> <ab6e6e8b-7040-a07d-5502-405701182568@landley.net>
 <d2d1acae-b2a1-9f41-d3bf-9d3b35a62664@landley.net> <20170911151526.GA4126@redhat.com>
 <d3ae79b1-810d-8abc-3692-69cef4bd1a7a@landley.net>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=jGiXvVxPc2HJiCMdLq3+AegU3zjr9ZLUEXcH6JIQXpE=;
        b=c9dnBymvSkxMPe4BWjbXdamjHwJH99tJBc3KctFMBanK2FJC1ohhBoOScT2vj41N0c
         KCyspRsQkem737eu0LDBWsuQV6lGQwLCkblDy0/vAnJ4vIGklUCzdvasfuMG/ttWnSxR
         Mrnldznu8MbdkfhodJjesEbfTwfWvY5WWGV+5IKR98NuEb5oCS5kL1vlZ6PqVOYKaE/e
         O3AlljNBZwDfPHuQI71cuuIMimESBKwbe+wQo/ppZM6pTiKYDUlNiuQSQPkyIwenrG4U
         4aiPhnTWIMYn0ZpsX3hv87gz0koj9cS82k7zlmHy/RvL12eIjUMRnxtN4E5Y/qQ6jsE9
         uoBw==
In-Reply-To: <d3ae79b1-810d-8abc-3692-69cef4bd1a7a@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Landley <rob@landley.net>
Cc: Oleg Nesterov <oleg@redhat.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Linux Embedded <linux-embedded@vger.kernel.org>, Rich Felker <dalias@libc.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Rob,

On Tue, Sep 12, 2017 at 12:48 PM, Rob Landley <rob@landley.net> wrote:
> A nommu system doesn't have a memory management unit, so all addresses
> are physical addresses. This means two processes can't see different
> things at the same address: either they see the same thing or one of
> them can't see that address (due to a range register making it).
>
> Conventional fork() creates copy on write mappings of all the existing
> writable memory of the parent process. So when the new PID dirties a
> page, the old page gets copied by the fault handler. The problem isn't
> the copies (that's just slow), the problem is two processes seeing
> different things at the same address. That requires an MMU with a TLB
> loaded from page tables.
>
> If you create _new_ mappings and copy the data over, they'll have
> different addresses. But any pointers you copied will point to the _old_
> addresses. Finding and adjusting all those pointers to point to the new
> addresses instead is basically the same problem as doing garbage
> collection in C.
>
> Your stack has pointers. Your heap has pointers. Your data and bss (once
> initialized) can have pointers. These pointers can be in the middle of
> malloc()'ed structures so no ELF table anywhere knows anything about
> them. A long variable containing a value that _could_ point into one of
> these ranges isn't guaranteed to _be_ a pointer, in which case adjusting
> it is breakage. Tracking them all down and fixing up just the right ones
> without missing any or changing data you shouldn't is REALLY HARD.

Hence (make the compiler) never store pointers, only offsets relative to a
base register. So after making copies of stack, data/bss, and heap, all you
need to do is adjust these base registers for the child process.
Nothing in main memory needs to be modified.

Text accesses can be PC-relative => nothing to adjust.
Local variable accesses are stack-relative => nothing to adjust.
Data/bss accesses can be relative to a reserved register that stores the
data base address => only adjust the base register, nothing in RAM to adjust.
Heap accesses can be relative to a reserved register that stores the heap
base address => only adjust the base register, nothing in RAM to adjust.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
