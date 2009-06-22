From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Mon, 22 Jun 2009 17:40:29 -0300
Message-ID: <20090622204028.GC29833@khazad-dum.debian.net>
References: <20090613155957.GA16220@shareable.org>
 <4A34A394.5040509@gmail.com>
 <20090621064040.GC1656@ucw.cz>
 <4A3E6F28.4090404@gmail.com>
 <20090621205245.GC3254@elf.ucw.cz>
 <2ea1731b0906212333r20deb71q2f021fc79bcc8a8e@mail.gmail.com>
 <20090622172003.GB21149@elf.ucw.cz>
 <4A3FBFF0.40006@am.sony.com>
 <20090622173704.GC21299@elf.ucw.cz>
 <4A3FC84A.6060608@gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A3FC84A.6060608@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco <marco.stornelli@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Tim Bird <tim.bird@am.sony.com>, Jamie Lokier <jamie@shareable.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

On Mon, 22 Jun 2009, Marco wrote:
> I don't think, I think it's very clear:
> 
> "In summary, PRAMFS is a light-weight, full-featured, and
> space-efficient special filesystem that is ideal for systems with a
> block of fast non-volatile RAM that need to access data on it using a
> standard filesytem interface."

It is not full-featured if it doesn't have support for hardlinks, security
labels, extended attributes, etc.  Please call it a specialized filesystem
instead, that seems to be much more in line with the comments about pramfs
use cases in this thread...

Oh, and that should be in the Kconfig help text, as well as the stuff that
goes in Documentation/*, obviously.  Maybe it already is, I didn't look.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
