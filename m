From: Rob Landley <rob@landley.net>
Subject: Re: execve(NULL, argv, envp) for nommu?
Date: Tue, 12 Sep 2017 05:48:47 -0500
Message-ID: <d3ae79b1-810d-8abc-3692-69cef4bd1a7a@landley.net>
References: <324c00d9-06a6-1fc5-83fe-5bd36d874501@landley.net>
 <CAMuHMdUPUaLfbbFF1kZoEUy7or-9sVOt=ykAHT+S6NBvFy5V=g@mail.gmail.com>
 <20170905142436.262ed118@alans-desktop>
 <ab6e6e8b-7040-a07d-5502-405701182568@landley.net>
 <d2d1acae-b2a1-9f41-d3bf-9d3b35a62664@landley.net>
 <20170911151526.GA4126@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9l3Mr7nDhQTvLjpfTdfWfNHXjjiS0FHy86JY892xbWk=;
        b=kmW/OkO9Evza9oz1muBhVBzMn2E9/Lfotc6qecdNkxVbgueuDdlNzEY0oUFdla3ghu
         W4HHXHUjGdZIKqpImsnXSwax2kV5AouDEhYYUgLGxFSBov/CtRHtw4QKB6/TbGVMStww
         ZamlPDAYSZ5My5S15YVfSotlaxdENbJxY615GMTm4rZK1lse0AwSJK/0ipFH4ysfRPd6
         R1kba6qG+CQY0/V44CmLYaxbhC570IsBskl4ZOA6uRzpqtG8a07/i75lkdYi05K9SeW3
         ceaicMPuAWtSiFyc6mcf/D4zyrvCbbxW+dHhe2ptTEhjxh5Ojt8ZtZn18IjLeO4aJdDv
         qFMA==
In-Reply-To: <20170911151526.GA4126@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Nesterov <oleg@redhat.com>
Cc: Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Embedded <linux-embedded@vger.kernel.org>, dalias@libc.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 09/11/2017 10:15 AM, Oleg Nesterov wrote:
> On 09/08, Rob Landley wrote:
>>
>> So is exec(NULL, argv, envp) a reasonable thing to want?
> 
> I think that something like prctl(PR_OPEN_EXE_FILE) which does
> 
> 	dentry_open(current->mm->exe_file->path, O_PATH)
> 
> and returns fd make more sense.
> 
> Then you can do execveat(fd, "", ..., AT_EMPTY_PATH).
I'm all for it? That sounds like a cosmetic difference, a more verbose
way of achieving the same outcome.

(Of course now you've got a filehandle you can read xattrs and such
through from otherwise jailed contexts letting you do things you
couldn't necessarily do before, but I assume you know the security
implications of that more than I do. I tried to suggest something that
_didn't_ create new capabilities, just let nommu do a thing that mmu
could already do.)

> But to be honest, I can't understand the problem, because I know nothing
> about nommu.
> 
> You need to unblock parent sleeping in vfork(), and you can't do another
> fork (I don't undestand why).

A nommu system doesn't have a memory management unit, so all addresses
are physical addresses. This means two processes can't see different
things at the same address: either they see the same thing or one of
them can't see that address (due to a range register making it).

Conventional fork() creates copy on write mappings of all the existing
writable memory of the parent process. So when the new PID dirties a
page, the old page gets copied by the fault handler. The problem isn't
the copies (that's just slow), the problem is two processes seeing
different things at the same address. That requires an MMU with a TLB
loaded from page tables.

If you create _new_ mappings and copy the data over, they'll have
different addresses. But any pointers you copied will point to the _old_
addresses. Finding and adjusting all those pointers to point to the new
addresses instead is basically the same problem as doing garbage
collection in C.

Your stack has pointers. Your heap has pointers. Your data and bss (once
initialized) can have pointers. These pointers can be in the middle of
malloc()'ed structures so no ELF table anywhere knows anything about
them. A long variable containing a value that _could_ point into one of
these ranges isn't guaranteed to _be_ a pointer, in which case adjusting
it is breakage. Tracking them all down and fixing up just the right ones
without missing any or changing data you shouldn't is REALLY HARD.

The vfork() system call is what you use on nommu instead: it creates a
child process that uses its parent's memory mappings. The parent process
is stopped until the child calls _exit() or exec(), either of which
means it stops using those mappings and the parent can go back to using
them without the two stomping on each other. (Usually they even share
the same stack, so the child shouldn't return from the function that
called vfork() or it'll corrupt the stack for the parent process. And be
careful about changing local variables, the parent might see the changes
when it resumes. Some vfork() implementations provide a small new stack,
ala signal handlers or kernel interrupts, so you can't guarantee your
parent will see your local variable changes, but you still can't return
from the function that called vfork() in either case.)

So after calling vfork(), the child _must_ call exec() in order for
there to be two independent processes running at the same time. Until
then, the parent is stopped.

The real problem with implementing full fork() isn't the expense of
copying the data (although if you fork and exec from a mozilla style pig
process, you could copy hundreds of megabytes of data and then
immediately discard it again; that's why fork() doesn't usually do that;
oh and on nommu systems you need _contiguous_ memory blocks for the data
because it can't collect disparate pages together into a longer mapping,
so this is actually a largeish real-world issue on those systems, not
merely slow and expensive.) The hard problem is translating the pointers
so the new mapping doesn't read/write objects in the old mapping.

> Perhaps the child can create another thread? The main thread can exit
> after that and unblock the parent. Or perhaps even something like
> clone(CLONE_VM | CLONE_PARENT), I dunno...

Launching a new thread doesn't unblock the parent. A second vfork() from
the child wouldn't unblock the parent. Your mappings are still
overcommited, only _exit() or execve() releases the child process's use
of those mappings.

You can create threads on nommu because they're designed to share the
same mappings. In that case you're guaranteed a new stack, and not
stomping the parent's data is your problem.

But if you exec() from a thread, posix says it kills all the other threads:

http://pubs.opengroup.org/onlinepubs/9699919799/functions/exec.html

And even without that, we're still in the "vfork but add concurrency"
territory. Your threads don't have their own independent mappings,
they're sharing and stomping each other's data unless you add locking
and write your program to know about the other threads. To get two
independent process contexts running the same executable but with
different mappings (I.E. the goal we started with), you still need the
child to exec. And the start of this thread was "exec what"?

> Oleg.

Rob
