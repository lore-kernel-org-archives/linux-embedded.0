From: "Amol Lad" <amol.lad@gmail.com>
Subject: Re: Module init for compiled in vs loaded modules
Date: Tue, 19 Aug 2008 09:59:12 +0530
Message-ID: <8c675e9b0808182129q320a0d5as487c5034e3fa67c6@mail.gmail.com>
References: <fa686aa40808180900q730b921an64483d985793b33b@mail.gmail.com>
	 <970019.41811.qm@web63401.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=RD3mgwzVc/VchPgF1IdF0hgIo7WlzluW5hwbcVOg8I8=;
        b=OQaycn2simjl8/OKGFMW1nNwlFQveJFxT9AvrayngI3JKf1iDqQ8TbZD0/AVKpoa09
         tMYiTY8npRH++j8QTSlEvxC6J4Y6YE04ct3G+7BNoLmk2V+gnwZdRBttdDWBn9JVtZu5
         IBGyfpP/9UvpldvDGrko2bofK0JEyZGozCHgU=
In-Reply-To: <970019.41811.qm@web63401.mail.re1.yahoo.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fundu_1999@yahoo.com
Cc: linux-embedded@vger.kernel.org

Code base of 2.6.18

>
> 1) But where do i look to find how the kernel loads(ie. calls the fn exported by module_init(XXXX)) for modules compiled into the kernel.

linux/init.h:

#ifndef MODULE
...
#define module_init(x)  __initcall(x);
#define __initcall(fn) device_initcall(fn)
#define device_initcall(fn)     __define_initcall("6",fn)
#define __define_initcall(level,fn) \
    static initcall_t __initcall_##fn __attribute_used__ \
    __attribute__((__section__(".initcall" level ".init"))) = fn
...
#endif


So as you can see call to module_init is actually an initcall.

initcalls are processed in do_initcalls function in init/main.c

static void __init do_basic_setup(void)
{
    ....
    do_initcalls();
}

>
> thanks !

Amol

>
>
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
