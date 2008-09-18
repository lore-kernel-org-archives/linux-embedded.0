From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: local_save_flags(flags)
Date: Thu, 18 Sep 2008 17:15:38 -0400
Message-ID: <8bd0f97a0809181415y2def310h73d83a455615b8ff@mail.gmail.com>
References: <556445368AFA1C438794ABDA8901891C098AABE6@USA0300MS03.na.xerox.net>
	 <896951.4734.qm@web63401.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=sMbDh1t4b/g6KdCWX8alevrCwjUqRLhVKXnlUR7Q59w=;
        b=FMXxdsIguzHbnu3gjc9x7cLhQfKE1joZItrvyDeUV739Jp5itfsIXVeSkBQ1/xgo8z
         tn0ssVNKa1WcofdGZJHBYZUgTsoIWXtOrXEL0HXwMQ12RlLDpWRNjtLVUd4XfQvemCuP
         k4SmCx1ppek4wND8ZKb0lw9y4j05H0kI1W8DU=
In-Reply-To: <896951.4734.qm@web63401.mail.re1.yahoo.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fundu_1999@yahoo.com
Cc: linux embedded <linux-embedded@vger.kernel.org>

On Thu, Sep 18, 2008 at 17:09, Fundu wrote:
>> turning off interrupts just masks them. the interrupt
>> hardware should
>> "latch" them and they fire when you reenable
>> interrupts.
>>
>> You loose track of "how many" not if any
>> happened...
>
> a follow up question,
> why do we need to save the flags then ? if the interrupt hardware would
> latch them ?
> can we not just disable all interrupts ?

you really should just read a book on the topic.  LDD3 covers these
intricacies (and a lot more), as does Essential Linux Device Drivers.
-mike
