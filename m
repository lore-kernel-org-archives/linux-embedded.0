From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: UIO - interrupt performance
Date: Tue, 21 Oct 2008 06:39:58 -0500
Message-ID: <48FDBF8E.3060700@billgatliff.com>
References: <5958B8D7916AB84781FE0E7B57C218CB75AB98@306900ANEX2.global.avaya.com>	 <48FC71BD.9070703@coritel.it> <48FCAE16.70509@billgatliff.com>	 <48FD94AA.8070900@coritel.it>	 <63a49ef40810210201x36249476tcc75141d87a610f2@mail.gmail.com>	 <48FDA13F.3030303@coritel.it> <1224581853.3954.127.camel@moss.renham> <48FDAEE1.9080503@grandegger.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48FDAEE1.9080503@grandegger.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Wolfgang Grandegger <wg@grandegger.com>
Cc: Ben Nizette <bn@niasdigital.com>, Marco Stornelli <marco.stornelli@coritel.it>, Alessio Igor Bogani <abogani@texware.it>, "Douglas, Jim (Jim)" <jdouglas@avaya.com>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>

Wolfgang Grandegger wrote:
> Ben Nizette wrote:
>> On Tue, 2008-10-21 at 11:30 +0200, Marco Stornelli wrote:
>>> I could agree, but "the facto" due to UIO license condition, a company
>>> often uses UIO drivers, regardless performance, debug, etc, only as not
>>> to public the code under GPL.
>> It sounds to me like you think that driver authors can sit down and
>> decide whether they want to implement their driver in userspace or
>> kernel space.  For 99% of drivers that's simply not true.  You  *cannot*
>> write userspace drivers for most hardware, the hooks just aren't
>> available.  UIO is Userspace I/O, not a set of general hooks for
>> userspace drivers.
> 
> I known, fortunately it's not that simple or even feasible. Image a
> network driver with I/O multiplexing used by various processes.

Actually, UIO is pretty useful for that when combined with tun/tap.

> That's *not* an option, please read the GPL license conditions. At least
> it's legal gray area. Note that it's not my intention to start a
> discussion on that.

Then I will only contradict you, and not cite my supporting evidence.  :)


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
