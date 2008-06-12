From: Craig Hollabaugh <craig@hollabaugh.com>
Subject: Re: Kernel boot problem on IXP422 Rev. A
Date: Thu, 12 Jun 2008 15:43:26 -0600
Message-ID: <1213307006.3592.10.camel@hendrix.hollabaugh.com>
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

Glenn,
I totally agree with your certification statement statement as a legit
reason to not upgrade. I once worked for a aircraft lighting supplier,
their FAA certification testing process took about 4 years. Going
through the cert process makes one more resistant to change.
Craig




On Thu, 2008-06-12 at 17:28 -0400, Glenn Henshaw wrote:
> On 12-Jun-08, at 4:04 PM, Mike Frysinger wrote:
> 
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
> 
>    Often developers not working in the embedded space don't understand  
> this reality.
> 
>    Helpful responses on what does/does not work would be more  
> appreciated.
> 
>     ... Glenn
> 
> >
> >
> >> on a custom IXP422 based board.
> >
> > you'll have better luck asking on the arm kernel mailing lists.  they
> > process this stuff every day.
> > -mike
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux- 
> > embedded" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
-- 
Dr. Craig Hollabaugh, craig@hollabaugh.com, 970 240 0509
Author of Embedded Linux: Hardware, Software and Interfacing
www.embeddedlinuxinterfacing.com

