From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: execve(NULL, argv, envp) for nommu?
Date: Tue, 5 Sep 2017 11:00:55 +0200
Message-ID: <CAMuHMdUPUaLfbbFF1kZoEUy7or-9sVOt=ykAHT+S6NBvFy5V=g@mail.gmail.com>
References: <324c00d9-06a6-1fc5-83fe-5bd36d874501@landley.net>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=PDXRpYq6kNJ57v02dLqAq6tmB0c0BKLaKvKVmrwhdL4=;
        b=PQWw4A6wp7gEhg3B6vbBUWaNks2Lz+QKg+uK/+M2Cv8awdOWos6stICG6tplsG98dY
         EcII7cETPCBf47IvQeCgqZ2EndbKqAQhFpbGH9NqjVEE4LWEN4+oZpoiJmW4irzY7SkF
         G42VzmH0b9wlvh0mwu4kQgtrNeBcdIDIa5lIL0BVii9Tx50QZH6I6iRDiyPrHbNS8y3C
         JE+RczzlLUcPWcmwGuckvndRAQo/wrvEsPHXFvK/DArEgLbQRBVA1B1hg8gO/4CLjK1h
         k9/SuDp+zSyyqrIpkiPwY5zxNC0p/cS5gy2JLSyG601NPw6rXV8fgS0Wt6g2AvJdibvd
         60fA==
In-Reply-To: <324c00d9-06a6-1fc5-83fe-5bd36d874501@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Landley <rob@landley.net>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

CC Oleg, lkml

On Tue, Sep 5, 2017 at 9:34 AM, Rob Landley <rob@landley.net> wrote:
> For years I've wanted an execve() system call modification that let me
> pass a NULL as the first argument to say "re-exec this program please".
> Because on nommu you've got to exec something to unblock vfork(), and
> daemons (or things like busybox and toybox) want to re-exec themselves.
> I just hit this again trying to implement a nommu-friendly strace(): the
> one on github doesn't SIGSTOP the child before the execve() of the
> process to trace because vfork(), and just races and misses the first
> few system calls on nommu instead...)
>
> The problem with exec /proc/self/exe is A) I haven't necessarily got
> /proc mounted, B) in a chroot the original binary might not be in scope
> anymore. But I'm already _running_ this program. If I could fork() I
> could already get a second copy of the sucker and call main() again
> myself if necessary, but I can't, so...
>
> I'm aware there's a possible "but what if it was suid and it's already
> dropped privileges" argument, and I'm fine with execve(NULL) not
> honoring the suid bit if people feel that way. I just wanna unblock
> vfork() while still running this code. (A way to detect I did this would
> be great too, but the normal tweaking of argv[] or envp[] to let main
> know we're a child still works.)
>
> Is there a _reason_ the kernel doesn't do this, or has nobody bothered
> to code it up yet?
>
> Rob
