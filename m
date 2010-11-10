From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: Embedded Linux Flag Version
Date: Wed, 10 Nov 2010 05:16:23 -0500
Message-ID: <AANLkTi=aPgC8Jyp8RaV77naAoFuuiRnaSyLYPLM+q322@mail.gmail.com>
References: <4CD32EA0.4070805@am.sony.com> <AANLkTikusrr073mUz3BQ3wP=y7E8WcDDayVms=PPhH8A@mail.gmail.com>
 <4CD98220.40806@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=iWmcXipEnYmYyEO0ls4cL5RkK9IdbI73nRB2itU1mvE=;
        b=pagXUZhsMOapO7aGucphry8TW0TBybymIHxnceoTdn51Fdeax5rZujvrVa5pBBjeMG
         EJHy3Vr2p+yvIdXI+MY1yiMR59xuCraHiViQeOlPcob8OtdAwxKUxZHDhm4xISPFIDgD
         0/544yQ2UmqQ20QPrNz05nCpMj+q5bUiqMs8k=
In-Reply-To: <4CD98220.40806@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Tim Bird <tim.bird@am.sony.com>
Cc: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

On Tue, Nov 9, 2010 at 12:17, Tim Bird wrote:
> On 11/09/2010 03:19 AM, Mike Frysinger wrote:
>> On Thu, Nov 4, 2010 at 18:07, Tim Bird wrote:
>>> It was noted at the summit that several CE companies and embedded
>>> projects will be using (or are already using) 2.6.35 for upcoming
>>> products or releases. This includes Sony, Google, Meego, and Linaro=
=2E On
>>> behalf of the CE Linux Forum and a number of consumer electronics
>>> companies, projects and community developers, we therefore declare
>>> 2.6.35 as a flag version of the kernel for embedded use. Several
>>> companies will be investing in development, integration and testing=
 of
>>> this version. Entities wanting to do business with those companies =
would
>>> therefore be well-advised to make sure their hardware, drivers and
>>> enhancements work well with this version of the kernel.
>>
>> wouldnt it make more sense to piggy back the extensive work going in=
to
>> the "stable" tree ? =C2=A0many of the points you raise after all are=
 the
>> entire founding point of it. =C2=A0plus, all the main distros form a=
round
>> that, are spending time working on that, is marked as supported for =
2
>> or 3 years, and there is already infrastructure/framework/process in
>> place (stable@kernel.org).
>>
>> so instead of picking arbitrary versions (like 2.6.35) and needlessl=
y
>> replicating the huge work load, simply declare these stable trees as
>> the "flag" versions. =C2=A0that means today it'd be 2.6.32.y.
>
> The fact that this tree is already a year old, and not likely to be
> brought forward for at least another 2 years is the reason we didn't
> choose it this time. =C2=A0Most of the high-profile, active embedded =
projects
> are already on 2.6.35. =C2=A0For companies looking to adopt a new bas=
e kernel
> in the next 12 months, I don't want to have them start with a year-ol=
d
> kernel. =C2=A0We did consider the utility of synchronizing with the e=
nterprise
> stable tree, but the timing just didn't work too well this time aroun=
d.

so you're suggesting this is a one-off choice.  in the future, the
"flag" versions will simply piggy the existing stable trees ?
-mike
