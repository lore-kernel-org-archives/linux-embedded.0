From: Glenn Henshaw <thraxisp@logicaloutcome.ca>
Subject: Re: Kernel boot problem on IXP422 Rev. A
Date: Thu, 12 Jun 2008 17:28:48 -0400
Message-ID: <17882748-2E1B-4DB4-82FD-C5D5C4E62CC8@logicaloutcome.ca>
References: <1522484831@web.de> <8bd0f97a0806121304m7d00fb6dq27fa7aa37cbeb828@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v924)
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <8bd0f97a0806121304m7d00fb6dq27fa7aa37cbeb828@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: linux-embedded <linux-embedded@vger.kernel.org>


On 12-Jun-08, at 4:04 PM, Mike Frysinger wrote:

> On Thu, Jun 12, 2008 at 3:35 PM, Marcus Tangermann wrote:
>> we currently try to boot a 2.6.21 kernel
>
> time to upgrade

   Wrong answer!!!

   Many embedded devices can't upgrade kernels easily because of  
customer requirements and certifications. For example, I have worked  
on Linux based applications in the financial industry. A kernel  
upgrade here is viewed as equivalent to switching from Windows XP to  
Vista, and requires significant effort in certification testing from  
the customer's perspective. This doesn't make economic sense for  
either party.

   Often developers not working in the embedded space don't understand  
this reality.

   Helpful responses on what does/does not work would be more  
appreciated.

    ... Glenn

>
>
>> on a custom IXP422 based board.
>
> you'll have better luck asking on the arm kernel mailing lists.  they
> process this stuff every day.
> -mike
> --
> To unsubscribe from this list: send the line "unsubscribe linux- 
> embedded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Glenn Henshaw                     Logical Outcome Ltd.
e: thraxisp@logicaloutcome.ca     w: www.logicaloutcome.ca



