From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] module: Use binary search in lookup_symbol()
Date: Wed, 18 May 2011 03:54:28 -0400
Message-ID: <20110518075428.GA29998@infradead.org>
References: <BANLkTinPG100vbVAN1RZWb3h9Xuu6SKJ0Q@mail.gmail.com>
 <1305665763-3988-1-git-send-email-abogani@kernel.org>
 <20110517232241.GA19140@kroah.com>
 <4DD305B3.3000707@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4DD305B3.3000707@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@am.sony.com>
Cc: Greg KH <greg@kroah.com>, Alessio Igor Bogani <abogani@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Anders Kaseorg <andersk@ksplice.com>, Tim Abbott <tabbott@ksplice.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>, Dirk Behme <dirk.behme@googlemail.com>

On Tue, May 17, 2011 at 04:33:07PM -0700, Tim Bird wrote:
> That said, I can answer Greg's question.  This is to speed up
> the symbol resolution on module loading.  The last numbers I
> saw showed a reduction of about 15-20% for the module load
> time, for large-ish modules.  Of course this is highly dependent
> on the size of the modules, what they do at load time, and how many
> symbols are looked up to link them into the kernel.

How large are these very large modules, and what are good examples for
that?  And why do people overly care for the load time?
