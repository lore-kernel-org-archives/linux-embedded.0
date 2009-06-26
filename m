From: "Martin Meuli" <Martin.Meuli@gmx.ch>
Subject: Re: Saving the kernel log accross boots
Date: Fri, 26 Jun 2009 10:21:29 +0200
Message-ID: <op.uv4fzy1yq25ece@thur.netmodule.intranet>
References: <op.uv238aaxq25ece@thur.netmodule.intranet>
 <4A43968A.2020905@billgatliff.com> <20090625152954.GB8445@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090625152954.GB8445@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: linux-embedded@vger.kernel.org

On Thu, 25 Jun 2009 17:29:54 +0200, Wolfram Sang <w.sang@pengutronix.de>  
wrote:

>
>> > Before digging any deeper I would like to know if someone as a better
>> > (more general) idea.
>>
>> Could you stuff the output into an MTD device?
>
> For that, see CONFIG_MTD_OOPS.
Thak's looks great.
Right now we have a watchdog without OOPS.
>
> Regards,
>
>    Wolfram
>



-- 
MM
