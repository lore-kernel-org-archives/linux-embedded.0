From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [RFC PATCH] arm: drop Execute-In-Place
Date: Thu, 5 May 2011 16:31:11 -0400
Message-ID: <BANLkTi=qiX9oG=ZMx0nZXrG811L7OZg4ww@mail.gmail.com>
References: <1304607121-13612-1-git-send-email-plagnioj@jcrosoft.com>
 <4DC2E5AA.5010604@am.sony.com> <4DC2E669.2000101@am.sony.com>
 <1304620350.2398.29.camel@i7.infradead.org> <4DC2EF19.5010309@am.sony.com>
 <alpine.LFD.2.00.1105051453280.24613@xanadu.home> <BANLkTimfKJPcDN+L4+z1DnsMv_BMOHpyew@mail.gmail.com>
 <4DC2F6B0.80800@am.sony.com> <BANLkTincnFhwXAyvua5mtZDHqXs5Vts--Q@mail.gmail.com>
 <4DC307D0.3090704@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=DQUnNJZjhe4ttIdD9UsTg11OqXTID78Ey2XfiJspE3A=;
        b=eOx2gViQVg3MULCp6fboF9p38hK9DlZJECwQCAxS/mfVN4zVEMdgunQxZa+8WSZAZH
         rVN9SFUQvby5dIzZfdKCc8chqgiDgehE4Bv0qDCTNoT1kT8GpRFLezK3BMthYONliCAF
         0dMzOOTi/UVbyDfKShNzQv220zNM3sNGIg6KM=
In-Reply-To: <4DC307D0.3090704@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, David Woodhouse <dwmw2@infradead.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Russell King <linux@arm.linux.org.uk>, Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Eric Miao <eric.miao@canonical.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-embedded <linux-embedded@vger.kernel.org>

On Thu, May 5, 2011 at 16:25, Tim Bird wrote:
> On 05/05/2011 12:27 PM, Mike Frysinger wrote:
>> On Thu, May 5, 2011 at 15:12, Tim Bird wrote:
>>> As for in-tree-ness - I thought the most recent message was to stay
>>> out of tree until the refactoring was over. ;-)
>>
>> to be fair, does this have any relevance whatsoever to NEC parts ?
>> istm that the hindrance here is NEC doing any actual work for
>> mainline. =C2=A0even if there was no refactoring, i find it hard to =
believe
>> that an NEC port would be posted. =C2=A0if it were actually somethin=
g that
>> could happen, then they should already be posting patches for *basic=
*
>> review to get the pieces unrelated to the refactoring worked out.
>> there's no reason this has to be done serially.
>
> Well, OK. =C2=A0I just don't want to lob bombs at NEC and then
> have some poor soul over there get immediately rebuffed, due to
> basic ARM churn. =C2=A0Maybe not having naviengine support upstream
> is my fault, but Sony doesn't make the CPU, so it doesn't seem
> like it should be my job to mainline the chip support. =C2=A0About
> the only thing I have at my disposal is pressure not to buy
> the chip (but this is harder to exercise than one might think.)

i dont have any vested interest either way wrt NEC or ARM/XIP.  i was
just trying to highlight what i saw as a red herring.

i think the axiom "post early & post often" holds just as true here.
-mike
