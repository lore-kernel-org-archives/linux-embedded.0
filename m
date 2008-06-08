From: Detlev Zundel <dzu@denx.de>
Subject: Re: YAFFS in the kernel tree?
Date: Sun, 08 Jun 2008 13:45:18 +0200
Message-ID: <m2zlpw2lrl.fsf@ohwell.denx.de>
References: <200805290859.54396.manningc2@actrix.gen.nz>
	<f19298770805281515u1602e18enbad78fccfda24b02@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <f19298770805281515u1602e18enbad78fccfda24b02@mail.gmail.com>
	(Alexey Zaytsev's message of "Thu, 29 May 2008 02:15:27 +0400")
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Zaytsev <alexey.zaytsev@gmail.com>
Cc: Charles Manning <manningc2@actrix.gen.nz>, linux-embedded@vger.kernel.org

"Alexey Zaytsev" <alexey.zaytsev@gmail.com> writes:

> On Thu, May 29, 2008 at 12:59 AM, Charles Manning
> <manningc2@actrix.gen.nz> wrote:
>> Hi
>>
>> I'm the author of YAFFS. This is not in the kernel tree, but is fairly easy to
>> integrate by just pulling a tarball and running  patch-in script.
>>
>> I am curious as to whether people consider the current mechanism "good enough"
>> or whether it is worth the effort trying to get YAFFS into the kernel tree.
>>
>> Pros I can see:
>> * In tree means better testing (maybe).
>> * Keeping current with kernel API changes.
>>
>> Cons:
>> * More effort for YAFFS maintainers (me mostly).
>> * Effort getting code into kernel coding style (unless I can get a waiver on
>> this).
>>
>> Thoughts??
>
> We at protei (protei.ru) are using yaffs for over a year now, switched from
> jffs2, mostly because of the huge mount time difference. Have yet to
> see any serious problems.
>
> The process of patching the kernel with yaffs is quite smooth, but you
> loose the ability to track the changes made in yaffs. We've got a git
> kernel tree, to which we add our stuff, and also periodically repatch it
> with a fresh yaffs. The problem is, all you can see later is a commit
> labelled "A Yaffs update", revealing little details on the contents. Not cool.

Sorry for jumping in here late, but git should be pretty good about
finding differences itself.  If you can revers-apply the previous
version patch, then apply the current version and git commit, it should
yield much more useful information.

Cheers
  Detlev

-- 
The proprietary-Unix players proved so ponderous, so blind, and so inept at
marketing that Microsoft was able to grab away a large part of their market
with the shockingly inferior technology of its Windows operating system.
                   -- "A Brief History of Hackerdom" by Eric Steven Raymond
--
DENX Software Engineering GmbH,      MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich,  Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-40 Fax: (+49)-8142-66989-80 Email: dzu@denx.de
