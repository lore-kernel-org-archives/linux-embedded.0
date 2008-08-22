From: Nick Piggin <nickpiggin@yahoo.com.au>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Fri, 22 Aug 2008 12:32:41 +1000
Message-ID: <200808221232.42115.nickpiggin@yahoo.com.au>
References: <48AD00C4.6060302@gmail.com> <200808212043.51209.nickpiggin@yahoo.com.au> <6934efce0808210713m220d2a6cje06a2dc51c4a857a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <6934efce0808210713m220d2a6cje06a2dc51c4a857a@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jared Hulbert <jaredeh@gmail.com>
Cc: carsteno@de.ibm.com, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?utf-8?q?J=C3=B6rn?= Engel <joern@logfs.org>, tim.bird@am.sony.com

On Friday 22 August 2008 00:13, Jared Hulbert wrote:
> > Agreed. I haven't had a good look through it yet, but at a glance it
> > looks pretty neat. The VM side of things looks pretty reasonable
> > (I fear XIP faulting might have another race or two, but that's a
> > core mm issue rather than filesystem specific).
>
> How might I design a test to flush those bugs out?  We haven't seen any.

Not quite sure yet. I just fixed a couple of easy ones, but there
could be some more lurking. Don't be too worried about it yet, I
was just musing to myself there really :)
