From: Bill Gatliff <bgat@billgatliff.com>
Subject: Generic PWM git tree rebased; please resend me your patches
Date: Thu, 21 Oct 2010 08:14:48 -0500
Message-ID: <AANLkTin=BvOXfQcrUvjmRzJ416TbJ1KsMVtZSrh0TFy=@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org, Arun Murthy <arun.murthy@stericsson.com>, sugumar <sugumar.embedded@gmail.com>

Guys:


I have a public git tree of my generic PWM framework code here:

     git://git.billgatliff.com/pwm.git

I have rebased my series against linux-2.6.36, and also cleaned up a
bunch of stuff based on reviewer feedback.  I think I have also make
things such that the existing PWM kernel code can coexist with my
framework, giving us less breakage and more time to migrate things to
the new API.

Many of you have been sending me code against the patch series I
posted here a few weeks ago, and I really do appreciate that.  Please
rebase your patches against the above repository and resend (or send
me a pull request).  I'm trying to get all of your patches merged, but
many of them aren't going in without conflicts.  Sorry for the extra
work.

Thanks very much!


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
