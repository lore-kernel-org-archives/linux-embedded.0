From: Rob Landley <rob@landley.net>
Subject: Re: PATCH [1/3]: Replace kernel/timeconst.pl with kernel/timeconst.sh (v2)
Date: Sun, 4 Jan 2009 14:21:13 -0600
Message-ID: <200901041421.13920.rob@landley.net>
References: <200901020207.30359.rob@landley.net> <200901031927.07670.rob@landley.net> <49602375.6020409@csr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <49602375.6020409@csr.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Vrabel <david.vrabel@csr.com>
Cc: Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

On Saturday 03 January 2009 20:48:21 David Vrabel wrote:
> Rob Landley wrote:
> > From: Rob Landley <rob@landley.net>
> >
> > Replace kernel/timeconst.pl with kernel/timeconst.sh.  The new shell
> > script is much simpler, about 1/4 the size, and runs on Red Hat 9 from
> > 2003.
> >
> > It requires a shell which can do 64 bit math, such as bash, busybox ash,
> > or dash running on a 64 bit host.
>
> I use Ubuntu (hence dash) on 32 bit systems so I think this needs to
> work with dash on 32 bit hosts.

I have a qemu/images directory full of various OS images for testing purposes.

I just fired up my jeos 7.10 image to make sure that even the most stripped-
down version of Ubuntu ("just enough operating system) still installs bash by 
default, and it does.  (It doesn't install a development toolchain, but it 
does install bash.)

I also installed a 32 bit xubuntu 8.10 image (which took 4 hours for some 
reason, and which also has bash), and explicitly tested its 32-bit 
"/bin/dash", and that did 64-bit math too.  So current versions of dash do 
offer 64 bit math on 32 bit platforms.

> David

Rob
