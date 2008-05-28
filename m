From: James Chapman <jchapman-Bm0nJX+W7e9BDgjK7y7TUQ@public.gmane.org>
Subject: Re: YAFFS in the kernel tree?
Date: Wed, 28 May 2008 23:40:08 +0100
Message-ID: <483DDF48.7070106@katalix.com>
References: <200805290859.54396.manningc2@actrix.gen.nz> <8bd0f97a0805281424g2ceae455x774e8d66aba4ec2b@mail.gmail.com> <200805290934.28232.manningc2@actrix.gen.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200805290934.28232.manningc2-jEEI2ySEPisjAXWc8ALWsQ@public.gmane.org>
Sender: linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Charles Manning <manningc2-jEEI2ySEPisjAXWc8ALWsQ@public.gmane.org>
Cc: Mike Frysinger <vapier.adi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Charles Manning wrote:
> On Thursday 29 May 2008 09:24:14 Mike Frysinger wrote:
>> On Wed, May 28, 2008 at 4:59 PM, Charles Manning wrote:
>>> I'm the author of YAFFS. This is not in the kernel tree, but is fairly
>>> easy to integrate by just pulling a tarball and running  patch-in script.
>>>
>>> I am curious as to whether people consider the current mechanism "good
>>> enough" or whether it is worth the effort trying to get YAFFS into the
>>> kernel tree.
>>>
>>> Pros I can see:
>>> * In tree means better testing (maybe).
>>> * Keeping current with kernel API changes.
>>>
>>> Cons:
>>> * More effort for YAFFS maintainers (me mostly).
>>> * Effort getting code into kernel coding style (unless I can get a waiver
>>> on this).
>> i'm pretty sure you're going to have to cull all of the
>> LINUX_VERSION_CODE checks.  that means the in tree yaffs code is only
>> going to track mainline kernel versions.  i dont know whether you
>> consider that a pro or con (i say it's a pro), but if you want/need
>> those checks, you're basically going to have to maintain two forked
>> versions ...
>> -mike
> 
> The main reason for those version checks is that YAFFS tries to acknowledge 
> that not everyone just uses the latest kernel. Many embedded developers are 
> using older kernels (for various valid reasons) (though this practice is 
> probably on the decline) and I would like to continue supporting that.
> 
> I would expect that this would make for two versions of yaffs_fs.c: the CVS 
> one for all comers and the in-tree version which is cleaned.

Submitting code into the kernel doesn't mean you have to maintain both 
in-tree and out-of-tree versions. Once the code is accepted into the 
tree, I suggest that all subsequent development is done on the in-tree 
version. Leave the CVS version for people who run older kernels - don't 
try to keep the two in step. If users of older kernels want a new 
feature or bugfix from the in-tree version, let them backport it; they 
probably do so routinely already for other kernel components anyway.

I maintained some kernel code out of tree for a while. In my experience, 
once code is accepted in the mainline kernel tree, the effort in 
supporting and maintaining it dropped dramatically. It can take a lot of 
work to get it accepted but the effort is well worth it if you're 
successful.

I say yes, work on submitting yaffs. :)

-- 
James Chapman
Katalix Systems Ltd
http://www.katalix.com
Catalysts for your Embedded Linux software development

--
To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
