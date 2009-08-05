From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: [PATCH 1/6] lib/decompress_*: only include <linux/slab.h> if
 STATIC is not defined
Date: Wed, 05 Aug 2009 02:32:44 +0100
Message-ID: <4A78E13C.30309@lougher.demon.co.uk>
References: <20090731093107.GA29704@merkur.ravnborg.org>	<1249311501-23102-1-git-send-email-albin.tonnerre@free-electrons.com> <20090804155500.db6c88fa.akpm@linux-foundation.org> <4A78D6BD.3030003@lougher.demon.co.uk> <4A78D8DF.8070303@zytor.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4A78D8DF.8070303@zytor.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Albin Tonnerre <albin.tonnerre@free-electrons.com>, sam@ravnborg.org, linux@arm.linux.org.uk, alain@knaff.lu, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

H. Peter Anvin wrote:
> On 08/04/2009 05:47 PM, Phillip Lougher wrote:
>> Andrew Morton wrote:
>>> On Mon,  3 Aug 2009 16:58:16 +0200
>>> Albin Tonnerre <albin.tonnerre@free-electrons.com> wrote:
>>>
>>>> These includes were added by 079effb6933f34b9b1b67b08bd4fd7fb672d16ef to
>>>> fix the build when using kmemtrace. However this is not necessary when
>>>> used to create a compressed kernel, and actually creates issues (brings
>>>> a lot of things unavailable in the decompression environment), so don't
>>>> include it if STATIC is defined.
>>>>
>>> The description "actually creates issues (brings a lot of things
>>> unavailable in the decompression environment)" is inadequate.  Please
>>> describe te problem this patch fixes more completely so that others
>>> (ie: me) can decide whether this patch is needed in 2.6.32, 2.6.31.
>>> 2.6.30, ...
>>>
>>> This patch conflicts heavily with
>>>
>>> http://userweb.kernel.org/~akpm/mmotm/broken-out/bzip2-lzma-remove-nasty-uncompressed-size-hack-in-pre-boot-environment.patch
>>>
>>> What should we do about that?
>>
>> What do you normally do in this situation?  I'm happy to send a revised
>> bzip2-lzma-remove-nasty-uncompressed-size-hack-in-pre-boot-environment.patch
>>
>> that would apply cleanly on-top of Alvin's patch, but, this will obviously
>> create dependencies on his patch being applied.
>>
> 
> The general principle is that if A alone creates a more functional
> environment than B alone, then B should be applied on top of A, and vice
> versa.  This is especially so if A is a stable candidate.
> 
> It *sounds* like your patch is B here, but I am not sure from the
> description.
>

Gosh, who wants to get into the my patch is better than yours
argument.  I certainly don't...

My patch series cleans up the code and fixes a number of
rough edges (which I expect to hit when I try to make Squashfs
use the new decompression code).  Albin's looks to be adding a
new set of LZO functionality.  Regarding the conflicting
patches in question, my patch removes a hack, Albin's moves
#include <slab.h> into code covered by #ifndef STATIC, so it
doesn't pull in loads of unnecessary definitions when the
file is being built in the pre-boot environment.

I personally can't decide which is A or B.

Phillip
