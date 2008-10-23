From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: Subject: [PATCH 00/16] Squashfs: compressed read-only filesystem
Date: Thu, 23 Oct 2008 09:40:42 +0100
Message-ID: <4900388A.7010406@lougher.demon.co.uk>
References: <E1KqrTW-0001x8-3h@dylan> <Pine.LNX.4.64.0810221913330.20919@vixen.sonytel.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0810221913330.20919@vixen.sonytel.be>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com

Geert Uytterhoeven wrote:
> 	Hi Phillip,
> 
> On Fri, 17 Oct 2008, Phillip Lougher wrote:
>> This is a second attempt at mainlining Squashfs.  The first attempt was way
> 
> This is great news!
> 
> I ran a quick test of squashfs 4.0 (the CVS version) on UML/ia32 and ppc64, and it
> seems to work fine!  Great job! Let's hope we'll see it in mainline soon...
> 

Thanks!  I hope it gets into mainline soon too :)

> BTW, one minor gripe is that the current mksquashfs doesn't want to run on big
> endian yet, as there's no byteswapping support.

Yeah, I know about that.  There's still some work needing to be done on 
the squashfs-tools.  I figured it was important to get the kernel stuff 
submitted and discussed ASAP.

Phillip
