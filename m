From: Nick Piggin <nickpiggin@yahoo.com.au>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Fri, 22 Aug 2008 12:04:57 +1000
Message-ID: <200808221204.57413.nickpiggin@yahoo.com.au>
References: <48AD00C4.6060302@gmail.com> <ac9c93b10808202332n2654884eh877848df2da59f20@mail.gmail.com> <6934efce0808211232i21fcf347vb6baa6502246adb2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753061AbYHVCFW@vger.kernel.org>
In-Reply-To: <6934efce0808211232i21fcf347vb6baa6502246adb2@mail.gmail.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jared Hulbert <jaredeh@gmail.com>
Cc: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?utf-8?q?J=C3=B6rn?= Engel <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com

On Friday 22 August 2008 05:32, Jared Hulbert wrote:
> > Jared, nice work!

> > - would axfs be suitable as a filesystem on a ram disk?
>
> It could be.  I plan on implementing support for brd.  That might work
> nicely.

I was going to take a look at this too. With any luck, it should be
little effort required as it looks like you have the block device
support in place?

This filesystem actually should in theory work fairly well with brd,
because then we wouldn't have to bring the data over into pagecache
for frequently used pages but we can retain the compressed storage
for the infrequently used stuff.

I say in theory because I don't know of any serious users (except
kernel testing) of brd :)
