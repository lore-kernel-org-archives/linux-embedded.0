From: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c -
 bisected
Date: Tue, 26 Aug 2008 19:52:26 -0700 (PDT)
Message-ID: <alpine.LFD.1.10.0808261942100.3363@nehalem.linux-foundation.org>
References: <mzBsPw3QUOF.A.87F.wZGsIB@albercik>  <alpine.LFD.1.10.0808261019450.3363@nehalem.linux-foundation.org>  <20080826183051.GB10925@cs181140183.pp.htv.fi>  <alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org>  <20080826205916.GB11734@cs181140183.pp.htv.fi>
  <alpine.LFD.1.10.0808261403360.3363@nehalem.linux-foundation.org>  <f7848160808261554j2f4eaaa6i1ee8801ae75ca7bf@mail.gmail.com>  <alpine.LFD.1.10.0808261644260.3363@nehalem.linux-foundation.org>  <f7848160808261758q7b84aab1m188c1ebb59304818@mail.gmail.com>
  <alpine.LFD.1.10.0808261837530.3363@nehalem.linux-foundation.org> <f7848160808261936m18c69dc0r26f41850efae4b91@mail.gmail.com>
Mime-Version: 1.0
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f7848160808261936m18c69dc0r26f41850efae4b91-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Parag Warudkar <parag.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Adrian Bunk <bunk-HeJ8Db2Gnd6zQB+pC5nmwQ@public.gmane.org>, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, "Alan D. Brunelle" <Alan.Brunelle-VXdhtT5mjnY@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kernel Testers List <kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arjan van de Ven <arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



On Tue, 26 Aug 2008, Parag Warudkar wrote:
> 
> What about deep call chains? The problem with the uptake of 4K stacks
> seems to be that is not reliably provable that it will work under all
> circumstances.

Umm. Neither is 8k stacks. Nobody "proved" anything.

But yes, some subsystems have insanely deep call chains. And yes, things 
like the VFS recursion (for symlinks) makes that deeper yet for 
filesystems, although only on the lookup path. And that is exactly the 
kind of thing that can exacerbate the problem of the compiler artificially 
making for a bigger stack footprint of a function (*).

For things like the VFS layer, right now we allow a nesting level of 8, I 
think. If I remember correctly, it was 5 historically. Part of raising 
that depth, though, was that we actually moved the recursive part into 
fs/namei.c, and the nesting stack-depth was something pretty damn small 
when the filesystem used "follow_link" properly and let the VFS do it for 
it (ie the callchain to actually look up the link could be deep, but it 
would not recurse back, and instead just return a pointer, so that the 
actual _recursive_ part was just __do_follow_link() and is just a few 
words on the stack).

So yes, we do have some deep callchains, but they tend to be pretty well 
managed for _good_ code. The problems tend to be the areas with lots of 
indirection layers, and yeah, XFS, MD and ACPI all have those kinds of 
things.

In an embdedded world, many of those should be a non-issue, though. 

			Linus

(*) ie the function that _is_ on the deep chain doesn't actually need much 
of a stack footprint at all itself, but it may call a helper function that 
is _not_ in the deep chain, and if it gets inlined it may give its 
excessive stack footprint to the deep chain - and this is _exactly_ the 
problem that happened with inlining "load_module()".
