From: Paul Mundt <lethal-M7jkjyW5wf5g9hUCZPvPmw@public.gmane.org>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c - bisected
Date: Thu, 28 Aug 2008 10:02:26 +0900
Message-ID: <20080828010226.GB18893@linux-sh.org>
References: <20080827160052.GA15968@linux-sh.org> <20080827173544.GH11734@cs181140183.pp.htv.fi> <20080828003211.GA18893@linux-sh.org> <20080827.174605.85608276.davem@davemloft.net>
Mime-Version: 1.0
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20080827.174605.85608276.davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org, Alan.Brunelle-VXdhtT5mjnY@public.gmane.org, rjw-KKrjLPT3xs0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mingo-X9Un+BFzKDI@public.gmane.org, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Aug 27, 2008 at 05:46:05PM -0700, David Miller wrote:
> From: Paul Mundt <lethal-M7jkjyW5wf5g9hUCZPvPmw@public.gmane.org>
> Date: Thu, 28 Aug 2008 09:32:13 +0900
> 
> > On Wed, Aug 27, 2008 at 08:35:44PM +0300, Adrian Bunk wrote:
> > > CONFIG_DEBUG_STACKOVERFLOW should give you the same information, and if
> > > wanted with an arbitrary limit.
> >
> > In some cases, yes. In the CONFIG_DEBUG_STACKOVERFLOW case the check is
> > only performed from do_IRQ(), which is sporadic at best, especially on
> > tickless. While it catches some things, it's not a complete solution in
> > and of iteslf.
> 
> BTW, on sparc64 we have a stack overflow checker that runs via
> the profiling _mcount hook.  So every function call we check
> if the stack is getting overused.
> 
> If so, we jump onto a special static debugging stack and print
> the stack overflow message.
> 
> And yes it works with IRQ stacks which is all that sparc64 uses
> nowadays.
> 
> Perhaps this is useful enough to make generic.

Thanks for the pointer, I'll take a look at it!
