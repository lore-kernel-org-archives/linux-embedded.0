From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: UIO - interrupt performance
Date: Mon, 20 Oct 2008 22:20:56 +0900
Message-ID: <20081020132056.GD20548@linux-sh.org>
References: <5958B8D7916AB84781FE0E7B57C218CB75AB98@306900ANEX2.global.avaya.com> <48FC71BD.9070703@coritel.it>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <48FC71BD.9070703@coritel.it>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Stornelli <marco.stornelli@coritel.it>
Cc: "Douglas, Jim (Jim)" <jdouglas@avaya.com>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>

On Mon, Oct 20, 2008 at 01:55:41PM +0200, Marco Stornelli wrote:
> I quite agree with Ben and Christian. I think UIO drivers are usable for
> simple devices, I think they aren't mature (will it ever be?) to use it
> with complicated devices or with strict requirement.
> 
This is a party line that has been parroted around a lot but doesn't
really have a lot of validity. UIO drivers are usable for situations
where the kernel-side handling of the device can be trivialized but still
remains a necessary component in the device support (other than IRQ
control, there is also the issue of setting up buffers and so on).

A good example of this is platforms that push their multimedia codecs and
blocks down through UIO. The reason for this is that there is a lot of
complexity, requisite support code, and general overhead associated with
supporting these blocks, most of which simply does not belong anywhere in
the kernel, even though the kernel still has to do some degree of device
support. UIO drivers are second class citizens in general, but the
argument that they only apply to simple devices is simply incorrect.

Things like uio_pdrv_genirq exist today which already allow for interrupt
control through userspace, for example. You can grep for the uio_pdrv_genirq
in-tree users to see examples of how this is used in the aforementioned
case today.
