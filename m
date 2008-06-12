From: "George G. Davis" <gdavis@mvista.com>
Subject: Re: Cross Compiler and loads of issues
Date: Thu, 12 Jun 2008 15:54:54 -0400
Message-ID: <20080612195454.GE2735@mvista.com>
References: <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com> <402b1f4b315f572ac6459f78fa8b5ee4.squirrel@www.geekisp.com> <20080612184927.GA8363@nibiru.local> <7b740b700806121202w73c7f442k1bf8625e375b83df@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7b740b700806121202w73c7f442k1bf8625e375b83df@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shaz <shazalive@gmail.com>
Cc: weigelt@metux.de, Linux Embedded Maillist <linux-embedded@vger.kernel.org>

On Fri, Jun 13, 2008 at 12:02:06AM +0500, Shaz wrote:
> On Thu, Jun 12, 2008 at 11:49 PM, Enrico Weigelt <weigelt@metux.de> wrote:
> > * Bill Traynor <wmat@naoi.ca> schrieb:
> >
> >> There is no "one good way".  I've had decent success building Dan Kegel's
> >> "crosstool" in the past: http://www.kegel.com/crosstool/
> >
> > I'd also like to mention Yann's crosstool-ng :)
> I guess I have to reconsider cross-tool because earlier I visited this
> http://www.kegel.com/crosstool/crosstool-0.43/buildlogs/ and I want to
> get the latest kernel up and running on OSK OMAP5912, arm9. The board
> is in process of shipment but I started out with a qemu
> (arm-generic/versatilepb) based test run.
> 
> I am in the middle of a confused experience :-)

I've used this to build cross compilers (which worked ok for me : ):

http://code.google.com/p/jicknan/source/browse/trunk/bin/toolchain-eglibc.sh

As usual, YMMV, good luck, HTH!

--
Regards,
George
