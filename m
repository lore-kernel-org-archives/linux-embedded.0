From: Pekka Enberg <penberg@kernel.org>
Subject: Re: RFC: [Restatement] KBUS messaging subsystem
Date: Wed, 3 Aug 2011 23:48:26 +0300
Message-ID: <CAOJsxLFSdPO2ebjM9W9JaNcX80COzn=Y3hFukXZjn+1yY4ivZQ@mail.gmail.com>
References: <cover.1300450604.git.tibs@tonyibbs.co.uk>
	<201105171050.38903.florian@openwrt.org>
	<37F5AF18-99E5-4516-B31F-00F7BD348ADE@tonyibbs.co.uk>
	<201107061815.36294.florian@openwrt.org>
	<5F531701-B760-45F0-989D-669013409FE8@tonyibbs.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=gR3+4pY3iKcqRwGBy1gRpoqnrq+mwHK3JcQXnbbPkXY=;
        b=BL9FQOwPkJsv3XaDXXQZ828eXZxILlO9PeH+Q7GXCixcMTiMN7w0Ly0KqByMyxjWFu
         zzyNOCr0Sz13jUJrVYY4F3cxeS6BWR3G/N+HxOkZVizVp6PQIrdes35NukUBZKdposgn
         aoDb3kgu90Aqiw5cWMisJ6U8dXVxQ4Z8EFVEg=
In-Reply-To: <5F531701-B760-45F0-989D-669013409FE8@tonyibbs.co.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tony Ibbs <tibs@tonyibbs.co.uk>
Cc: lkml <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, Florian Fainelli <florian@openwrt.org>, Grant Likely <grant.likely@secretlab.ca>, Linux-embedded <linux-embedded@vger.kernel.org>, Tibs at Kynesim <tibs@kynesim.co.uk>, Richard Watts <rrw@kynesim.co.uk>

Hi Tony,

Your description doesn't really explain what you want to use this
thing exactly for in userspace.

On Fri, Jul 29, 2011 at 12:48 AM, Tony Ibbs <tibs@tonyibbs.co.uk> wrote=
:
> So why did we write it as a kernel module?
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> As implementors, a kernel module makes a lot of sense. Not least
> because:
>
> * It gives us a lot of things for free, including list handling,
> =A0reference counting, thread safety and (on larger systems)
> =A0multi-processor support, which we would otherwise have to write an=
d
> =A0debug ourselves. This also keeps our codebase smaller.

That's not a reason to put this into the kernel, really.

> * It helps give us reliability, partly because of the code we're
> =A0relying on, partly because of the strictures of working in the
> =A0kernel, partly by shielding us from userspace.

So now instead of crashing in userspace, we crash the kernel? This
seems like a bogus argument as well.

> * It reduces message copying (we have userspace to kernel back to
> =A0userspace, as opposed to a userspace daemon communicating with
> =A0clients via sockets)

Now this sounds like a real reason but you'd have to explain why you
can't reuse existing zero-copy mechanisms like splice() and tee().

> * It makes it simple for us to tell when a message recipient has "gon=
e
> =A0away", as the kernel will call our "release" callback for us.

Again, sounds like a reasonable technical requirement but doesn't
really justify putting all this code into the kernel.

> * It allows us to provide the functionality on systems without
> =A0requiring anything much beyond /dev and maybe /proc in userspace.

Why is this important?

                                Pekka
