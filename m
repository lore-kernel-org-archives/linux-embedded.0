From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH V2 6/8] lzma: Make lzma ... thunderbird ok
Date: Thu, 07 Jan 2010 18:26:23 +0100
Message-ID: <4B46193F.7040403@gmail.com>
References: <E1NIuOW-0001ol-RC@dylan.lougher.demon.co.uk>	 <20100106140409.ba0f63d1.akpm@linux-foundation.org>	 <4B4528C8.3020603@lougher.demon.co.uk>	 <20100106163113.637e47db.akpm@linux-foundation.org> <bffbecbb1001061637i31260775ja14523458cc1ed51@mail.gmail.com> <4B4590B8.80604@yahoo.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=G5rBo5+o9FN+YfOxXRpCs7IqBzOwXwwBc+Or6YGxnXE=;
        b=VGMTYk0n/K1rg6iIxpjZbCF7/1JVtxu2r+djnhcqxbLnoHX9MSoINbTsMiPOA+7/Dp
         YpMJdT1/94Ey3GPHhp9SWo6BfLRESrvV+Y1UdJy9O5K+D5auYG0/guwzB4bXV0aD6vkO
         0wzaZdCcKLWaW6ieJlz8rWLvpTPwV+PKNqhps=
In-Reply-To: <4B4590B8.80604@yahoo.es>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hein_Tibosch <hein_tibosch@yahoo.es>
Cc: Phillip Lougher <phillip.lougher@gmail.com>, linux-embedded@vger.kernel.org

Il 07/01/2010 08:43, Hein_Tibosch ha scritto:
> On 7-1-2010 08:37, Phillip Lougher wrote:
>> Sorry, I was worried it might do that - the curse of Thunderbird.  I
>> normally use a
>> really dumb client like mailx to send patches, but I obviously didn't have the
>> email thread under mailx to do that.
>>   
> Thunderbird: not a real curse for patches. Try the following:
> 
> Tools -> Options -> Advanced -> General -> Config Editor
> 
> mailnews.send_plaintext_flowed  user  boolean  false
> mailnews.display.disable_flowed_support user  boolean  true
> mailnews.wraplength user integer 512
> 
> And see this patch below:
> 
> ---
> diff --git a/thunderbird b/thunderbird
> +++
> ---
> 	if (using_thunderbird) {
> 		you can send patches safely
> 	}
> ---
> 
> Hein
> 

And with pasteCode and Toggle Word Wrap extensions it is even more easier ;)

Marco
