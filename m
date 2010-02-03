From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PWM PATCH 3/5] Expunge old Atmel PWMC driver, replacing it with
 one that conforms to the PWM API
Date: Tue, 02 Feb 2010 22:10:51 -0600
Message-ID: <4B68F74B.8000708@billgatliff.com>
References: <cover.1265094517.git.bgat@billgatliff.com> <f5be82a3ae501709e8568e9fa06ab036fd363567.1265094517.git.bgat@billgatliff.com> <BD79186B4FD85F4B8E60E381CAEE1909020E99CD@mi8nycmail19.Mi8.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909020E99CD@mi8nycmail19.Mi8.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: H Hartley Sweeten <hartleys@visionengravers.com>
Cc: linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org

H Hartley Sweeten wrote:
>
> You have a couple name changes here, were they intentional?
>
>     Filename: atmel_pwm.c        -> atmel-pwm.c
>  Driver name: atmel_pwm          -> atmel_pwmc
> Module alias: platform:atmel_pwm -> platform:atmel_pwmc
>
>   

Yes.  In the datasheet, the peripheral is called the "PWMC" and so
that's why the driver name changed.  For consistency, I guess I should
have named the file atmel-pwmc.c as well.  Finally, I find it easier to
type file names with dashes rather than underscores.  :)

> Also, will this new driver still work for all the existing users of
> the old one?  Are there any platform changes that need to be done?
>   

There are platform changes necessary, to register and use the devices.  
The driver API is different from the previous code, so there are changes
there as well.  Functionally, however, the new stuff is a superset of
what the previous driver provided.


b.g.

-- 
Bill Gatliff
bgat@billgatliff.com

