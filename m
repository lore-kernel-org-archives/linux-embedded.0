From: Rob Landley <rob@landley.net>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Mon, 12 Jan 2009 11:45:28 -0600
Message-ID: <200901121145.29215.rob@landley.net>
References: <200901020207.30359.rob@landley.net> <31014a580901111936q41486efagcb90af2b6880a470@mail.gmail.com> <873afpj5e3.fsf@macbook.be.48ers.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <873afpj5e3.fsf@macbook.be.48ers.dk>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter Korsgaard <jacmet@sunsite.dk>
Cc: "Mark A. Miller" <mark@mirell.org>, Bernd Petrovitsch <bernd@firmix.at>, Leon Woestenberg <leon.woestenberg@gmail.com>, Paul Mundt <lethal@linux-sh.org>, "H. Peter Anvin" <hpa@zytor.com>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>

On Monday 12 January 2009 02:27:32 Peter Korsgaard wrote:
> >>>>> "Mark" == Mark A Miller <mark@mirell.org> writes:
>
>  Mark> And for H. Peter Anvin, before you refer to such uses as compiling
> the Mark> kernel under a native environment as a "piece of art", please be
> aware Mark> that the mainstream embedded development environment,
> buildroot, is Mark> also attempting to utilize QEMU for a "sanity check" on
> the Mark> environment.
>
> That's for verifying that the rootfs'es actually work, not for
> building stuff.

Not in my case.

Rob
