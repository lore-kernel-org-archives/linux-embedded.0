From: Daniel Walker <dwalker@mvista.com>
Subject: Re: [PATCH] [RFC] emit-crash-char: Allow diversion of printk
	output for crash logging
Date: Fri, 08 Aug 2008 13:10:25 -0700
Message-ID: <1218226225.19162.189.camel@localhost.localdomain>
References: <489BAD5C.2080009@cisco.com>
	 <1218210904.19162.144.camel@localhost.localdomain>
	 <8bd0f97a0808080905u1b515556gd68c2ba1d0b47cb4@mail.gmail.com>
	 <1218212266.19162.149.camel@localhost.localdomain>
	 <8bd0f97a0808081109q693f6f1at650a9be0547b7f9b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <8bd0f97a0808081109q693f6f1at650a9be0547b7f9b@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: dvomlehn@cisco.com, linux-embedded@vger.kernel.org

On Fri, 2008-08-08 at 14:09 -0400, Mike Frysinger wrote:

> you said "usually people submit new interfaces", not "it is usually
> not accepted without at least one user".

Well, usually people do submit the users, and if they don't it's usually
not accepted..

> > I invite you to give some of the "plenty of
> > examples in the tree", you might surprise me..
> 
> look at all the new syscalls added without any userspace code in place
> (still) to use it.  or Linus' recent printk modifier extension.  or my
> printk extensions for extracting portions of the kernel log buffer.
> people usually submit interfaces with backend extesions, or the intent
> to use it is obvious.

Syscalls and Userspace are unrelated .. You clearly can't add userspace
code to the kernel .. If you add a _kernel_ interface like David has
done you need at least one user of the interface.. Otherwise it's just
plain bloat inside the kernel which no one wants.

Your changes for extracting part of the kernel log buffer (commit
0b15d04af3dd996035d8fa81fc849d049171f9c3),

with:
   text    data     bss     dec     hex filename
4322000  386760 2592768 7301528  6f6998 vmlinux
without:
   text    data     bss     dec     hex filename
4321876  386760 2592768 7301404  6f691c vmlinux

Adds roughly 120bytes of bloat to my kernel, since 2007 .. What's the
point? I grepped for users , and there are none ..

Daniel
