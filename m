From: Josh Boyer <jwboyer@gmail.com>
Subject: Re: Embedded Linux Flag Version
Date: Fri, 5 Nov 2010 10:32:54 -0400
Message-ID: <AANLkTimjCkzxQbMkQxjsSk83siQDnPLy6Y8xSiCt8V45@mail.gmail.com>
References: <4CD32EA0.4070805@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=vZaPTyN81OsBV+yuB56Saic3uzOF782/Foe5dQm2E8I=;
        b=vnRXKEmVcDvW5IQovt8Ans79Vc060YtHvZeJL9A4+r5P5rerxtbZbllo1iGxIVbqCR
         5869ByPvBceI2Vyvf/w9WQueTCVgsuzAIALIcFwvo6lJp2bAgeavNa9+Pmx5KFkhgchC
         PoB56ApRAkUAtcPzLnhvCAn35MIUk6n5u60zw=
In-Reply-To: <4CD32EA0.4070805@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@am.sony.com>
Cc: linux-embedded@vger.kernel.org

On Thu, Nov 4, 2010 at 6:07 PM, Tim Bird <tim.bird@am.sony.com> wrote:
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

What is the expected lifetime for a flag version?  A new version every
year, 2 years, etc?  While the reasoning behind this makes sense to
me, I'm curious how this will impact migration to the next flag
version, and how the lifetime of a flag version will play into future
migration.

josh
