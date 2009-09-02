From: Marc Andre Tanner <mat@brain-dump.org>
Subject: Re: [PATCH 7/7] printk: provide a filtering macro for printk
Date: Wed, 2 Sep 2009 16:07:00 +0200
Message-ID: <20090902140227.GA2894@debbook.brain-dump.org>
References: <1251844269-12394-1-git-send-email-mat@brain-dump.org>
 <1251844269-12394-8-git-send-email-mat@brain-dump.org>
 <20090901233542.GA1321@shareable.org>
 <20090902090313.GB2736@debbook.brain-dump.org>
 <20090902110640.GA22602@shareable.org>
 <4A9E6447.1000705@billgatliff.com>
 <20090902124401.GA1835@debbook.brain-dump.org>
 <8bd0f97a0909020554j9ebdf54v813a6ec74c5c1e7c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8bd0f97a0909020554j9ebdf54v813a6ec74c5c1e7c@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
content-type: text/plain
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: Bill Gatliff <bgat@billgatliff.com>, Jamie Lokier <jamie@shareable.org>, linux-embedded@vger.kernel.org

On Wed, Sep 02, 2009 at 08:54:47AM -0400, Mike Frysinger wrote:
> On Wed, Sep 2, 2009 at 08:44, Marc Andre Tanner wrote:
> > On Wed, Sep 02, 2009 at 07:25:43AM -0500, Bill Gatliff wrote:
> >> Jamie Lokier wrote:
> >> >Looks good, except that I think kernel style is to use "do {...} =
while
> >> >(0)" rather than "({ ... })"
> >>
> >> And IIRC, there was some reason for the do{...} while(0) that made
> >> other alternatives not work. =A0So it might be more than just styl=
e at
> >> issue.
> >
> > Do you remember the reason? I found the oposite to be ture, I actua=
lly
> > started with the do { } while(0) construct but it failed in certain
> > situations so I wrapped it with ({ }) and then later removed
> > the now useless do { } while(0).
> >
> > By the way printk_once which is defined a few lines further down in
> > kernel.h also uses ({ }).
> >
> > Anyway the next version of my patch will no longer need it.
>=20
> it depends completely on how the macro is intended to be used.  if yo=
u
> want to maintain the "this macro has a return value", then you have t=
o
> use ({...}).  if you want the macro to return a void, then you have t=
o
> use do{...}while(0).

Ok, thanks for the clarification. This makes sense.

Marc

--=20
 Marc Andre Tanner >< http://www.brain-dump.org/ >< GPG key: CF7D56C0
