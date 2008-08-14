From: David VomLehn <dvomlehn@cisco.com>
Subject: Re: Flatten device tree & PPC linu
Date: Thu, 14 Aug 2008 10:27:55 -0700
Message-ID: <48A46B1B.9010006@cisco.com>
References: <1218656903.10489.50.camel@localhost.localdomain>	 <260388.87819.qm@web63408.mail.re1.yahoo.com> <fa686aa40808132343r1b0bed8bx79252d3450c34483@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <fa686aa40808132343r1b0bed8bx79252d3450c34483@mail.gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=933; t=1218734882; x=1219598882;
	c=relaxed/simple; s=sjdkim2002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn@cisco.com;
	z=From:=20David=20VomLehn=20<dvomlehn@cisco.com>
	|Subject:=20Re=3A=20Flatten=20device=20tree=20&=20PPC=20lin
	u
	|Sender:=20;
	bh=b9IvXNU/1YOxJYjZhoUmvkg9Eo3b1By1NVW1a7s+uNY=;
	b=BxM88FtLRrnSpP/sbKWnLCo2hlKiIRyOvxW0bWI+O/jV5mtWxsYgUVB0Xs
	yN74aUKrhpcnc12sFhA0ObNq3pJ7RsNgmjxafyXruf+KLdSNuHyHMptqrAsK
	SNl04InSFc;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Grant Likely <grant.likely@secretlab.ca>
Cc: fundu_1999@yahoo.com, linux-embedded@vger.kernel.org

Grant Likely wrote:
> On Wed, Aug 13, 2008 at 11:44 PM, Fundu <fundu_1999@yahoo.com> wrote:
>> i was reading this ...
>> http://free-electrons.com/kerneldoc/latest/powerpc/booting-without-of.txt
>> and was wondering if the kernel 2.4(yes 2.4) expects a flatten device tree ?
> 
> No, 2.4 does not support flattened device trees.  It is a 2.6 thing
> for arch/powerpc.

It came originally from the PowerPC world, but there is now Sparc implementation 
in the kernel tree. We're working on using device tree for MIPS and, according to 
a participant at the OLS Device Tree BOFS, someone in the ARM world is also 
working on an implementation. I don't know how much work it would be to backport 
to 2.4, but my guess is that it's pretty independent of the kernel version.

There is now a device tree mailing list independent of PowerPC. You can find more 
info at https://ozlabs.org/mailman/listinfo/devicetree-discuss
