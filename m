From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 06/14] Pramfs: Include files
Date: Tue, 23 Jun 2009 06:21:06 +0200
Message-ID: <20090623042106.GA17159@uranus.ravnborg.org>
References: <4A33A7EC.6070008@gmail.com> <200906221317.04166.arnd@arndb.de> <4A3FC7F1.5050108@gmail.com> <200906222033.20883.arnd@arndb.de> <4A3FDBFE.8050509@2net.co.uk> <20090622203034.GA12587@uranus.ravnborg.org> <4A3FFF17.9020701@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A3FFF17.9020701@am.sony.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@am.sony.com>
Cc: Chris Simmonds <chris@2net.co.uk>, Arnd Bergmann <arnd@arndb.de>, Marco <marco.stornelli@gmail.com>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

> 
> > It should be possible to read a file-system on your x86 64bit
> > box that you wrote with your small powerpc target.
> For a (NV)RAM-based filesystem??  WTH???

dd the full image - dig into it.
Usefull is you have post-mortem info there.

	Sam
