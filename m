From: Jamie Lokier <jamie@shareable.org>
Subject: Re: Can I run an application compiled with gcc ABI 2.95 on a kernel compiled with gcc ABI 3.4?
Date: Fri, 15 May 2009 15:56:15 +0100
Message-ID: <20090515145615.GG8235@shareable.org>
References: <20090515115009.110740@gmx.net> <1242390699.4201.3.camel@macbook.infradead.org> <20090515135105.GC8235@shareable.org> <20090515135557.GC18976@trinity.fluff.org> <20090515143230.GE10977@mvista.com> <20090515145435.GF8235@shareable.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090515145435.GF8235@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "George G. Davis" <gdavis@mvista.com>
Cc: Ben Dooks <ben-linux@fluff.org>, David Woodhouse <dwmw2@infradead.org>, muzungu@gmx.net, linux-embedded@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk

Jamie Lokier wrote:
> Structure packing: Isn't that basically the same set of fixups that
> need to be done for 32-bit compatibility on 64-bit kernels?  Could it
> even use the same code - sneakily replacing "32" with OABI and "64"
> with EABI?

On second thoughts, I guess there may be a few fixups in common but
not much.

-- Jamie
