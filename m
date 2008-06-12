From: "Alexey Zaytsev" <alexey.zaytsev@gmail.com>
Subject: Re: Kernel boot problem on IXP422 Rev. A
Date: Fri, 13 Jun 2008 01:43:42 +0400
Message-ID: <f19298770806121443i3417dab4g4a36f469d1c1c524@mail.gmail.com>
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
        bh=qHA4UcWDrzE21V1ktVAjh+rHEa0gyoxDeHzPlo6dhKI=;
        b=lucpr4zpz1hnv51DS/n7Te2yxPQ5c4fFZLTTm87ZJY/TxAkaAex7SnydDPl6T1E524
         A/0cnYcb6NfTNh74r15PlrskJvsK012MJ4wJq1uTfFKFIGGF2LR4efVntmt87nK1qEcB
         PcHDivtoi+OBsGFkyAY+0Q6McMBGkGu+SKobQ=
In-Reply-To: <17882748-2E1B-4DB4-82FD-C5D5C4E62CC8@logicaloutcome.ca>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glenn Henshaw <thraxisp@logicaloutcome.ca>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

On Fri, Jun 13, 2008 at 1:28 AM, Glenn Henshaw
<thraxisp@logicaloutcome.ca> wrote:
>
> On 12-Jun-08, at 4:04 PM, Mike Frysinger wrote:
>
>> On Thu, Jun 12, 2008 at 3:35 PM, Marcus Tangermann wrote:
>>>
>>> we currently try to boot a 2.6.21 kernel
>>
>> time to upgrade
>
>  Wrong answer!!!

While the answer may be not valid any time you see
somebody complaining about an relatively old kernel not
working, it looks perfectly valid here.

They are experimenting with a new board, (well, not all that
new, probably), and a year-old kernel does not work. The
obvous thing it to try the latest kernel and see it it's working.
Should at least give a clue about what's wrong.
