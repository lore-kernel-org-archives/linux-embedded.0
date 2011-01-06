From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 00/17] pramfs: persistent and protected RAM filesystem
Date: Thu, 06 Jan 2011 17:26:10 +0100
Message-ID: <4D25ED22.3070900@gmail.com>
References: <4D25AEEE.1050401@gmail.com> <1294322613.2016.333.camel@laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=6TbdwRSEZ0XQQc7d3k5wLATcBzNVtAvO52RGLLF3jsg=;
        b=eCSlLMFtjyohXuyqC/slKLKREKG5a/sVdIPMNcM+BKK0WZA3gQO/NwISp99xLyc61b
         NRMldO0pQIwemcjr7t/FHKKXZLSt/k5VD9jIqJjubIiyzeYXK25snQFtKSi4R3VdD8Wu
         CzpVMGqWpqi4U7POHc1yeYY518ewCV7ebzT4E=
In-Reply-To: <1294322613.2016.333.camel@laptop>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Tony Luck <tony.luck@intel.com>

Il 06/01/2011 15:03, Peter Zijlstra ha scritto:
> On Thu, 2011-01-06 at 13:00 +0100, Marco Stornelli wrote:
>> Hi all,
>>
>> after several reviews is time to submit the code for mainline. Thanks to
>> CELF to believe and support actively the project and thanks to Tim Bird.
> 
> Tony Luck was also playing with something like this I believe.
> 

Yes, I know. Even if the approach is different. He is trying to use a
persistent space record-based and with a simple fs interface to store
oops or something like this. The idea here is a little bit different,
i.e. to have a place (a generic piece of memory) to write not sensible
and temporary information with a complete fs structure. However we are
on the same road :)

Marco
