From: Rob Landley <rob@landley.net>
Subject: execve(NULL, argv, envp) for nommu?
Date: Tue, 5 Sep 2017 02:34:53 -0500
Message-ID: <324c00d9-06a6-1fc5-83fe-5bd36d874501@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=b5Dc5/MSnJso+KL8PD+nNA59v3wnR/epF73GMWkT0Pw=;
        b=IkhPlV3RUrTSc63J7BNKGWAJKuhq160Tg6z6QCxNXe5cLIAYNxeehrDN8ple9goZcb
         TuKI628qVOXr3VdklqCtR0wejxbLGUQIiAsYc6udx9pMZHYv1SuDrgUZJEYZCbjah6rO
         ul7sIuxNYt7z5rbmhamSsKigWSQxZCgPHtvfC1CLxDlGFO1Gi0qZB0N2xz+6aKwcO0zl
         dqSiGIo9nQTe90TqTfguv4ytxj6rlMhP+sXREP3TR064FZK7rSFWIdr7vl8rR8kvf8w9
         C9kij2omJYkONvys/h231ZdnpuXyTC+BbnVDlCXuaoWJEwx8R/EImZvu1R5CMwMRjiTS
         JCxQ==
Content-Language: en-US
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

For years I've wanted an execve() system call modification that let me
pass a NULL as the first argument to say "re-exec this program please".
Because on nommu you've got to exec something to unblock vfork(), and
daemons (or things like busybox and toybox) want to re-exec themselves.
I just hit this again trying to implement a nommu-friendly strace(): the
one on github doesn't SIGSTOP the child before the execve() of the
process to trace because vfork(), and just races and misses the first
few system calls on nommu instead...)

The problem with exec /proc/self/exe is A) I haven't necessarily got
/proc mounted, B) in a chroot the original binary might not be in scope
anymore. But I'm already _running_ this program. If I could fork() I
could already get a second copy of the sucker and call main() again
myself if necessary, but I can't, so...

I'm aware there's a possible "but what if it was suid and it's already
dropped privileges" argument, and I'm fine with execve(NULL) not
honoring the suid bit if people feel that way. I just wanna unblock
vfork() while still running this code. (A way to detect I did this would
be great too, but the normal tweaking of argv[] or envp[] to let main
know we're a child still works.)

Is there a _reason_ the kernel doesn't do this, or has nobody bothered
to code it up yet?

Rob
