From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Mon, 9 Jun 2008 23:27:29 +0200
Message-ID: <c384c5ea0806091427k3bd29168wbe55f6920054d44a@mail.gmail.com>
References: <1209577322.25560.402.camel@pmac.infradead.org>
	 <87bq3rgq40.fsf@basil.nowhere.org>
	 <1209582709.25560.441.camel@pmac.infradead.org>
	 <200805281652.47558.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=AwFnjGJUBVm7FxvjOvfWBnnDeO3tlzNa5OletLtJgoI=;
        b=VH4WvLoBUcVyT+zX4tR6dsIyka+xDr9GqAVVxJNm+xfzSv90zerwqMJOJ1JG/kylte
         oIYgnlZQGj6kYFuX3mG4btVDkoUcb2vHslQrQJ+qWWThVOyOXSXvwcKhPHgxmzni+58a
         l+q04zCqPiDL4pBk8bAzAACRd1mMFSDtpFuu4=
In-Reply-To: <200805281652.47558.rob@landley.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Landley <rob@landley.net>, David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org

Hello,

On Wed, May 28, 2008 at 11:52 PM, Rob Landley <rob@landley.net> wrote:
> On Wednesday 30 April 2008 14:11:49 David Woodhouse wrote:
>> I agree. And if we do want to pay attention to pure code size, there are
>> other approaches -- like --gc-sections and/or building with '--combine
>> -fwhole-program' which I was playing with for OLPC a while back. I must
>> dust that off now that the GCC fixes should mostly have made it into
>> current distributions.
>
> I like simplicity.  I like _simple_.  Half my attraction to embedded systems
>
Same here.

> I submitted a patch to remove the use of perl to build the linux kernel (which
> HPA added in 2.6.25) not because it affected the result, but because it
> unnecessarily complicates the build system.  (And perl tends to metasticize.

Thanks, I hope it is or gets accepted.

In general I think one of the aspects of embedded Linux is about
minimizing the amount of bloat dependencies. Especially, when each
dependency can explode in a hurd of new dependencies.

> "One of my most productive days was throwing away 1000 lines of code."
>  - Ken Thompson.
>
How appropriate.

Regards,
-- 
Leon
