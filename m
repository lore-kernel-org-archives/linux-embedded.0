From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PWM v5 3/3] PWM: Atmel PWMC driver
Date: Sun, 20 Feb 2011 18:40:55 -0600
Message-ID: <AANLkTintizGb8Ky3ROdxXF45UUeZnLN5wUQmAARSwNHG@mail.gmail.com>
References: <1298175043-31727-1-git-send-email-bgat@billgatliff.com>
	<1298175043-31727-4-git-send-email-bgat@billgatliff.com>
	<AANLkTik_LqXS1DA-y3xOjXOCn_h7aNoZ533F+CK=ruZR@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <AANLkTik_LqXS1DA-y3xOjXOCn_h7aNoZ533F+CK=ruZR@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: linux-embedded@vger.kernel.org

Mike:


All great points, and you spotted a true bug--- the "chan < chan"
junk.  Don't know how I missed that one.  Will fix all.


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
