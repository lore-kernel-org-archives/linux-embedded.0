From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: Embedded Linux Flag Version
Date: Tue, 9 Nov 2010 06:19:12 -0500
Message-ID: <AANLkTikusrr073mUz3BQ3wP=y7E8WcDDayVms=PPhH8A@mail.gmail.com>
References: <4CD32EA0.4070805@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type;
        bh=MBafzrGZbMOqPTLahG9maBKqV4kOZnEf/jDXVZCgUB0=;
        b=F0aE3FUtPXFddsdaHfNE2ZLdBkM1HmaE92F8q3/5Q4cY/kn1xAhKJLJ4Xk2G2w5hnP
         tEISmTxSOaBLADrkGJFHkSPyxDXZ3h8JcW8NvtXGnjy2dwK3S90pjxzQR8cJ2BBp8n6w
         1ToU5uo+2Nwce2kg3bTxsDTB/kcROT45M/m74=
In-Reply-To: <4CD32EA0.4070805@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@am.sony.com>
Cc: linux-embedded@vger.kernel.org

On Thu, Nov 4, 2010 at 18:07, Tim Bird wrote:
> It was noted at the summit that several CE companies and embedded
> projects will be using (or are already using) 2.6.35 for upcoming
> products or releases. This includes Sony, Google, Meego, and Linaro. On
> behalf of the CE Linux Forum and a number of consumer electronics
> companies, projects and community developers, we therefore declare
> 2.6.35 as a flag version of the kernel for embedded use. Several
> companies will be investing in development, integration and testing of
> this version. Entities wanting to do business with those companies would
> therefore be well-advised to make sure their hardware, drivers and
> enhancements work well with this version of the kernel.

wouldnt it make more sense to piggy back the extensive work going into
the "stable" tree ?  many of the points you raise after all are the
entire founding point of it.  plus, all the main distros form around
that, are spending time working on that, is marked as supported for 2
or 3 years, and there is already infrastructure/framework/process in
place (stable@kernel.org).

so instead of picking arbitrary versions (like 2.6.35) and needlessly
replicating the huge work load, simply declare these stable trees as
the "flag" versions.  that means today it'd be 2.6.32.y.
-mike
