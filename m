From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: [PATCH 1/6] [PWM] Generic PWM API implementation
Date: Fri, 17 Oct 2008 11:59:55 -0400
Message-ID: <8bd0f97a0810170859k72dc1bc5o34ed2388f95c3bc8@mail.gmail.com>
References: <cover.1224093510.git.bgat@billgatliff.com>
	 <c928e59670824f959a46ea77512d6dabbf9b46cc.1224093510.git.bgat@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=6F3ADBN5sEQQHiM/+U2i34LgxtBYNWz5BdJB2qJPWIo=;
        b=OXEVs7uo/kJRSfrXv5t/Oc2hcWreXc2YeZ6/Vlj6pSwPvbt7XYKjTvr35qCDDVvZZO
         wMJQRzKavR2/0DCJl7QihWIdnTISkH/wRAbcWsVBydzB55UhpsT5j7HIliTPUKehsrHZ
         nv7qPCQcOTETbGqA+xGs0R53/LaJaYhgbHasE=
In-Reply-To: <c928e59670824f959a46ea77512d6dabbf9b46cc.1224093510.git.bgat@billgatliff.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Wed, Oct 15, 2008 at 14:14, Bill Gatliff wrote:
> +int pwm_register(struct pwm_device *pwm)
> +{
> +       struct pwm_channel *p;
> +       int wchan;
> +       int ret = 0;

the initialization to 0 here isnt needed
-mike
