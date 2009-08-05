From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: [PATCH 1/6] lib/decompress_*: only include <linux/slab.h> if
 STATIC is not defined
Date: Wed, 05 Aug 2009 03:06:41 +0100
Message-ID: <4A78E931.6030308@lougher.demon.co.uk>
References: <20090731093107.GA29704@merkur.ravnborg.org>	<1249311501-23102-1-git-send-email-albin.tonnerre@free-electrons.com>	<20090804155500.db6c88fa.akpm@linux-foundation.org>	<4A78D6BD.3030003@lougher.demon.co.uk> <20090804180854.d5dbb07f.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933305AbZHECGm@vger.kernel.org>
In-Reply-To: <20090804180854.d5dbb07f.akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Albin Tonnerre <albin.tonnerre@free-electrons.com>, sam@ravnborg.org, hpa@zytor.com, linux@arm.linux.org.uk, alain@knaff.lu, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

Andrew Morton wrote:
> On Wed, 05 Aug 2009 01:47:57 +0100 Phillip Lougher <phillip@lougher.demon.co.uk> wrote:
> 
>>
>> What do you normally do in this situation?
> 
> I normally fix the rejects ;)
> 
> But I'd like to confirm that the two patches don't fix the same thing
> via different means.  Lacking a full description of Albin's "issues",
> that's hard to determine.  They do appear to be unrelated.
> 

No they're not fixing the same thing.

Albin's patch is moving #include <slab.h> inside the #ifndef STATIC ...
#endif code segment.  This ensures that <slab.h>
isn't included when the file is being built in the stripped down
pre-boot environment.  I imagine Albin's issues is that slab.h
pulls in a lot of definitions unnecessary in the pre-boot
environment and which rely on things which are missing
in the stripped down pre-boot environment.

My changes to the #ifndef STATIC logic defines PREBOOT if
STATIC is defined.  My patch uses the PREBOOT definition
later to define the decompress wrapper function, which is only
needed in the preboot environment.

i.e.

#ifdef STATIC
#define PREBOOT
#else
#include <linux/decompress/unlzma.h>
#endif

...
Lots of code
...

#ifdef PREBOOT
static int INIT decompress.....
#endif


Obvious question, why doesn't my patch use STATIC here rather than
PREBOOT?  The header file <linux/decompress/unlzma.h> defines STATIC, .i.e
the #ifndef STATIC case defines STATIC via an include file, which makes
decisions on STATIC later in the file impossible.

>>  I'm happy to send a revised
>> bzip2-lzma-remove-nasty-uncompressed-size-hack-in-pre-boot-environment.patch
>> that would apply cleanly on-top of Alvin's patch, but, this will obviously
>> create dependencies on his patch being applied.
> 
> Reworked
> lib-decompress_-only-include-linux-slabh-if-static-is-not-defined.patch:

The patch looks OK.

Thanks

Phillip
