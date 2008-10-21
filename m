From: Marco Stornelli <marco.stornelli@coritel.it>
Subject: Re: UIO - interrupt performance
Date: Tue, 21 Oct 2008 10:36:58 +0200
Message-ID: <48FD94AA.8070900@coritel.it>
References: <5958B8D7916AB84781FE0E7B57C218CB75AB98@306900ANEX2.global.avaya.com> <48FC71BD.9070703@coritel.it> <48FCAE16.70509@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48FCAE16.70509@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: "Douglas, Jim (Jim)" <jdouglas@avaya.com>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>

As I said I think UIO drivers are a "young feature" from kernel point of
view but I haven't problems to use it. Jim, however, was talking about
to do a complete porting of drivers. I don't know if it'd be a good
idea. UIO drivers, however, has been inserted mainly for one reason: the
problem with GPL, so I prefer, but it's only my opinion, at least for
now, to write a "classic" driver if there aren't GPL problems.

Bill Gatliff ha scritto:
> Marco Stornelli wrote:
>> I quite agree with Ben and Christian. I think UIO drivers are usable for
>> simple devices, I think they aren't mature (will it ever be?) to use it
>> with complicated devices or with strict requirement.
> 
> I disagree.  Completely.
> 
> I recall seeing a report from the Gelato project, where they reimplemented an
> IDE driver under UIO.  IIRC, their test results showed at least 80% of the
> in-kernel performance--- and this was a very early UIO implementation, I would
> guess that things are much improved since then.  I know that IDE isn't a USBH,
> but it isn't a GPIO LED, either.  :)
> 
> If you are concerned about timeliness of execution, then if you have never heard
> of POSIX.1b then you shouldn't be writing Linux code anyway.  But if you do use
> the features that POSIX.1b gives you, then I haven't found UIO to be objectionable.
> 
>>From a performance standpoint, the major differences between UIO vs. in-kernel
> are (a) a _possible_ additional context switch at each interrupt, to transfer
> control back to the userspace responder, and (b) the elimination of a syscall to
> push data through an in-kernel interface back to the device.  Only your own
> testing with your own hardware and application can tell you if that's a net
> improvement or regression and where--- if anywhere--- you take the hit.
> 
> The general upsides with UIO are huge: you can debug your driver with gdb, and
> you can bind your driver tightly to your application if it makes sense to do so.
>  Every i/o action is potentially zero-copy straight into the correct data
> structures, for example.  For some workloads, that puts UIO way ahead of an
> in-kernel driver without the complexity of mmap().
> 
> As an aside, if you really need an interface that resembles a device node then
> you can emulate that in userspace with a FIFO.  That lets you put the driver in
> a standalone program if you like, and other user applications can't tell the
> difference between that and a true device node.  (They can figure it out if they
> need to, but if they just are using open/close/read/write then they don't care).
> 
> The social downside to UIO is that you'll never get your driver(s) mainlined,
> since Linux-the-kernel doesn't run in userspace.  :)
> 
> Put simply, you can't dismiss UIO lightly unless you haven't worked with or
> reviewed the code behind it.
> 
> 
> 
> b.g.

-- 
Marco Stornelli
Embedded Software Engineer
CoRiTeL - Consorzio di Ricerca sulle Telecomunicazioni
http://www.coritel.it

marco.stornelli@coritel.it
+39 06 72582838
