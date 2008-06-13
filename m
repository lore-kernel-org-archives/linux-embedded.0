From: Glenn Henshaw <thraxisp@logicaloutcome.ca>
Subject: Re: Kernel boot problem on IXP422 Rev. A
Date: Thu, 12 Jun 2008 20:13:14 -0400
Message-ID: <F6681C94-3631-48E6-9707-68DDA4316908@logicaloutcome.ca>
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
>> on a custom IXP422 based board.
>

   What bootloader are you using? It may be that the memory controller  
is initialized improperly.

   For other resources, try the NSLU2 groups/pages. It runs the same  
processor and kernel (actually many 2.6 variants).

     ... Glenn
-- 
Glenn Henshaw                     Logical Outcome Ltd.
e: thraxisp@logicaloutcome.ca     w: www.logicaloutcome.ca



