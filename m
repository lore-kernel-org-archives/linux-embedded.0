From: David Brownell <david-b@pacbell.net>
Subject: Re: Alignment on XScale ARM
Date: Sat, 8 Nov 2008 10:02:48 -0800
Message-ID: <200811081002.48890.david-b@pacbell.net>
References: <1733787858@web.de> <alpine.LFD.2.00.0811081029500.13034@xanadu.home>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.00.0811081029500.13034@xanadu.home>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Nicolas Pitre <nico@cam.org>, Marcus Tangermann <Marcus.Tangermann@web.de>
Cc: linux-embedded@vger.kernel.org

On Saturday 08 November 2008, Nicolas Pitre wrote:
> The ARM processor traditionally cannot access misaligned short and in=
t=20
> values in memory. =A0By using the packed attribute you tell the compi=
ler=20
> that the structure should not have inserted padding to align its=20
> members, and that accesses are to be performed wth byte accesses and =
the=20
> value reconstructed that way.

=2E.. but then when you pass "&misaligned_ptr->member" to some other
function, that other function generally won't know it needs to use
byte access.  So, be careful.  The "packed" struct attribute isn't
a panacea.

General Linux kernel policy is to use <asm/unaligned.h> accessors,
but obviously "packed" has advantages when you've got to pull
structures out of protocol buffers.  The userspace headers don't
seem to support such accessors though.

Also, the network stack is known for making assumptions about its
data being properly aligned.  See how NET_IP_ALIGN is used inside
the kernel; you might be happier aligning your RX buffers before
reading data into them from the kernel.

- Dave
