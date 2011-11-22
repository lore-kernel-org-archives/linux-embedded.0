From: David Daney <ddaney.cavm@gmail.com>
Subject: Re: [PATCH RFC 3/5] kbuild/extable: Hook up sortextable into the
 build system.
Date: Tue, 22 Nov 2011 13:38:37 -0800
Message-ID: <4ECC165D.60300@gmail.com>
References: <1321645068-20475-1-git-send-email-ddaney.cavm@gmail.com> <1321645068-20475-4-git-send-email-ddaney.cavm@gmail.com> <4EC9046C.3050708@suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=OTe1NWb5ZLVGTGRj6kNzFlDGFs/jCu0XfzAVsuE7CTY=;
        b=kFUTdGFvRFJQzLQJ175Q85kgnJ31WYjyduNbWSKInCmff8kuKS7drlylzHWpGzHtab
         kaIZGwd4UYEJK9Y9dgEFKGPfJcEyBURoOF3XO6YBwK1xZq+fXFVWj/Rkyiiw7h4G9V5y
         M8LeB6tNFUzBLiqelhnQuRvxKy1uL32eIXgNY=
In-Reply-To: <4EC9046C.3050708@suse.cz>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michal Marek <mmarek@suse.cz>
Cc: David Daney <ddaney.cavm@gmail.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, David Daney <david.daney@cavium.com>

On 11/20/2011 05:45 AM, Michal Marek wrote:
> On 18.11.2011 20:37, David Daney wrote:
>> +	$(if $(CONFIG_BUILDTIME_EXTABLE_SORT),				\
>> +	$(Q)$(if $($(quiet)cmd_sortextable),				\
>> +	  echo '  $($(quiet)cmd_sortextable)  vmlinux'&&)		\
>> +	  $(cmd_sortextable)  vmlinux)
>
> Why do you opencode $(call cmd,sortextable) here?
>

Mostly just mimicking the other code in the vicinity.

I will try to improve it in the next version of the patch.

Thanks,
David Daney
