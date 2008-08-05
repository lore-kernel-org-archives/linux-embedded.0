From: "Grant Likely" <grant.likely@secretlab.ca>
Subject: Re: linux under emulator
Date: Tue, 5 Aug 2008 11:30:45 -0600
Message-ID: <fa686aa40808051030g5aeaf166q6146014e30b80982@mail.gmail.com>
References: <78ef7ce10808051028r14aa7973t3aaa3bc92132cbba@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <78ef7ce10808051028r14aa7973t3aaa3bc92132cbba@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mihaela Grigore <grigore.mihaela@gmail.com>
Cc: linux-embedded@vger.kernel.org

On Tue, Aug 5, 2008 at 11:28 AM, Mihaela Grigore
<grigore.mihaela@gmail.com> wrote:
> If I intend to run a 2.6 linux kernel under a powerpc emulator, what
> is needed to make a minimal bootable system? I mean, apart from the
> kernel itself and busybox, do I need a bootloader ? If no actual
> hardware is used and the kernel can reside directly in ram from the
> emulator's point of view (so no relocation is needed), what else is to
> be done before the kernel can start running ?

Look at the firmware linux documentation.  It should tell you
everything you need.

http://www.landley.net/code/firmware/

g.
