From: "Grant Likely" <grant.likely@secretlab.ca>
Subject: Re: Flatten device tree & PPC linu
Date: Thu, 14 Aug 2008 00:43:05 -0600
Message-ID: <fa686aa40808132343r1b0bed8bx79252d3450c34483@mail.gmail.com>
References: <1218656903.10489.50.camel@localhost.localdomain>
	 <260388.87819.qm@web63408.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <260388.87819.qm@web63408.mail.re1.yahoo.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fundu_1999@yahoo.com
Cc: linux-embedded@vger.kernel.org

On Wed, Aug 13, 2008 at 11:44 PM, Fundu <fundu_1999@yahoo.com> wrote:
> i was reading this ...
> http://free-electrons.com/kerneldoc/latest/powerpc/booting-without-of.txt
> and was wondering if the kernel 2.4(yes 2.4) expects a flatten device tree ?

No, 2.4 does not support flattened device trees.  It is a 2.6 thing
for arch/powerpc.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
