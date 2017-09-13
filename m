From: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: execve(NULL, argv, envp) for nommu?
Date: Wed, 13 Sep 2017 20:33:10 +0100
Message-ID: <20170913203310.42bbaf57@alans-desktop>
References: <324c00d9-06a6-1fc5-83fe-5bd36d874501@landley.net>
        <CAMuHMdUPUaLfbbFF1kZoEUy7or-9sVOt=ykAHT+S6NBvFy5V=g@mail.gmail.com>
        <20170905142436.262ed118@alans-desktop>
        <ab6e6e8b-7040-a07d-5502-405701182568@landley.net>
        <d2d1acae-b2a1-9f41-d3bf-9d3b35a62664@landley.net>
        <20170911151526.GA4126@redhat.com>
        <d3ae79b1-810d-8abc-3692-69cef4bd1a7a@landley.net>
        <CAMuHMdXQn47LK6RLtdgW3JJtL1VwqK7ZvUdmLgaZat8TA30KtQ@mail.gmail.com>
        <bb73820f-745b-e55b-57f6-10b3de0f801b@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <bb73820f-745b-e55b-57f6-10b3de0f801b@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Landley <rob@landley.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Oleg Nesterov <oleg@redhat.com>, Linux Embedded <linux-embedded@vger.kernel.org>, Rich Felker <dalias@libc.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> Ok, I'll bite. How do you set a signal handler under this regime, since
> that needs to pass a function pointer to the syscall? Have a different
> function pointer type for when you want a real pointer instead of an
> offset pointer? Perhaps label them "near" and "far" pointers, since
> there's precedent for that back under DOS?

A function pointer is an offset relative to the base of the code (but the
other comments are mostly valid)

For most hardware it's cheaper to just do it the way Minix did,
especially as all the hard work in being able to share code and
copy/migrate data happens to have been done in order to make XIP work. A
modern CPU can copy memory at lot faster than an 8MHZ 68K which couldn't
even manage to move 16bits/clock.

> You're also requiring static linking: shared libraries work just fine
> with fdpic, but under your segment:offset addressing system all text has
> to be relative to the same code segment.

No - see the Windows 16bit approach to this. Bring a bucket though 8)

> Plus there's still the "fork() off of mozilla" problem that you may copy
> lots of data just to immediately discard it as the common case (unless
> you'd still use vfork() for most things), and you still need contiguous
> blocks of memory for each segment (nommu is vulnerable to fragmentation,
> increasingly so as the system stays up longer) so your fork() will fail
> where vfork() succeeds. But that just makes it really slow and

If you just do copies and scheduling time swaps of memory blocks then
fragmentation isn't a problem because you can fragment the copy not
currently running. In fact you can (as MAPUX did) extend this to
completely kill the fragmentation problem at the cost of turning
sustained high memory usage with few process deaths into very poor
performance. MAPUX algorithm works very hard to keep stuff unfragmented
but is prepared to move chunks of other processes temporarily around in
order to keep the running process where it should be. In effect it
implements a software paged MMU with an allocator that tries to achieve a
1:1 mapping of the virt/phys of the process.

POSIX tries to side step all of this by providing a combined fork/mess
with file handles of child etc/execve function (posix_spawn) that an
MMUless system can implement to provide the usual functionalities of
fork() / execve() like handle redirection. There are also other ways to
implement that with threads not sharing file handles if you have enough
thread capability (something posix spawn can't assume).

Alan
