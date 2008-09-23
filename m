From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: local_save_flags(flags)
Date: Tue, 23 Sep 2008 19:11:03 -0400
Message-ID: <8bd0f97a0809231611y48102c29u66e6f8b9f483a726@mail.gmail.com>
References: <8bd0f97a0809181551u477911f6iccea3c74c6e6832d@mail.gmail.com>
	 <903542.11891.qm@web63401.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=AmEisb6GESAe2ZAXwDh8FKyXKAqd3BqKl+v8PTj+PS8=;
        b=I5bKWUsdn9nxyljY/unPROD6qXofX6WDFIU1/3CdsXIthvWVrolpAlzO3KqA6qMA84
         qz/NlhcjFmI8iSbuNq8XRJHUl1cgenvV5PuHlcagt26Vmy23rDEdOX+7iGkjQBuW5DuO
         mh2m5zxQvvo2xiBzsrRu61+PuS0KNamlLBdNI=
In-Reply-To: <903542.11891.qm@web63401.mail.re1.yahoo.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fundu_1999@yahoo.com
Cc: linux embedded <linux-embedded@vger.kernel.org>

On Tue, Sep 23, 2008 at 16:01, Fundu wrote:
>> > 2) so is disable interrupts twice is a problem, or just
>> enabling them after they are disabled (which sounds like
>> how it should be) a problem.
>>
>> both are a problem.  the non-state saving version cannot be
>> used
>> recursively nor in parallel to the state-saving version.
>
> Much clear now, Thanks Mike!
>
> here's a follow up question.
>
> what about Non maskable interrupts ? disabling interrupt won't have any effect on that right ?

that really doesnt make sense by definition huh.  non-maskable means
they cant be masked.
-mike
