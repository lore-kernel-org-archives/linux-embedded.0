From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PWM 01/10] API to consolidate PWM devices behind a common user
 and kernel interface
Date: Sat, 16 Oct 2010 00:05:47 -0600
Message-ID: <AANLkTimWFBUVuZJTw9R=x8u1AnPEMOWXK1yPEUXLf6Lg@mail.gmail.com>
References: <1285946271-17728-1-git-send-email-bgat@billgatliff.com>
 <AANLkTi=6GN=cwA5vuv4fNDt0=xPT3+g2vntzZdN_gDrw@mail.gmail.com> <AANLkTim2tbWNviJottUg3jAD2ybd5oUPJu3vdPvNa_fX@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <AANLkTim2tbWNviJottUg3jAD2ybd5oUPJu3vdPvNa_fX@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: Hector Oron <hector.oron@gmail.com>, linux-embedded@vger.kernel.org

On Wed, Oct 6, 2010 at 12:48 PM, Bill Gatliff <bgat@billgatliff.com> wr=
ote:
> Hector:
>
> On Sat, Oct 2, 2010 at 7:25 AM, Hector Oron <hector.oron@gmail.com> w=
rote:
>> Hello Bill,
>>
>> Thanks for trying (again) to get this in mainline.
>> Are you planning to request a slot in the GIT at kernel.org to hold
>> and maintain this nice framework?
>
> I did make such a request once, and it went nowhere. =A0:(

Git trees don't have to be hosted on git.kernel.org.  None of my trees
are on kernel.org, and Linus pulls from me all the time.  You can host
your own git server, or use a git hosting provider.

But, if you're serious about getting it mainlined, then you need to
post the whole series to linux-kernel.  Also, without a specific
maintainer to pick it up for you, it helps to cc: Andrew Morton.  I
recommend doing so sooner rather than later.  It probably won't make
2.6.37 since the merge window is opening in about a week, but it would
be a good candidate for .38.  I'll go through all the patches right
now and make my comments.

g.
