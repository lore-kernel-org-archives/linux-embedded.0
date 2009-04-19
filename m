From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH] Wait for console to become available, v2
Date: Sun, 19 Apr 2009 10:25:37 +0200
Message-ID: <874owlqcce.fsf@basil.nowhere.org>
References: <20090416190837.GA26734@cuplxvomd02.corp.sa.net>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090416190837.GA26734@cuplxvomd02.corp.sa.net> (VomLehn's message of "Thu, 16 Apr 2009 12:08:37 -0700")
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: VomLehn <dvomlehn@cisco.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Embedded Mailing List <linux-embedded@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>

VomLehn <dvomlehn@cisco.com> writes:
>
> History
> v2	Wait for the preferred console rather than any console. Make the
> 	delay interval a tunable.

CONFIG tunables are usually a bad idea. What should a binary distribution
kernel set? Better make it a boot option with a reasonable default.

Also a setting to panic in this case might be useful, normally a system
without console is not very useful and needs to be rebooted anyways.

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only.
