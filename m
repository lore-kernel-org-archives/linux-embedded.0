From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: [PATCH 06/14] Pramfs: Include files
Date: Mon, 22 Jun 2009 15:00:55 -0700
Message-ID: <4A3FFF17.9020701@am.sony.com>
References: <4A33A7EC.6070008@gmail.com> <200906221317.04166.arnd@arndb.de> <4A3FC7F1.5050108@gmail.com> <200906222033.20883.arnd@arndb.de> <4A3FDBFE.8050509@2net.co.uk> <20090622203034.GA12587@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090622203034.GA12587@uranus.ravnborg.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Chris Simmonds <chris@2net.co.uk>, Arnd Bergmann <arnd@arndb.de>, Marco <marco.stornelli@gmail.com>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Sam Ravnborg wrote:
> It is not that we are talking big and complex stuff here.

I agree completely.

> pramfs is likely to be used for small things and then having to
> fix endian on a few headers in the on-dsk format does not matter.

I agree with this, but mostly out of exhaustion.

> Not compared to the potential disadvantages.

I can see no potential disadvantages.


> It should be possible to read a file-system on your x86 64bit
> box that you wrote with your small powerpc target.
For a (NV)RAM-based filesystem??  WTH???

This is not my file system, so I don't have a dog in this
fight.  I just wanted to clarify what I thought were some
misconceptions about the use cases and priorities for the
FS.  My "advocacy" may be interfering with understanding
this system and its purpose.  I'll be quiet now.
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================
