From: Dirk Behme <dirk.behme@googlemail.com>
Subject: Re: Boot time: Kernel start parallelization issue?
Date: Sat, 15 Jan 2011 17:18:13 +0100
Message-ID: <4D31C8C5.6010306@googlemail.com>
References: <4D315D86.40401@googlemail.com> <4D31C034.8040105@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=7sAau1V8Xdag0FqNqr29SIRBtLwgWqIxs5GSwtT3i3o=;
        b=o0A5fhL5xepPeeB12IeB9MLmLygmGiffDII5fUxJ0RigG90DDU037+oxTX6g/oL26h
         C1mBx2pUJiays1eZlBnfAEGBcmF+W3f7JIwRwMXbMPwZQgUMg6KR7ydWlrUSgHmxlrmu
         Un9ejQadYa4g1PLRuaVbj1ijemGjSawg3gYlU=
In-Reply-To: <4D31C034.8040105@linux.intel.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arjan van de Ven <arjan@linux.intel.com>
Cc: linux-embedded@vger.kernel.org, Greg KH <gregkh@suse.de>, Martin Mueller <martin@pfump.org>

On 15.01.2011 16:41, Arjan van de Ven wrote:
> On 1/15/2011 12:40 AM, Dirk Behme wrote:
>>
>> There are some reports [1] [2] looking at the boot time of embedded
>> (ARM?) systems using initcall debug [3]. Both reports seem to show
>> that they have issues with the start up sequence of the kernel being
>> completely single-threaded. In [2] Greg mentions that on a x86 box
>> multi-threads are happening and that there he doesn't see this
>> issue. On the other hand, both reports mention Arjan's async
>> initcall patches [4] to help against the issue. I.e. introducing
>> some parallelization (on ARM) does help, too.
>>
>> With this, I wonder
>>
>> - if anybody faces similar issues with single-threaded only kernel
>> start on embedded (ARM?) systems? Or if this is known? Or if there
>> are fixes for this?
>>
>> - if we somehow should try to 're-activate' Arjan's async initcall
>> patches?
>
> those patches are obsoleted by the merged async_schedule() calls.

Any link (patch name, git link) to be able to check for 
async_schedule() calls?

> what kernel are you seeing issues on?

[1] talks about 2.6.28, [2] talks about 2.6.34.

Best regards

Dirk

[1] 
http://www.lindusembedded.com/blog/2010/06/02/measuring-the-boot-time-of-an-embedded-linux-device/

[2] http://thread.gmane.org/gmane.linux.usb.general/41181 (mainly the 
last mail of this thread: 
http://article.gmane.org/gmane.linux.usb.general/41619)
