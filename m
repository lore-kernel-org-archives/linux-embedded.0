From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: Recommendation for activating a deferred module init in the kernel
Date: Tue, 17 Jun 2008 13:06:23 -0700
Message-ID: <4858193F.6080607@am.sony.com>
References: <48580116.9070504@am.sony.com> <20080617190750.GA31224@logfs.org> <20080617192248.GH11921@sovereign.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080617192248.GH11921@sovereign.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jim Freeman <jfree@sovereign.org>
Cc: J??rn Engel <joern@logfs.org>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

Jim Freeman wrote:
> Run modprobe?  Have it do just the _init bits without a load/link
> of the actual module text?

Interesting...  Maybe I could overload sys_init_module().  I'll take
a look at this.
  -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================

