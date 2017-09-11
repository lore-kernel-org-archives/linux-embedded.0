From: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: execve(NULL, argv, envp) for nommu?
Date: Mon, 11 Sep 2017 19:14:38 +0100
Message-ID: <20170911191438.3221e95e@alans-desktop>
References: <324c00d9-06a6-1fc5-83fe-5bd36d874501@landley.net>
        <CAMuHMdUPUaLfbbFF1kZoEUy7or-9sVOt=ykAHT+S6NBvFy5V=g@mail.gmail.com>
        <20170905142436.262ed118@alans-desktop>
        <ab6e6e8b-7040-a07d-5502-405701182568@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <ab6e6e8b-7040-a07d-5502-405701182568@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Landley <rob@landley.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>, dalias@libc.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> It's not the performance cost, it's rewriting all the pointers.

Which you don't need to do

> Without address translation, copying the existing mappings to a new
> range requires finding and adjusting every pointer to the old data,

No it doesn't. See Minix.

When you fork() rather than vfork you stick a copy of any non-relocatable
elements (typically DATA copy + BSS + stack with a sane CPU and compiler)
into a buffer and you swap them over with the real copy when you task
switch to the one in the wrong place. If you start the child first you
usually only take one copy.

I've always been amused that Linux NOMMU hasn't managed to grow a feature
that people successfully implemented on 68000 long long ago, and I
believe some other processors back to v6/v7 days.

Alan
