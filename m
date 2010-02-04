From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PWM PATCH 1/5] API to consolidate PWM devices behind a common
 user and kernel interface
Date: Wed, 03 Feb 2010 23:31:22 -0600
Message-ID: <4B6A5BAA.2030908@billgatliff.com>
References: <cover.1265094517.git.bgat@billgatliff.com> <c5873aa7c5d20254a9e54fc1ff179345b77c16b5.1265094517.git.bgat@billgatliff.com> <BD79186B4FD85F4B8E60E381CAEE190902152ADB@mi8nycmail19.Mi8.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190902152ADB@mi8nycmail19.Mi8.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: H Hartley Sweeten <hartleys@visionengravers.com>
Cc: linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org

H Hartley Sweeten wrote:
>
> Your older patch just used printk's to output the messages.  I think the
> Oops is being caused by the dev_<level>(pwm->dev, ...).  Where is pwm->dev
> being setup?
>   

Good question!  Makes me think that it isn't...

I'm traveling back to my office at the moment, should be back in late
tomorrow or Friday a.m.  I'll look at this then.

The intention was to save the result from device_create() called from
__pwm_create_sysfs(), but I'm suspicious that the patch I posted doesn't
have that code for some reason.  My local git repo here doesn't seem to
have it.  Hmmm...


b.g.

-- 
Bill Gatliff
bgat@billgatliff.com

