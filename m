From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [[RFC] 3/5] Expunge old Atmel PWMC driver, replacing it with
 one that conforms to the PWM API
Date: Mon, 19 Oct 2009 21:02:26 -0500
Message-ID: <4ADD1A32.70002@billgatliff.com>
References: <1255984366-26952-1-git-send-email-bgat@billgatliff.com> 	<1255984366-26952-2-git-send-email-bgat@billgatliff.com> <1255984366-26952-3-git-send-email-bgat@billgatliff.com> 	<1255984366-26952-4-git-send-email-bgat@billgatliff.com> <8bd0f97a0910191534y12f9b6b9g1181507b20b50f80@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <8bd0f97a0910191534y12f9b6b9g1181507b20b50f80@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: linux-embedded@vger.kernel.org

Mike Frysinger wrote:
>> +       ap->clk = clk_get(&pdev->dev, "pwm_clk");
>> +       if (IS_ERR(ap->clk)) {
>> +               pr_info("%s: clk_get error %ld\n",
>> +                       ap->pwm.bus_id, PTR_ERR(ap->clk));
>> +               ret = -ENODEV;
>> +               goto err_clk_get;
>>     
>
> shouldnt it be:
>   ret = PTR_ERR(ap->clk);
>   

Probably, because it's preferable to return the actual error code when 
it's known, rather than translating all error codes to -ENODEV.  Good catch.


b.g.

-- 
Bill Gatliff
bgat@billgatliff.com
