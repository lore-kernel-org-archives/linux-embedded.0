From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: execve(NULL, argv, envp) for nommu?
Date: Mon, 11 Sep 2017 17:15:26 +0200
Message-ID: <20170911151526.GA4126@redhat.com>
References: <324c00d9-06a6-1fc5-83fe-5bd36d874501@landley.net>
 <CAMuHMdUPUaLfbbFF1kZoEUy7or-9sVOt=ykAHT+S6NBvFy5V=g@mail.gmail.com>
 <20170905142436.262ed118@alans-desktop>
 <ab6e6e8b-7040-a07d-5502-405701182568@landley.net>
 <d2d1acae-b2a1-9f41-d3bf-9d3b35a62664@landley.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d2d1acae-b2a1-9f41-d3bf-9d3b35a62664@landley.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Landley <rob@landley.net>
Cc: Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Embedded <linux-embedded@vger.kernel.org>, dalias@libc.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 09/08, Rob Landley wrote:
>
> So is exec(NULL, argv, envp) a reasonable thing to want?

I think that something like prctl(PR_OPEN_EXE_FILE) which does

	dentry_open(current->mm->exe_file->path, O_PATH)

and returns fd make more sense.

Then you can do execveat(fd, "", ..., AT_EMPTY_PATH).

But to be honest, I can't understand the problem, because I know nothing
about nommu.

You need to unblock parent sleeping in vfork(), and you can't do another
fork (I don't undestand why).

Perhaps the child can create another thread? The main thread can exit
after that and unblock the parent. Or perhaps even something like
clone(CLONE_VM | CLONE_PARENT), I dunno...

Oleg.

