From: "Linus Walleij" <linus.ml.walleij@gmail.com>
Subject: Re: modules.dep and depmod.pl
Date: Sat, 14 Jun 2008 21:38:56 +0200
Message-ID: <63386a3d0806141238g1a0c5ef3oada7ae67461fb8d6@mail.gmail.com>
References: <63386a3d0806131611g61ad6ab1t16bc68ab6407a8dc@mail.gmail.com>
	 <63386a3d0806131633g4721216al566c8b6959e4631@mail.gmail.com>
	 <loom.20080614T092033-823@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=QC5YYPDAPLR9nqud0yiSHl/b+aGSrSQV4RwfrSvsC+M=;
        b=fyLjYsjL6xevnOUmircpyjXxMVNi6frFiJHcgx8Nrdf06G7AO5bmrWPbaHunz7dDik
         GBS9gE0jlaUBpezyFcxAcCJQvcksSb4ymdVqU8ZfT692Qk+yfryllbRlN6rxLy3gQcOz
         c4U2PJJDh1xn+idQoe6ntizdVuLjE/4AYb4kg=
In-Reply-To: <loom.20080614T092033-823@post.gmane.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

2008/6/14 Matthieu castet <castet.matthieu@free.fr>:

> What's wrong with using your host depmod to build it.
> When I build a crosscompilation kernel, and I do make module_install,
> modules.dep are generated.

Well I do believe that works for you because you're lucky to
have a host with a recent kernel and module-init-tools.

However I believe that creates an unsound relation between the
host depmod and any cross compilation.

Currently I try to cross-compile a 2.6.25 kernel on an old good
workhorse with a 2.4.x kernel & likewise antique depmod. It
just won't work.

I tried to cross-compile all module-init-tools with --build=i386,
--host=i386, --target=arm-linux,
but that still fails: it checks what version of the kernel it's working
on, and determines that since that is a 2.4.x version it needs
to execute depmod.old instead :-P (Perhaps this is bug?)

I'd _really_ prefer cross-compilation to use the cross compiler
and in-kernel tools only, and currently I think it is actually
only depmod that deviates from that. (OK some scripts may
need a recent version of perl or so, that was just discussed in
another thread.)

Do you think an attempt to patch busybox:s depmod.pl into
scripts/ for the benefit of cross-compilation would be frowned
upon?

Linus Walleij
