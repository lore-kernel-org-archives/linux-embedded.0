From: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: execve(NULL, argv, envp) for nommu?
Date: Tue, 5 Sep 2017 14:24:36 +0100
Message-ID: <20170905142436.262ed118@alans-desktop>
References: <324c00d9-06a6-1fc5-83fe-5bd36d874501@landley.net>
        <CAMuHMdUPUaLfbbFF1kZoEUy7or-9sVOt=ykAHT+S6NBvFy5V=g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUPUaLfbbFF1kZoEUy7or-9sVOt=ykAHT+S6NBvFy5V=g@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Landley <rob@landley.net>, Linux Embedded <linux-embedded@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> > anymore. But I'm already _running_ this program. If I could fork() I
> > could already get a second copy of the sucker and call main() again
> > myself if necessary, but I can't, so...

You can - ptrace 8)

> > honoring the suid bit if people feel that way. I just wanna unblock
> > vfork() while still running this code. 

Would it make more sense to have a way to promote your vfork into a
fork when you hit these cases (I appreciate that fork on NOMMU has a much
higher performance cost as you start having to softmmu copy or swap
pages).

Alan
