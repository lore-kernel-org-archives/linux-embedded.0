From: Dirk Behme <dirk.behme@googlemail.com>
Subject: Re: Boot time: Kernel start parallelization issue?
Date: Sun, 16 Jan 2011 08:33:54 +0100
Message-ID: <4D329F62.1010505@googlemail.com>
References: <4D315D86.40401@googlemail.com> <4D31C034.8040105@linux.intel.com> <4D31C8C5.6010306@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=wFBJPXOw/IyWs0VfkW4g7B6d0aQ2VB4lq8Dc0QHAvS4=;
        b=UomlGbqUQpp4CpIdMnMWrVlpKLgLFolAplx0urHcEoC8UwS6/wY5xa4dzWT0iRHa2L
         46ggEVHvLT6E45YSIMVr/I8unDi3mYOnAMkoAhF/JNc7smiw9dczt/OqTTGF8b0CWq2h
         AdLUuV20AKjzfois1q/HyivXn90/WAn7RovBU=
In-Reply-To: <4D31C8C5.6010306@googlemail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arjan van de Ven <arjan@linux.intel.com>
Cc: linux-embedded@vger.kernel.org, Greg KH <gregkh@suse.de>, Martin Mueller <martin@pfump.org>

On 15.01.2011 17:18, Dirk Behme wrote:
> On 15.01.2011 16:41, Arjan van de Ven wrote:
>> On 1/15/2011 12:40 AM, Dirk Behme wrote:
>>>
>>> There are some reports [1] [2] looking at the boot time of embedded
>>> (ARM?) systems using initcall debug [3]. Both reports seem to show
>>> that they have issues with the start up sequence of the kernel being
>>> completely single-threaded. In [2] Greg mentions that on a x86 box
>>> multi-threads are happening and that there he doesn't see this
>>> issue. On the other hand, both reports mention Arjan's async
>>> initcall patches [4] to help against the issue. I.e. introducing
>>> some parallelization (on ARM) does help, too.
>>>
>>> With this, I wonder
>>>
>>> - if anybody faces similar issues with single-threaded only kernel
>>> start on embedded (ARM?) systems? Or if this is known? Or if there
>>> are fixes for this?
>>>
>>> - if we somehow should try to 're-activate' Arjan's async initcall
>>> patches?
>>
>> those patches are obsoleted by the merged async_schedule() calls.
>
> Any link (patch name, git link) to be able to check for
> async_schedule() calls?

Do you talk about

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=22a9d645677feefd402befd02edd59b122289ef1
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=4ace92fc112c6069b4fcb95a31d3142d4a43ff2a
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=793180570ff2530d133343ceea85648de5f01b02
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=f29d3b23238e1955a8094e038c72546e99308e61

http://lwn.net/Articles/314808/

merged with 2.6.29?

With a recent .37 kernel the usage of async_schedule() seems to be 
implemented for

./drivers/acpi/battery.c
./drivers/s390/block/dasd.c
./drivers/base/power/main.c
./drivers/ata/libata-core.c
./drivers/scsi/sd.c
./drivers/md/raid5.c

With this, on an embedded system using none of this, the completely 
single-threaded start up reported in [2] seems to be reasonable, then?

This would mean that to improve the issues reported in [2], 
async_schedule() has to be implemented for the sub systems used, 
there, too? I.e. the USB init?

>> what kernel are you seeing issues on?
>
> [1] talks about 2.6.28, [2] talks about 2.6.34.

Thanks

Dirk

> [1]
> http://www.lindusembedded.com/blog/2010/06/02/measuring-the-boot-time-of-an-embedded-linux-device/
>
>
> [2] http://thread.gmane.org/gmane.linux.usb.general/41181 (mainly the
> last mail of this thread:
> http://article.gmane.org/gmane.linux.usb.general/41619)
