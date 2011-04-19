From: Wanlong Gao <wanlong.gao@gmail.com>
Subject: Re: [PATCH 4/4] module: Use the binary search for symbols resolution
Date: Tue, 19 Apr 2011 20:46:52 +0800
Message-ID: <4DAD843C.7060409@gmail.com>
References: <1302960373-5309-1-git-send-email-abogani@kernel.org> <1302960373-5309-5-git-send-email-abogani@kernel.org> <BANLkTik9oekjUH6YXTda1P_dM231nEHQqA@mail.gmail.com> <87liz73tso.fsf@rustcorp.com.au> <4DACE8F4.2050807@gmail.com> <87aafmo4mi.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=dPetkJkTMnpt79/odj0jbWfyGSrry5dnKWNV2kC4G7w=;
        b=wY1vTINCl8oWAvhL1EEWZCGAx29VpBIVpJVDfoDqVZoOnGe/rffQucyhUdbpDXX3P4
         mKejWBrHEVV6Mt6JA4+0g08VkJ/skbCAIVXKTLvRksQiDYLfs1E70/oGi7RddWrrm8pC
         AZ7wS4ZxR8AvjQAsNY2R7S5sNeHyagiQ3ibKI=
In-Reply-To: <87aafmo4mi.fsf@rustcorp.com.au>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Alessio Igor Bogani <abogani@kernel.org>, Tim Abbott <tabbott@ksplice.com>, Anders Kaseorg <andersk@ksplice.com>, Jason Wessel <jason.wessel@windriver.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>

  2011-4-19 19:35, Rusty Russell wroted:
> On Tue, 19 Apr 2011 09:44:20 +0800, Wanlong Gao<wanlong.gao@gmail.com>  wrote:
>>    2011-4-19 9:37, Rusty Russell wroted:
>>> On Sat, 16 Apr 2011 22:32:08 +0800, Wanlong Gao<wanlong.gao@gmail.com>   wrote:
>>>>> +	sym = bsearch(fsa->name, syms->start, syms->stop - syms->start,
>>>> As the bsearch func, why not change the syms->stop to syms->end ?
>>>> Hmm..Just a stupid suggestion.
>>>
>>>
>>> The names are derived from the linker symbols for end of sections, which
>>> is __stop_<sectionname>.
>>>
>>> Cheers,
>>> Rusty.
>> As this , why not change the bsearch's "end" to "stop", too ? It will be
>> more readable.
>
> I'm confused.  bsearch uses a count, not an end pointer...
>
> Rusty.

Hmm...I see, I see . I made a mistake on this func .
Thanks for your explanation.

Best regards
