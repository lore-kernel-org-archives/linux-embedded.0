From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: Kernel boot problem on IXP422 Rev. A
Date: Thu, 12 Jun 2008 17:35:14 -0400
Message-ID: <8bd0f97a0806121435r2ace2c5br692cab8426966ee6@mail.gmail.com>
References: <1522484831@web.de>
	 <8bd0f97a0806121304m7d00fb6dq27fa7aa37cbeb828@mail.gmail.com>
	 <17882748-2E1B-4DB4-82FD-C5D5C4E62CC8@logicaloutcome.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=vftWTNuI2tmoHZ9TfKQqe7ZkE7YPH1sQH8CZSEyDU54=;
        b=Xpy+NEvVAqqh3Ob1jZc8ARUfQcdPU6ZsY5hymlc5/cMvYSznOVT24+q1Y91N6lxG+f
         WdJQczOmBMe8FJNkX1DyYmfwrqwzPB0CNjEKrO5nWQAye2qVNEVPvMg2ImMUMwMf0mkT
         XCJ+Q7hv7BCjqC5o1V0f8XdKXpLAtSvvJEh3g=
In-Reply-To: <17882748-2E1B-4DB4-82FD-C5D5C4E62CC8@logicaloutcome.ca>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glenn Henshaw <thraxisp@logicaloutcome.ca>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

On Thu, Jun 12, 2008 at 5:28 PM, Glenn Henshaw wrote:
> On 12-Jun-08, at 4:04 PM, Mike Frysinger wrote:
>> On Thu, Jun 12, 2008 at 3:35 PM, Marcus Tangermann wrote:
>>> we currently try to boot a 2.6.21 kernel
>>
>> time to upgrade
>
>  Wrong answer!!!

not really

>  Many embedded devices can't upgrade kernels easily because of customer
> <snip>

and there are plenty of *wrong* reasons that people are using old kernels.

>  Often developers not working in the embedded space don't understand this
> reality.

if i'm not classified as an embedded developer, then i dont know what one is :P

>  Helpful responses on what does/does not work would be more appreciated.

i gave a realistic one and i sent him to the right place -- the arm
kernel mailing lists
-mike
