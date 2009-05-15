From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Can I run an application compiled with gcc ABI 2.95 on a
 kernel compiled with gcc ABI 3.4?
Date: Fri, 15 May 2009 13:31:39 +0100
Message-ID: <1242390699.4201.3.camel@macbook.infradead.org>
References: <20090515115009.110740@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090515115009.110740@gmx.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: muzungu@gmx.net
Cc: linux-embedded@vger.kernel.org

On Fri, 2009-05-15 at 13:50 +0200, muzungu@gmx.net wrote:
> Questions:
> - Can I run an application compiled with gcc ABI 2.95 on a kernel
> compiled with gcc ABI 3.4?

Yes. The kernel ABI never changes in a backward-incompatible fashion.
Unless you try switching your kernel to ARM EABI and don't update
userspace to match -- don't do that :)

Unless you're using C++, you're more likely to have problems with
different versions of libraries, and buggy code which doesn't compile
correctly with the new compiler, than you are with GCC ABI variations
per se. Especially in the kernel<->userspace interface.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
