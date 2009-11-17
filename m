From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH, RFC] panic-note: Annotation from user space for panics
Date: Tue, 17 Nov 2009 18:53:04 +0100
Message-ID: <4B02E300.8080409@gmail.com>
References: <20091112021322.GA6166@dvomlehn-lnx2.corp.sa.net>	 <4AFC4D31.2000101@gmail.com>	 <20091112215649.GA28349@dvomlehn-lnx2.corp.sa.net>	 <20091113091031.3f6d4bba@marrow.netinsight.se>	 <1258112748.21596.1227.camel@localhost> <4AFE6A14.4010507@gmail.com>	 <1258447997.27437.76.camel@localhost>	 <2ea1731b0911170445x13225c19w797388d2211de2d9@mail.gmail.com> <1258463404.27437.103.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755226AbZKQR7J@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=UJhEG14AqTSL4iV7yWTVIfRKxfJOUYZp8biU1X3z26A=;
        b=FUyvDB1C+D8qSUKnWiQHJX89+z2B6yRSLjxzMiuQO/CYPs8iLO+9Bz6TMPNNeZf1So
         CVKbmLfCv5bBKpoE2RWKH7qvZUU+GMPD6VBNy7xm80YNrWHjoNPGlZkB22bJYxNTk+HH
         tI3t+GK+wWoDouE2g8YEXKh0qYgMjPSNKlj88=
In-Reply-To: <1258463404.27437.103.camel@localhost>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: dedekind1@gmail.com
Cc: Simon Kagstrom <simon.kagstrom@netinsight.net>, David VomLehn <dvomlehn@cisco.com>, linux-embedded@vger.kernel.org, akpm@linux-foundation.org, dwm2@infradead.org, linux-kernel@vger.kernel.org, mpm@selenic.com, paul.gortmaker@windriver.com

Artem Bityutskiy wrote:
> On Tue, 2009-11-17 at 13:45 +0100, Marco Stornelli wrote:
>> 2009/11/17 Artem Bityutskiy <dedekind1@gmail.com>:
>
> We need to store this information of NAND flash. Implementing logs on
> NAND flash is about handling bad blocks, choosing format of records, and
> may be even handling wear-levelling. This is not that simple.
> 
> And then I have match oops to the userspace environment prints, using I
> guess timestamps, which is also about complications in userspace.
> 

Indeed my suggestion was to use a persistent ram, not difficult to use.

>>> This patch solves the problem gracefully, and I'd rather demand you to point what
>>> is the technical problem with the patches.
>>>
>> Simply because I think that we should avoid to include in the kernel
>> things we can do in a simply way at user space level.
> 
> If it is much easier to have in the kernel, then this argument does not
> work, IMHO.
> 
>>  I think this
>> patch is well done but it's one of the patches that are solutions "for
>> embedded only", but it's only my opinion.
> 
> Also IMHO, but having embedded-only things is not bad at all.
> 

In the past other patches are not accepted in main line for this, maybe
you'll be luckier.

Marco
