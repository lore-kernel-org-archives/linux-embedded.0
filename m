From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 14(16] pramfs: memory protection
Date: Tue, 12 Oct 2010 12:47:39 +0200
Message-ID: <AANLkTinpoL+AMU62PMvXs78Y6v0efDm3eq++NiVk8XUB@mail.gmail.com>
References: <4CB1EBA2.8090409@gmail.com>
	<87aamm3si1.fsf@basil.nowhere.org>
	<4CB34A1A.3030003@gmail.com>
	<20101012074522.GA20436@basil.fritz.box>
Mime-Version: 1.0
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=igyJHPIsQ3BOvPLoyacORnhuPp03/B/hmdvJ5Vg9KfY=;
        b=F4OxbeYltafutcv2SksVE3ua11yaw5E85HPzqi01USD6TtxiGmWAFpSeHyftzclHdh
         DEa3E62UGVSL5xb+HOSNIUQtY7JVL2FrtzfAMxmeHxyYWInJ0Japn3qeysPIADMIVrEE
         Wagfp7SoM/wf8yny9A9ZSY5UWDS/LJOzATF3U=
In-Reply-To: <20101012074522.GA20436@basil.fritz.box>
Sender: owner-linux-mm@kvack.org
List-Id: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <andi@firstfloor.org>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, linux-mm@kvack.org

2010/10/12 Andi Kleen <andi@firstfloor.org>:
> On Mon, Oct 11, 2010 at 07:32:10PM +0200, Marco Stornelli wrote:
>> Il 10/10/2010 18:46, Andi Kleen ha scritto:
>> > This won't work at all on x86 because you don't handle large
>> > pages.
>> >
>> > And it doesn't work on x86-64 because the first 2GB are double
>> > mapped (direct and kernel text mapping)
>> >
>> > Thirdly I expect it won't either on architectures that map
>> > the direct mapping with special registers (like IA64 or MIPS)
>>
>> Andi, what do you think to use the already implemented follow_pte
>> instead?
>
> Has all the same problems. Really you need an per architecture
> function. Perhaps some architectures could use a common helper,
> but certainly not all.
>

per-arch?! Wow. Mmm...maybe I have to change something at fs level to
avoid that. An alternative could be to use the follow_pte solution but
avoid the protection via Kconfig if the fs is used on some archs (ia64
or MIPS), with large pages and so on. An help of the kernel community
to know all these particular cases is welcome.

Regards,

Marco

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>

