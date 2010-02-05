From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PWM PATCH 0/5] Implements a common PWM API
Date: Fri, 05 Feb 2010 12:53:13 -0600
Message-ID: <4B6C6919.9020407@billgatliff.com>
References: <cover.1265094517.git.bgat@billgatliff.com> <BD79186B4FD85F4B8E60E381CAEE1909020E99C5@mi8nycmail19.Mi8.com> <BD79186B4FD85F4B8E60E381CAEE190902152C2F@mi8nycmail19.Mi8.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190902152C2F@mi8nycmail19.Mi8.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: H Hartley Sweeten <hartleys@visionengravers.com>
Cc: linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org

H Hartley Sweeten wrote:
>
> When you do repost this series please make sure that pwm support can only be
> selected if CONFIG_SYSFS is enabled.  Your original patches did not have this.
>   

Hmmm.  You mean CONFIG_SYSFS isn't pretty much mandatory nowadays?

> BTW, setting pwm.dev = &pdev->dev in my driver did fix the Ooops.
>   

Glad to hear that!  I'm hoping to get updated patches out next week.


b.g.

-- 
Bill Gatliff
Embedded systems training and consulting
http://billgatliff.com
bgat@billgatliff.com
