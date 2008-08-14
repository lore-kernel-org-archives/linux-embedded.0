From: Fundu <fundu_1999@yahoo.com>
Subject: Flatten device tree & PPC linux
Date: Wed, 13 Aug 2008 22:44:25 -0700 (PDT)
Message-ID: <260388.87819.qm@web63408.mail.re1.yahoo.com>
References: <1218656903.10489.50.camel@localhost.localdomain>
Reply-To: fundu_1999@yahoo.com
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1218656903.10489.50.camel@localhost.localdomain>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

i was reading this ...
http://free-electrons.com/kerneldoc/latest/powerpc/booting-without-of.txt
and was wondering if the kernel 2.4(yes 2.4) expects a flatten device tree ?

Anybody any ideas ? 
TIA !


--- On Wed, 8/13/08, Josh Boyer <jwboyer@gmail.com> wrote:

> From: Josh Boyer <jwboyer@gmail.com>
> Subject: kernel dump solutions
> To: linux-embedded@vger.kernel.org
> Date: Wednesday, August 13, 2008, 12:48 PM
> Hi All,
> 
> I'm curious what people are using for a kernel dump
> solution on embedded
> platforms.  It seems that kexec/kdump is the default
> solution for
> desktop and server machines, but this seems to be a bit
> heavy for
> embedded platforms.  Requiring a second kernel to do the
> dump seems like
> a cost that most platform designers wouldn't be willing
> to incur.
> 
> The only other alternative that I'm aware of is LKCD. 
> It doesn't seem
> particularly active at all these days.  Mcore has been
> sufficiently dead
> for years.  So what's left?  What else are people
> using?
> 
> josh
> 
> --
> To unsubscribe from this list: send the line
> "unsubscribe linux-embedded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html


      
