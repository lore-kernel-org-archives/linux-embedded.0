From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [RFC PATCH] arm: drop Execute-In-Place
Date: Thu, 5 May 2011 15:04:52 -0400
Message-ID: <BANLkTimfKJPcDN+L4+z1DnsMv_BMOHpyew@mail.gmail.com>
References: <1304607121-13612-1-git-send-email-plagnioj@jcrosoft.com>
 <4DC2E5AA.5010604@am.sony.com> <4DC2E669.2000101@am.sony.com>
 <1304620350.2398.29.camel@i7.infradead.org> <4DC2EF19.5010309@am.sony.com> <alpine.LFD.2.00.1105051453280.24613@xanadu.home>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=dLbWHlqPF4RdyaZXiH/W/VR6MDqjdWmKp62JiLXxfvI=;
        b=ZlDQ3N6LvWjQQVcEH0fxwMcyLOTA0j0qcbMUt/YlFAdJuf+xrBirCGccSBcYh1oCnv
         QwHVaj/GW6EAzgU/aq3mgr2onJ29IN27s5YLngkfFBP7Vwd5XDq9h26Go0s0XklSc1ds
         /jQxhrPfEzHrsiMtTcXI+zvheSIeslyuIa66U=
In-Reply-To: <alpine.LFD.2.00.1105051453280.24613@xanadu.home>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Tim Bird <tim.bird@am.sony.com>, David Woodhouse <dwmw2@infradead.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Russell King <linux@arm.linux.org.uk>, Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Eric Miao <eric.miao@canonical.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-embedded <linux-embedded@vger.kernel.org>

On Thu, May 5, 2011 at 14:54, Nicolas Pitre wrote:
> On Thu, 5 May 2011, Tim Bird wrote:
>> On 05/05/2011 11:32 AM, David Woodhouse wrote:
>> > On Thu, 2011-05-05 at 11:03 -0700, Tim Bird wrote:
>> >> On 05/05/2011 11:00 AM, Tim Bird wrote:
>> >>> On 05/05/2011 07:52 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:
>> >>>> nearly no-one use it, only amop1, pxa and sa1100 implement it
>> >>>
>> >>> Sony uses this - a lot. =C2=A0Principally we're using this on a =
NEC
>> >>> naviengine part, which is ARM11MPCore based, support for which
>> >>> is (sadly) out of tree.
>> >
>> > If you're out of tree, you don't exist.
>>
>> Yeah - I know. =C2=A0I guess I should tell NEC we'll drop support
>> for their chip and move to another one that supports XIP
>> if they don't get their act together. =C2=A0If XIP survives...
>
> It is easy enough to keep it alive... as long as someone uses it of
> course.

i think David's point:
=2E.. someone <in tree> uses it ...
-mike
