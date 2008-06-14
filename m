From: Jamie Lokier <jamie@shareable.org>
Subject: Re: Cross Compiler and loads of issues
Date: Sat, 14 Jun 2008 02:46:36 +0100
Message-ID: <20080614014636.GA32232@shareable.org>
References: <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com> <20080613092449.GO27937@knossos.aleph1.co.uk> <7b740b700806130500u17bf3adel3b2139e50d7b029f@mail.gmail.com> <0af6abe442d0b93a10a96b27153f04e9.squirrel@www.geekisp.com> <20080613144658.GA21071@shareable.org> <20080613151942.GK11760@nibiru.local>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080613151942.GK11760@nibiru.local>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Enrico Weigelt <weigelt@metux.de>
Cc: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

Enrico Weigelt wrote:
> > Contrast with kernel.org: everyone knows where to get a good working
> > Linux kernel for the mainstream architectures, and the quality work
> > tends to be quite good at reaching mainline there nowadays.
> 
> ACK. But you perhaps remember the discussions on LKML where some
> folks wanted to stop this and leave all the QM works to individual
> distros. I'm glad this plan was dropped.

I'm glad too.  I've had to do the reverse: cherry-pick through 2000
patches from distro kernel source packages, to find the good ones for
my kernel - bug fixes, driver fixes.  It took a long time, and I had
to give up before finishing, it was simply too much work.

That was 2.4, back when distros did a lot of their own patches, kept
outside the mainline kernel.  Thankfully, the 2.6 process is much better.

-- Jamie
