From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: [PATCH] module: Use binary search in lookup_symbol()
Date: Tue, 17 May 2011 16:33:07 -0700
Message-ID: <4DD305B3.3000707@am.sony.com>
References: <BANLkTinPG100vbVAN1RZWb3h9Xuu6SKJ0Q@mail.gmail.com> <1305665763-3988-1-git-send-email-abogani@kernel.org> <20110517232241.GA19140@kroah.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110517232241.GA19140@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg KH <greg@kroah.com>
Cc: Alessio Igor Bogani <abogani@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Anders Kaseorg <andersk@ksplice.com>, Tim Abbott <tabbott@ksplice.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>, Dirk Behme <dirk.behme@googlemail.com>

On 05/17/2011 04:22 PM, Greg KH wrote:
> On Tue, May 17, 2011 at 10:56:03PM +0200, Alessio Igor Bogani wrote:
>> This work was supported by a hardware donation from the CE Linux Forum.
>>
>> Signed-off-by: Alessio Igor Bogani <abogani@kernel.org>
>> ---
> 
> That's nice, but _why_ do this change?  What does it buy us?
> 
> Please explain why you make a change, not just who sponsored the change,
> that's not very interesting to developers.

Just a note here on the attribution...

Alessio - you can remove the "hardware donation from CELF" line
after the first submission or so.  It doesn't need to be on
every submission of the patch set, and it doesn't need to go into
the commit message for the patch set.  We only want it associated
with the patch set somewhere Google-able (like LKML).

That said, I can answer Greg's question.  This is to speed up
the symbol resolution on module loading.  The last numbers I
saw showed a reduction of about 15-20% for the module load
time, for large-ish modules.  Of course this is highly dependent
on the size of the modules, what they do at load time, and how many
symbols are looked up to link them into the kernel.

Alessio - do you have any timings you can share for the speedup?
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Workgroup of the Linux Foundation
Senior Staff Engineer, Sony Network Entertainment
=============================
