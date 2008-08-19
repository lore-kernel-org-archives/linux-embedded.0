From: Fundu <fundu_1999@yahoo.com>
Subject: Re: Module init for compiled in vs loaded modules
Date: Tue, 19 Aug 2008 10:26:10 -0700 (PDT)
Message-ID: <487558.67644.qm@web63404.mail.re1.yahoo.com>
Reply-To: fundu_1999@yahoo.com
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux embedded <linux-embedded@vger.kernel.org>
Cc: Amol Lad <amol.lad@gmail.com>

> linux/init.h:
> 
> #ifndef MODULE
> ...
> #define module_init(x)  __initcall(x);
> #define __initcall(fn) device_initcall(fn)
> #define device_initcall(fn)    
> __define_initcall("6",fn)
> #define __define_initcall(level,fn) \
>     static initcall_t __initcall_##fn __attribute_used__
> \
>     __attribute__((__section__(".initcall" level
> ".init"))) = fn
> ...
> #endif
> 
> initcalls are processed in do_initcalls function in
> init/main.c
> 
> static void __init do_basic_setup(void)
> {
>     ....
>     do_initcalls();
> }
> 
> >
> > thanks !
> 
> Amol
thanks Rajat and Amol. 

One other question,
1) how does the kernel know which module to load first in order to satisfy dependencies issues ?
2) is there a way i could print the module init fn name from do_initcalls. to see in what order compiled in modules are called.

tia. 


      
