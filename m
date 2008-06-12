From: Glenn Henshaw <thraxisp@logicaloutcome.ca>
Subject: Re: Cross Compiler and loads of issues
Date: Thu, 12 Jun 2008 15:30:10 -0400
Message-ID: <68F48B2E-2562-4AC6-BC3E-B774B47958B5@logicaloutcome.ca>
References: <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v924)
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: Shaz <shazalive@gmail.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>


On 12-Jun-08, at 1:52 PM, Shaz wrote:

> Hi,
>
> I have been following "Re: [PATCH 0/1] Embedded Maintainer(s)" and
> felt like asking that is there one good way to get a cross compiler
> work. I tried buildroot, scratchbox and even openMoko with
> openEmbedded but all of them had lots of issues and don't know which
> will be the best alternative.

   I've built compiler chains for clients using buildroot.

 From my notes:
  * download buildroot and expand it in your home directory
  * make menuconfig - select kernel, compiler, and uclibc versions.  
(2.4.27, 3.4.3, and 0.9.28 respectively), set target to final  
destination ,i.e., /opt/armeb as you can't move the compiler once built
  * make - this will download compiler, etc and build it. It will most  
likely fail the first time.
  * patches to apply (http://bugs.uclibc.org/view.php?id=51 - fix LFS  
requirements)
  * make - again to finish

    ... Glenn


-- 
Glenn Henshaw                     Logical Outcome Ltd.
e: thraxisp@logicaloutcome.ca     w: www.logicaloutcome.ca



