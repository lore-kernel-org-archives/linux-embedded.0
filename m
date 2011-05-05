From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [RFC PATCH] arm: drop Execute-In-Place
Date: Thu, 5 May 2011 15:27:17 -0400
Message-ID: <BANLkTincnFhwXAyvua5mtZDHqXs5Vts--Q@mail.gmail.com>
References: <1304607121-13612-1-git-send-email-plagnioj@jcrosoft.com>
 <4DC2E5AA.5010604@am.sony.com> <4DC2E669.2000101@am.sony.com>
 <1304620350.2398.29.camel@i7.infradead.org> <4DC2EF19.5010309@am.sony.com>
 <alpine.LFD.2.00.1105051453280.24613@xanadu.home> <BANLkTimfKJPcDN+L4+z1DnsMv_BMOHpyew@mail.gmail.com>
 <4DC2F6B0.80800@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=N1pdGQtrdombOTPUF23OVJPMBk084zuSb0ng5TE8cJw=;
        b=TCgkLRsjqHhZh7tpqOwJroFThiDbmVdS5j1UZL0tt6lswYLlhU2MjEIJwV5s2RUK9Q
         9Wuoyzb2VSW9NwvfTd53eyubtw/AtliVprFs8MYT8mBf5JpXTbB7uEeFvwmBUjueIwWZ
         r4Of3Ppx6l5K4hnmC16tVWhBEtJQaO8YPy8G0=
In-Reply-To: <4DC2F6B0.80800@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, David Woodhouse <dwmw2@infradead.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Russell King <linux@arm.linux.org.uk>, Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Eric Miao <eric.miao@canonical.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-embedded <linux-embedded@vger.kernel.org>

On Thu, May 5, 2011 at 15:12, Tim Bird wrote:
> On 05/05/2011 12:04 PM, Mike Frysinger wrote:
>> On Thu, May 5, 2011 at 14:54, Nicolas Pitre wrote:
>>> On Thu, 5 May 2011, Tim Bird wrote:
>>>> On 05/05/2011 11:32 AM, David Woodhouse wrote:
>>>>> On Thu, 2011-05-05 at 11:03 -0700, Tim Bird wrote:
>>>>>> On 05/05/2011 11:00 AM, Tim Bird wrote:
>>>>>>> On 05/05/2011 07:52 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:
>>>>>>>> nearly no-one use it, only amop1, pxa and sa1100 implement it
>>>>>>>
>>>>>>> Sony uses this - a lot. =C2=A0Principally we're using this on a=
 NEC
>>>>>>> naviengine part, which is ARM11MPCore based, support for which
>>>>>>> is (sadly) out of tree.
>>>>>
>>>>> If you're out of tree, you don't exist.
>>>>
>>>> Yeah - I know. =C2=A0I guess I should tell NEC we'll drop support
>>>> for their chip and move to another one that supports XIP
>>>> if they don't get their act together. =C2=A0If XIP survives...
>>>
>>> It is easy enough to keep it alive... as long as someone uses it of
>>> course.
>>
>> i think David's point:
>> ... someone <in tree> uses it ...
>
> I should add that I tried to use XIP on omap (for research purposes),
> but it was broken and I didn't have time to fix it. =C2=A0My bad.
> If anyone is using XIP on in-tree platforms, I'd like to hear
> about it.

XIP on Blackfin should work right now, but that doesnt directly apply
to the patch in question here.  it does however imply that other
pieces in the stack work (like the MTD/mm layers).

> As for in-tree-ness - I thought the most recent message was to stay
> out of tree until the refactoring was over. ;-)

to be fair, does this have any relevance whatsoever to NEC parts ?
istm that the hindrance here is NEC doing any actual work for
mainline.  even if there was no refactoring, i find it hard to believe
that an NEC port would be posted.  if it were actually something that
could happen, then they should already be posting patches for *basic*
review to get the pieces unrelated to the refactoring worked out.
there's no reason this has to be done serially.
-mike
