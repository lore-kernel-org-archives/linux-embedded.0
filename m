From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 06/14] Pramfs: Include files
Date: Mon, 22 Jun 2009 22:30:34 +0200
Message-ID: <20090622203034.GA12587@uranus.ravnborg.org>
References: <4A33A7EC.6070008@gmail.com> <200906221317.04166.arnd@arndb.de> <4A3FC7F1.5050108@gmail.com> <200906222033.20883.arnd@arndb.de> <4A3FDBFE.8050509@2net.co.uk>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A3FDBFE.8050509@2net.co.uk>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Simmonds <chris@2net.co.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Marco <marco.stornelli@gmail.com>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On Mon, Jun 22, 2009 at 08:31:10PM +0100, Chris Simmonds wrote:
> Arnd Bergmann wrote:
> >On Monday 22 June 2009, Marco wrote:
> >>Sorry, I meant it's not currently possible. At the moment the only way
> >>to use it as rootfs it's to copy all the data in an already mounted
> >>(empty) ram partition and reboot. However it's not my first item on my
> >>todo list because I think that it's possible to use it as rootfs but it
> >>isn't the standard use for this fs.
> >
> >Well, it doesn't have to work right away. What I'm asking to
> >define the data structures in a way that keeps the layout stable
> >across kernel updates. Since a future version of the file system
> >might support cross-endian image creation, it would be good to
> >define the data structures in a fixed endian mode already, so
> >you don't have to change it in the future.
> >
> >	Arnd <><
> >--
> >To unsubscribe from this list: send the line "unsubscribe linux-embedded" 
> >in
> >the body of a message to majordomo@vger.kernel.org
> >More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> 
> I disagree: that adds an unnecessary overhead for those architectures 
> where the cpu byte order does not match the data structure ordering.
It is not that we are talking big and complex stuff here.
pramfs is likely to be used for small things and then having to
fix endian on a few headers in the on-dsk format does not matter.
Not compared to the potential disadvantages.

It should be possible to read a file-system on your x86 64bit
box that you wrote with your small powerpc target.

	Sam
