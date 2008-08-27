From: Paul Mundt <lethal-M7jkjyW5wf5g9hUCZPvPmw@public.gmane.org>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c - bisected
Date: Thu, 28 Aug 2008 01:00:52 +0900
Message-ID: <20080827160052.GA15968@linux-sh.org>
References: <alpine.LFD.1.10.0808261019450.3363@nehalem.linux-foundation.org> <20080826183051.GB10925@cs181140183.pp.htv.fi> <alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org> <20080826205916.GB11734@cs181140183.pp.htv.fi> <alpine.LFD.1.10.0808261403360.3363@nehalem.linux-foundation.org> <20080826232411.GC11734@cs181140183.pp.htv.fi> <alpine.LFD.1.10.0808261648140.3363@nehalem.linux-foundation.org> <20080827002316.GE11734@cs181140183.pp.htv.fi> <alpine.LFD.1.10.0808261726560.3363@nehalem.linux-foundation.org> <20080827115829.GF11734@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20080827115829.GF11734-re2QNgSbS3j4D6uPqz5PAwR5/fbUUdgG@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, "Alan D. Brunelle" <Alan.Brunelle-VXdhtT5mjnY@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kernel Testers List <kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arjan van de Ven <arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Aug 27, 2008 at 02:58:30PM +0300, Adrian Bunk wrote:
> On Tue, Aug 26, 2008 at 05:28:37PM -0700, Linus Torvalds wrote:
> > On Wed, 27 Aug 2008, Adrian Bunk wrote:
> > > 
> > > When did we get callpaths like like nfs+xfs+md+scsi reliably 
> > > working with 4kB stacks on x86-32?
> > 
> > XFS may never have been usable, but the rest, sure.
> > 
> > And you seem to be making this whole argument an excuse to SUCK, adn an 
> > excuse to let gcc crap even more on our stack space.
> > 
> > Why?
> > 
> > Why aren't you saying that we should be able to do better? Instead, you 
> > seem to asking us to do even worse than we do now?
> 
> My main point is:
> - getting 4kB stacks working reliably is a hard task
> - having an eye on gcc increasing the stack usage, and fixing it if
>   required, is relatively easy
> 
> If we should be able to do better at getting (and keeping) 4kB stacks 
> working, then coping with possible inlining problems caused by gcc
> should not be a big problem for us.
> 
Out of the architectures you've mentioned for 4k stacks, they also tend
to do IRQ stacks, which is something you seem to have overlooked.

In addition to that, debugging the runaway stack users on 4k tends to be
easier anyways since you end up blowing the stack a lot sooner. On sh
we've had pretty good luck with it, though most of our users are using
fairly deterministic workloads and continually profiling the footprint.
Anything that runs away or uses an insane amount of stack space needs to
be fixed well before that anyways, so catching it sooner is always
preferable. I imagine the same case is true for m68knommu (even sans IRQ
stacks).

Things might be more sensitive on x86, but it's certainly not something
that's a huge problem for the various embedded platforms to wire up,
whether they want to go the IRQ stack route or not.

In any event, lack of support for something on embedded architectures in
the kernel is more often due to apathy/utter indifference on the part of
the architecture maintainer rather than being indicative of any intrinsic
difficulty in supporting the thing in question. Most new "features" on the
lesser maintained architectures tend to end up there either out of peer
pressure or copying-and-pasting accidents rather than any sort of design.
;-)
