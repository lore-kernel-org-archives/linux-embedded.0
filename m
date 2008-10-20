From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: UIO - interrupt performance
Date: Mon, 20 Oct 2008 11:13:10 -0500
Message-ID: <48FCAE16.70509@billgatliff.com>
References: <5958B8D7916AB84781FE0E7B57C218CB75AB98@306900ANEX2.global.avaya.com> <48FC71BD.9070703@coritel.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48FC71BD.9070703@coritel.it>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marco Stornelli <marco.stornelli@coritel.it>
Cc: "Douglas, Jim (Jim)" <jdouglas@avaya.com>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>

Marco Stornelli wrote:
> I quite agree with Ben and Christian. I think UIO drivers are usable for
> simple devices, I think they aren't mature (will it ever be?) to use it
> with complicated devices or with strict requirement.

I disagree.  Completely.

I recall seeing a report from the Gelato project, where they reimplemented an
IDE driver under UIO.  IIRC, their test results showed at least 80% of the
in-kernel performance--- and this was a very early UIO implementation, I would
guess that things are much improved since then.  I know that IDE isn't a USBH,
but it isn't a GPIO LED, either.  :)

If you are concerned about timeliness of execution, then if you have never heard
of POSIX.1b then you shouldn't be writing Linux code anyway.  But if you do use
the features that POSIX.1b gives you, then I haven't found UIO to be objectionable.

From a performance standpoint, the major differences between UIO vs. in-kernel
are (a) a _possible_ additional context switch at each interrupt, to transfer
control back to the userspace responder, and (b) the elimination of a syscall to
push data through an in-kernel interface back to the device.  Only your own
testing with your own hardware and application can tell you if that's a net
improvement or regression and where--- if anywhere--- you take the hit.

The general upsides with UIO are huge: you can debug your driver with gdb, and
you can bind your driver tightly to your application if it makes sense to do so.
 Every i/o action is potentially zero-copy straight into the correct data
structures, for example.  For some workloads, that puts UIO way ahead of an
in-kernel driver without the complexity of mmap().

As an aside, if you really need an interface that resembles a device node then
you can emulate that in userspace with a FIFO.  That lets you put the driver in
a standalone program if you like, and other user applications can't tell the
difference between that and a true device node.  (They can figure it out if they
need to, but if they just are using open/close/read/write then they don't care).

The social downside to UIO is that you'll never get your driver(s) mainlined,
since Linux-the-kernel doesn't run in userspace.  :)

Put simply, you can't dismiss UIO lightly unless you haven't worked with or
reviewed the code behind it.



b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
