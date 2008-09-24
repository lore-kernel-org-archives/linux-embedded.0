From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: local_save_flags(flags)
Date: Tue, 23 Sep 2008 21:31:05 -0400
Message-ID: <8bd0f97a0809231831r6bc6d8c2o6189bedc8d7da89e@mail.gmail.com>
References: <8bd0f97a0809231611y48102c29u66e6f8b9f483a726@mail.gmail.com>
	 <657652.92650.qm@web63401.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=UqFXvVL/dT5FW8BPkceyUuy/tTnpkDoNQS4/bG4qqac=;
        b=nujBwXJ7zaEcXf4ODwISVrN6js8mAXbjFOBsXf6N6iF+Gn5iRAdZQbSvD5XqB7NZE+
         EBXUomdkbPWC+F6z8wQS3MkayDdO8PZkxFaMMYFb/nDCdpQFuRFb6oDjxGrynvsZYITI
         rIaNyDfOjatRDwoXsdJvcirGftrSJj3cKtFos=
In-Reply-To: <657652.92650.qm@web63401.mail.re1.yahoo.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fundu_1999@yahoo.com
Cc: linux embedded <linux-embedded@vger.kernel.org>

On Tue, Sep 23, 2008 at 21:15, Fundu wrote:
>>> what about Non maskable interrupts ? disabling
>>> interrupt won't have any effect on that right ?
>>
>> that really doesnt make sense by definition huh.
>> non-maskable means
>> they cant be masked.
>
> yeah thats the point. i should have elaborated more.
> then there's no guarantee that your code wont be interrupted ?

design your system properly and it wont be an issue

> typically what NMI interrupt does a embedded system have ?

it depends on the processor and the kernel configuration.  i can tell
you about the Blackfin processor, but i doubt you're using that.
-mike
