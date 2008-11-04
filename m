From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: [PATCH 1/6] [PWM] Generic PWM API implementation
Date: Tue, 4 Nov 2008 15:51:12 -0500
Message-ID: <8bd0f97a0811041251x322acbafhbd7a3cc3bc2436a@mail.gmail.com>
References: <cover.1224093510.git.bgat@billgatliff.com>
	 <c928e59670824f959a46ea77512d6dabbf9b46cc.1224093510.git.bgat@billgatliff.com>
	 <8bd0f97a0810170859k72dc1bc5o34ed2388f95c3bc8@mail.gmail.com>
	 <4910AD88.2000200@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=Lg/k3HjUE76uZeYta8TGebZwcU0tbwW+1miTb7thnpY=;
        b=ui9BGbWaE+okQrmiFyc3Q7VQbwokkRgMsTmR17HdmyC02WCWEEph9BWR3MRzy62Lza
         m6K5bfdVNwDU7SqU9ocKLjMNEktlJgZ+OlFoHw42o/uvTYzBlB1Ak/APg+3olXUjTCt6
         qv+HlV20Pi+xzeFimxk+E+MjvglNWc0LYO7KQ=
In-Reply-To: <4910AD88.2000200@billgatliff.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Tue, Nov 4, 2008 at 15:16, Bill Gatliff wrote:
> Mike Frysinger wrote:
>> On Wed, Oct 15, 2008 at 14:14, Bill Gatliff wrote:
>>> +int pwm_register(struct pwm_device *pwm)
>>> +{
>>> +       struct pwm_channel *p;
>>> +       int wchan;
>>> +       int ret = 0;
>>
>> the initialization to 0 here isnt needed
>
> This is literally the only feedback I have received.  I take that to mean that
> the code basically works as advertised, and nobody else has any problems with it
> (it continues to work fine for me here).
>
> So, what's the next step?  How do I advocate for getting this API into mainline?

you looking to be maintainer ?  if so, i imagine you start a git tree
(on kernel.org?) for people to pull from, post patches to mainline now
and indicate you'd ask for a 2.6.29 merge ...
-mike
