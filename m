From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PATCH 1/6] [PWM] Generic PWM API implementation
Date: Tue, 04 Nov 2008 14:16:08 -0600
Message-ID: <4910AD88.2000200@billgatliff.com>
References: <cover.1224093510.git.bgat@billgatliff.com>	 <c928e59670824f959a46ea77512d6dabbf9b46cc.1224093510.git.bgat@billgatliff.com> <8bd0f97a0810170859k72dc1bc5o34ed2388f95c3bc8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <8bd0f97a0810170859k72dc1bc5o34ed2388f95c3bc8@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Mike Frysinger wrote:
> On Wed, Oct 15, 2008 at 14:14, Bill Gatliff wrote:
>> +int pwm_register(struct pwm_device *pwm)
>> +{
>> +       struct pwm_channel *p;
>> +       int wchan;
>> +       int ret = 0;
> 
> the initialization to 0 here isnt needed

This is literally the only feedback I have received.  I take that to mean that
the code basically works as advertised, and nobody else has any problems with it
(it continues to work fine for me here).

So, what's the next step?  How do I advocate for getting this API into mainline?


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
