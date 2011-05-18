From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: [PATCH] module: Use binary search in lookup_symbol()
Date: Wed, 18 May 2011 10:00:12 -0700
Message-ID: <4DD3FB1C.3040103@am.sony.com>
References: <BANLkTinPG100vbVAN1RZWb3h9Xuu6SKJ0Q@mail.gmail.com> <1305665763-3988-1-git-send-email-abogani@kernel.org> <20110517232241.GA19140@kroah.com> <4DD305B3.3000707@am.sony.com> <20110518075428.GA29998@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110518075428.GA29998@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>
Cc: Greg KH <greg@kroah.com>, Alessio Igor Bogani <abogani@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Anders Kaseorg <andersk@ksplice.com>, Tim Abbott <tabbott@ksplice.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>, Dirk Behme <dirk.behme@googlemail.com>

On 05/18/2011 12:54 AM, Christoph Hellwig wrote:
> On Tue, May 17, 2011 at 04:33:07PM -0700, Tim Bird wrote:
>> That said, I can answer Greg's question.  This is to speed up
>> the symbol resolution on module loading.  The last numbers I
>> saw showed a reduction of about 15-20% for the module load
>> time, for large-ish modules.  Of course this is highly dependent
>> on the size of the modules, what they do at load time, and how many
>> symbols are looked up to link them into the kernel.
> 
> How large are these very large modules, and what are good examples for
> that?

usbcore seems to be a large-ish module whose
load time is improved by this.  More details follow:

I don't know the exact modules, but Alan Jenkins reported a .3
second reduction in overall boot time, on a EEE PC, presumably
running a stock Linux distribution, and loading 41 modules.

See http://lkml.org/lkml/2009/11/3/93

Carmelo Amoroso reported some good performance gains
in this presentation:
http://elinux.org/images/1/18/C_AMOROSO_Fast_lkm_loader_ELC-E_2009.pdf
(See slide 22).

He doesn't report the overall time savings, and
he was using a different method (hash tables as opposed to
binary search), but I believe the results are comparable
to what the binary search enhancement provides.

The biggest offenders in his testing were usbcore,
ehci_hcd and ohci_hcd.

> And why do people overly care for the load time?

To reduce overall boot time.
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Workgroup of the Linux Foundation
Senior Staff Engineer, Sony Network Entertainment
=============================
