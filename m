From: Arjan van de Ven <arjan@linux.intel.com>
Subject: Re: Boot time: Kernel start parallelization issue?
Date: Sat, 15 Jan 2011 07:41:40 -0800
Message-ID: <4D31C034.8040105@linux.intel.com>
References: <4D315D86.40401@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4D315D86.40401@googlemail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dirk Behme <dirk.behme@googlemail.com>
Cc: linux-embedded@vger.kernel.org, Greg KH <gregkh@suse.de>, Martin Mueller <martin@pfump.org>

On 1/15/2011 12:40 AM, Dirk Behme wrote:
>
> There are some reports [1] [2] looking at the boot time of embedded 
> (ARM?) systems using initcall debug [3]. Both reports seem to show 
> that they have issues with the start up sequence of the kernel being 
> completely single-threaded. In [2] Greg mentions that on a x86 box 
> multi-threads are happening and that there he doesn't see this issue. 
> On the other hand, both reports mention Arjan's async initcall patches 
> [4] to help against the issue. I.e. introducing some parallelization 
> (on ARM) does help, too.
>
> With this, I wonder
>
> - if anybody faces similar issues with single-threaded only kernel 
> start on embedded (ARM?) systems? Or if this is known? Or if there are 
> fixes for this?
>
> - if we somehow should try to 're-activate' Arjan's async initcall 
> patches?

those patches are obsoleted by the merged async_schedule() calls.

what kernel are you seeing issues on?
if it's something ancient, you should update first.
