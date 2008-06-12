From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Kernel boot problem on IXP422 Rev. A
Date: Thu, 12 Jun 2008 23:15:43 +0100
Message-ID: <1213308943.26255.212.camel@pmac.infradead.org>
References: <1522484831@web.de>
	 <8bd0f97a0806121304m7d00fb6dq27fa7aa37cbeb828@mail.gmail.com>
	 <17882748-2E1B-4DB4-82FD-C5D5C4E62CC8@logicaloutcome.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <17882748-2E1B-4DB4-82FD-C5D5C4E62CC8@logicaloutcome.ca>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glenn Henshaw <thraxisp@logicaloutcome.ca>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

On Thu, 2008-06-12 at 17:28 -0400, Glenn Henshaw wrote:
> > On Thu, Jun 12, 2008 at 3:35 PM, Marcus Tangermann wrote:
> >> we currently try to boot a 2.6.21 kernel
> >
> > time to upgrade
> 
>    Wrong answer!!!
> 
>    Many embedded devices can't upgrade kernels easily because of  
> customer requirements and certifications. For example, I have worked  
> on Linux based applications in the financial industry. A kernel  
> upgrade here is viewed as equivalent to switching from Windows XP to  
> Vista, and requires significant effort in certification testing from  
> the customer's perspective. This doesn't make economic sense for  
> either party.

If this certification was granted despite Marcus' admission that the
kernel doesn't even boot -- it dies between gunzip and start_kernel --
then I suspect it wasn't the kind of certification which takes 4 years
to achieve.

_Most_ people who are having trouble with old kernels have extremely
_bad_ reasons for not updating.

-- 
dwmw2

