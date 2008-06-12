From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Thu, 12 Jun 2008 12:05:49 -0400
Message-ID: <8bd0f97a0806120905u532ce5f9sf231e185173de791@mail.gmail.com>
References: <1209577322.25560.402.camel@pmac.infradead.org>
	 <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com>
	 <200806111941.51221.rob@landley.net> <48513F5A.6010008@am.sony.com>
	 <1213285831.26255.152.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=2+Zuhew53hHM94MnvENKhvjo3AHFeqzJzNe2PxTPIEQ=;
        b=lgvlsXDH4zRKgDT/VNOmGMeW9+R2C887fHnhYMkEEF/E1PTK3WgAh+ADrQ9VtmPDzO
         UMSJ4R8q07Ab+DgVc0yMehYnt1wtY4AV++uS+tYeQew3fO5VD6PrATb/nJf5UntZD1xJ
         5Q9cqIc6dBn4F8f0+dJgNd3jem5alpAOFfzjI=
In-Reply-To: <1213285831.26255.152.camel@pmac.infradead.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Woodhouse <dwmw2@infradead.org>
Cc: Tim Bird <tim.bird@am.sony.com>, Rob Landley <rob@landley.net>, Greg Ungerer <gerg@snapgear.com>, Sam Ravnborg <sam@ravnborg.org>, Leon Woestenberg <leon.woestenberg@gmail.com>, linux-embedded@vger.kernel.org

On Thu, Jun 12, 2008 at 11:50 AM, David Woodhouse wrote:
> On Thu, 2008-06-12 at 08:23 -0700, Tim Bird wrote:
>> Rob Landley wrote:
>> > However, having one or more full-time engineers devoted to debugging
>> > cross-compile issues is quite a high price to pay too.  Moore's law really
>> > doesn't help that one.
>> >
>> > I'm not saying either solution is perfect, I'm just saying the "build under
>> > emulation" approach is a viable alternative that gets more attractive as time
>> > passes, both because of ongoing development on emulators and because of
>> > Moore's law on the hardware.
>>
>> I agree with much that you have said, Rob, and I understand the argument
>> for getting the most gain from the least resources, but I have a philosophical
>> problem with working around the cross-compilation problems instead of fixing
>> them in the upstream packages (or in the autoconf system itself).
>>
>> Once someone fixes the cross-compilation issues for a package, they usually
>> stay fixed, if the fixes are mainlined.
>
> I don't think that's true, unfortunately. Autoconf makes it _easy_ to do
> the wrong thing, and people will often introduce new problems.
>
> If we just made people write portable code and proper Makefiles, it
> would be less of an issue :)

people cant even write proper *native* makefiles.  mtd-utils for example ;).
-mike
