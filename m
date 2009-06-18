From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: [PATCH 13/14] Pramfs: Write Protection
Date: Thu, 18 Jun 2009 15:28:33 +0900
Message-ID: <20090618062833.GB2258@linux-sh.org>
References: <4A392098.9060205@gmail.com> <20090618025736.GB26531@linux-sh.org> <2ea1731b0906172324g4654966eq22cf0bdbd3eafabf@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2ea1731b0906172324g4654966eq22cf0bdbd3eafabf@mail.gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Linux FS Devel <linux-fsdevel@vger.kernel.org>, linux@arm.linux.org.uk, linux-m68k@lists.linux-m68k.org, uclinux-dist-devel@blackfin.uclinux.org, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

On Thu, Jun 18, 2009 at 08:24:35AM +0200, Marco Stornelli wrote:
> 2009/6/18 Paul Mundt <lethal@linux-sh.org>:
> > H8300 is a nommu platform, so it has no TLB to flush. Yoshinori Sato is
> > the maintainer. Consult the MAINTAINERS file, that's what it is there for.
> 
> I know the MAINTAINERS file but for h8300 there isn't an exactly
> indication (/arch/h8300 as for the other archs).
> 
The file patterns are a new thing, I guess not all of the platforms were
updated. In any event:

UCLINUX FOR RENESAS H8/300 (H8300)
P:      Yoshinori Sato
M:      ysato@users.sourceforge.jp
W:      http://uclinux-h8.sourceforge.jp/
S:      Supported

Which is basically the first thing you find when looking for H8.
