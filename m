From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c - bisected
Date: Wed, 27 Aug 2008 17:21:47 +0100
Message-ID: <20080827162147.GB25387@shareable.org>
References: <mzBsPw3QUOF.A.87F.wZGsIB@albercik> <48B313E0.1000501@hp.com> <alpine.LFD.1.10.0808251326500.3363@nehalem.linux-foundation.org> <200808261111.19205.rusty@rustcorp.com.au> <alpine.LFD.1.10.0808261019450.3363@nehalem.linux-foundation.org> <20080826183051.GB10925@cs181140183.pp.htv.fi> <alpine.LFD.1.10.0808261134530.3363@nehalem.linux-foundation.org> <20080826202134.GA11734@cs181140183.pp.htv.fi> <alpine.LFD.1.10.0808261332570.3363@nehalem.linux-foundation.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758671AbYH0QWZ@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.1.10.0808261332570.3363@nehalem.linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Adrian Bunk <bunk@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, "Alan D. Brunelle" <Alan.Brunelle@hp.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kernel Testers List <kernel-testers@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Arjan van de Ven <arjan@linux.intel.com>, Ingo Molnar <mingo@elte.hu>, linux-embedded@vger.kernel.org

Linus Torvalds wrote:
> > Most LOCs of the kernel are not written by people like you or Al Viro or 
> > David Miller, and the average kernel developer is unlikely to do it as 
> > good as gcc.
> 
> Sure. But we do have tools. We do have checkstack.pl, it's just that it 
> hasn't been an issue in a long time, so I suspect many people didn't even 
> _realize_ we have it, and I certainly can attest to the fact that even 
> people who remember it - like me - don't actually tend to run it all that 
> often.

Sounds like what's really desired here isn't more worry and
unpredictability, but for GCC+Binutils to gain the ability to
calculate the stack depth over all callchains (doesn't have to be
exact, just an upper bound; annotate recursions) in a way that's good
enough to do on every compile, complain if a depth is exceeded
statically (or it can't be proven), and to gain the
architecture-independent option "optimise to reduce stack usage".

> > BTW:
> > I just ran checkstack on a (roughly) allyesconfig kernel, and we have a 
> > new driver that allocates "unsigned char recvbuf[1500];" on the stack...
> 
> Yeah, it's _way_ too easy to do bad things.

In my userspace code, I have macros tmp_alloc and tmp_free.  They must
be matched in the same function:

     unsigned char * recvbuf = tmp_alloc(1500);
     ....
     tmp_free(recvbuf);

When stack is plentiful, it maps to alloca() which is roughly
equivalent to using a stack variable.

When stack is constrained (as it is on my little devices), that maps
to xmalloc/free.  The kernel equivalent would be kmalloc GFP_ATOMIC
(perhaps).

With different macros to mine, it may be possible to map small
fixed-size requests exactly onto local variables, and large ones to
kmalloc().  A stab at it (not tested):

    #define LOCAL_ALLOC_THRESHOLD     128

    #define LOCAL_ALLOC(type, ptr)                                        \
        __typeof__(type) __attribute__((__unused__)) ptr##_local_struct;  \
        __typeof__(type) * ptr =                                          \
              ((__builtin_constant_p(sizeof(type))                        \
                && sizeof(type) <= LOCAL_ALLOC_THRESHOLD)                 \
               ? &ptr##_local_struct : kmalloc(sizeof(type), GFP_ATOMIC))

    #define LOCAL_FREE(ptr)                           \
        ((__builtin_constant_p(sizeof (*(ptr)))       \
          && sizeof(*(ptr)) <= LOCAL_ALLOC_THRESHOLD) \
         ? (void) 0 : kfree(ptr))

Would that be useful in the kernel?

I'm thinking if it were a commonly used pattern for temporary buffers,
unknown structures and arrays of macro-determined size, the "new
driver" author would be less likely to accidentally drop a big object
on the stack.

Obviously it would be nicer for GCC to code such a thing
automatically, but that really is wishful thinking.

-- Jamie
