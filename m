From: Tim Bird <tim.bird@am.sony.com>
Subject: module boot time (was Re: [PATCH] module: Use binary search in lookup_symbol())
Date: Wed, 18 May 2011 14:10:15 -0700
Message-ID: <4DD435B7.9090702@am.sony.com>
References: <BANLkTinPG100vbVAN1RZWb3h9Xuu6SKJ0Q@mail.gmail.com> <1305665763-3988-1-git-send-email-abogani@kernel.org> <20110517232241.GA19140@kroah.com> <4DD305B3.3000707@am.sony.com> <20110518075428.GA29998@infradead.org> <4DD3FB1C.3040103@am.sony.com> <20110518192110.GB26945@kroah.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110518192110.GB26945@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg KH <greg@kroah.com>
Cc: Christoph Hellwig <hch@infradead.org>, Alessio Igor Bogani <abogani@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Anders Kaseorg <andersk@ksplice.com>, Tim Abbott <tabbott@ksplice.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>, Dirk Behme <dirk.behme@googlemail.com>

On 05/18/2011 12:21 PM, Greg KH wrote:
> On Wed, May 18, 2011 at 10:00:12AM -0700, Tim Bird wrote:
>> Carmelo Amoroso reported some good performance gains
>> in this presentation:
>> http://elinux.org/images/1/18/C_AMOROSO_Fast_lkm_loader_ELC-E_2009.pdf
>> (See slide 22).
>>
>> He doesn't report the overall time savings, and
>> he was using a different method (hash tables as opposed to
>> binary search), but I believe the results are comparable
>> to what the binary search enhancement provides.
>>
>> The biggest offenders in his testing were usbcore,
>> ehci_hcd and ohci_hcd.
> 
> Why those?  The size of them, or something else?  They don't seem to
> have very many symbols they need to look up compared to anything else
> that I can tell.
> 
> Is something else going on here due to the serialization of the USB
> drivers themselves?

I don't think there's anything wrong with these, compared to
other kernel modules.  I just think they stood out (probably
because of size) from the other modules in the small set that
Carmelo tested.  In his tests, usbcore was the largest module
by an order of magnitude.

>>> And why do people overly care for the load time?
>>
>> To reduce overall boot time.
> 
> To reduce it even more, build the modules into the kernel :)

That's what I do most of the time.  For some projects,
it is useful to build certain things as modules so you can
defer initializing them until later in the boot sequence.
You can get some critical user-space tasks running, then
come back later to initialize USB and other drivers.
On cameras, it's not uncommon to want to get to user
space in the first 500 milliseconds.

Sony has some code which allows us to both statically link
drivers and defer their initialization, but it's kind of
kludgy and requires modifying the module declarations
for the code you want to defer.  Let me know if you think
this is worth doing an RFC about.
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Workgroup of the Linux Foundation
Senior Staff Engineer, Sony Network Entertainment
=============================
