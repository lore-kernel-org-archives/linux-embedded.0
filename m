From: Rob Landley <rob@landley.net>
Subject: Re: execve(NULL, argv, envp) for nommu?
Date: Fri, 8 Sep 2017 16:18:10 -0500
Message-ID: <d2d1acae-b2a1-9f41-d3bf-9d3b35a62664@landley.net>
References: <324c00d9-06a6-1fc5-83fe-5bd36d874501@landley.net>
 <CAMuHMdUPUaLfbbFF1kZoEUy7or-9sVOt=ykAHT+S6NBvFy5V=g@mail.gmail.com>
 <20170905142436.262ed118@alans-desktop>
 <ab6e6e8b-7040-a07d-5502-405701182568@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iJixQJwUhWy9IGHhmw4bhpNAXiTOPS/HmDBtKEUFKCI=;
        b=j2AAD5sMlB1aPw3gnDACwwMWSfCPYt3UXtilDlnrcG0XT7PZNJE/ETd5jnSzO1WNZI
         3TcClaKNRfV8cxP5YDaf3eyHPCmnHVvu0VixAF7972D8rqT5k6e4A/HDLotkmu2Ud6RQ
         Vgep6XTrEkPfaTnvAs9GqjLSGimYxyXrIyTYcSfOCYJ/QtjZR8XZJvKkADO8D/F+W2T/
         hQaeLgvdBfBAqL0Cu+lxKYhEeCPrg2TztcnwF6mIlYK7B64gsqPdgCYZon3pe8CTykjD
         Mvrg1PU3YsEl6WjsYRtPjmtxCOkWJGxvtN16jd34KQXlcdY1bot9qmxFwYQcDzIDNcO7
         3UfQ==
In-Reply-To: <ab6e6e8b-7040-a07d-5502-405701182568@landley.net>
Content-Language: en-US
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>, dalias@libc.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 09/05/2017 08:12 PM, Rob Landley wrote:
> On 09/05/2017 08:24 AM, Alan Cox wrote:
>>>> honoring the suid bit if people feel that way. I just wanna unblock
>>>> vfork() while still running this code. 
>>
>> Would it make more sense to have a way to promote your vfork into a
>> fork when you hit these cases (I appreciate that fork on NOMMU has a much
>> higher performance cost as you start having to softmmu copy or swap
>> pages).
> 
> It's not the performance cost, it's rewriting all the pointers.
> 
> Without address translation, copying the existing mappings to a new
> range requires finding and adjusting every pointer to the old data,
> which you can do for the executable mappings in PIE* binaries, but
> tracking down all the pointers on the stack, heap, and in your global
> variables? Flaming pain.
> 
> Making fork() work on nommu is basically the same problem as making
> garbage collection work in C on mmu. Thus those of us who defend vfork()
> from the people who don't understand why it exists periodically
> suggesting we remove it.

So is exec(NULL, argv, envp) a reasonable thing to want?

Rob
