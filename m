From: Ben Nizette <bn@niasdigital.com>
Subject: Re: UIO - interrupt performance
Date: Tue, 21 Oct 2008 20:37:33 +1100
Message-ID: <1224581853.3954.127.camel@moss.renham>
References: <5958B8D7916AB84781FE0E7B57C218CB75AB98@306900ANEX2.global.avaya.com>
	 <48FC71BD.9070703@coritel.it> <48FCAE16.70509@billgatliff.com>
	 <48FD94AA.8070900@coritel.it>
	 <63a49ef40810210201x36249476tcc75141d87a610f2@mail.gmail.com>
	 <48FDA13F.3030303@coritel.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48FDA13F.3030303@coritel.it>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marco Stornelli <marco.stornelli@coritel.it>
Cc: Alessio Igor Bogani <abogani@texware.it>, Bill Gatliff <bgat@billgatliff.com>, "Douglas, Jim (Jim)" <jdouglas@avaya.com>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>


On Tue, 2008-10-21 at 11:30 +0200, Marco Stornelli wrote:
> I could agree, but "the facto" due to UIO license condition, a company
> often uses UIO drivers, regardless performance, debug, etc, only as not
> to public the code under GPL.

It sounds to me like you think that driver authors can sit down and
decide whether they want to implement their driver in userspace or
kernel space.  For 99% of drivers that's simply not true.  You  *cannot*
write userspace drivers for most hardware, the hooks just aren't
available.  UIO is Userspace I/O, not a set of general hooks for
userspace drivers.

If people want drivers not under the GPL then they can distribute a
binary-only module (though thank $DEITY there aren't many of those
left).  Userspace I/O exists to provide good performance interfacing to
a family of devices - those which exist just to shuffle data around and
have an interrupt to tell you when they're done.

Do you have any example of a userspace i/o driver which exists to get
around licencing constraints?

	--Ben.
