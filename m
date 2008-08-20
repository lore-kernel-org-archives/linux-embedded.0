From: "Paul Gortmaker" <paul.gortmaker@gmail.com>
Subject: Re: Adding a new platform
Date: Wed, 20 Aug 2008 00:29:45 -0400
Message-ID: <7d1d9c250808192129j3fb7ef28p8f404c6affd82078@mail.gmail.com>
References: <48AB0A7A.8040209@cisco.com>
	 <7d1d9c250808192019g6ec73ec7x53563b8ad2130df@mail.gmail.com>
	 <f608b67d0808192057w29988500o2793dfb7f0c99314@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=TGf4c1jpbiDJIIRBePrURw+9569QDnWDE5GXlmG0+tM=;
        b=jKv73f9R5JI5AOjqgjsLm9YD2xNi8sTV2gdnBLq6eswhfe+K6C5QDFUP5OkQoiqhys
         bYCw+2uAAXo+le56ErVn6qC1cJ+JLP95CQJ13vNjc5lj+d4f7Z9q+EI5lj3wxflG9Rtf
         3zKOO05WqqxAwo+9myyYpzDg8T8Nqj8nG+uYE=
In-Reply-To: <f608b67d0808192057w29988500o2793dfb7f0c99314@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: vb <vb@vsbe.com>
Cc: Linux Embedded Maillist <linux-embedded@vger.kernel.org>, corbet@lwn.net

On Tue, Aug 19, 2008 at 11:57 PM, vb <vb@vsbe.com> wrote:
> On Tue, Aug 19, 2008 at 8:19 PM, Paul Gortmaker
> <paul.gortmaker@gmail.com> wrote:
>> On Tue, Aug 19, 2008 at 2:01 PM, David VomLehn <dvomlehn@cisco.com> wrote:
>>> I'm working to educate our management on the need to get our platform in the
>>> kernel mainline. I expect I will be asked to tell them how much work this
>>> is. What do we need to do to add a new MIPS platform?
>>
>> Based on the phrase "educate our management"  -- I would strongly suggest you
>> have a look at Jonathan Corbet's document that describes the process and the
>> eventual value-add of having things in-kernel -- with an audience of non-kernel
>> hackers in mind.  I think this will really assist you in your efforts,
>> and I'm glad that
>> Jonathan put the time into this that he did.
>>
>> His original post can be viewed here:
>>
>> http://lkml.org/lkml/2008/7/29/363
>>
>> or here:
>>
>> http://lwn.net/Articles/291967/
>>
>
> This indeed is a very interesting document. I can hardly agree with
> the below point, however:
>
> +- While kernel developers strive to maintain a stable interface to user
> +  space, the internal kernel API is in constant flux.  The lack of a stable
> +  internal interface is a deliberate design decision; it allows fundamental
> +  improvements to be made at any time and results in higher-quality code.
> +  But one result of that policy is that any out-of-tree code requires
> +  constant upkeep if it is to work with new kernels.  Maintaining
> +  out-of-tree code requires significant amounts of work just to keep that
> +  code working.
>
> so, say a developer submits a proprietary driver and it gets accepted.

Doesn't happen.  By design.  If the driver is proprietary then it is presumably
not meant for open distribution, and hence not compatible with GPL and
widespread distribution into 100,000 public git repositories.  So it won't
get submitted and it won't get accepted.

> Then some internal kernel interface gets changed. Who now has to
> modify and retest the driver? Is it the person who introduces the
> change (how can he even do this, as he does not have the proprietary
> hardware available)? Or is this the original submitter - then where is
> the benefit of saving on upkeep?

I'd suggest you feed google "stable API nonsense" and continue reading
from there if you are interested in the topic.

Paul.

>
> This constant change of the kernel innards is hardly a good selling
> point, would you agree?
>
> cheers,
> /vb
>
