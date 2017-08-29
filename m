From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: RE: [PATCH v2 4/5] cramfs: add mmap support
Date: Tue, 29 Aug 2017 16:00:26 -0400 (EDT)
Message-ID: <nycvar.YSQ.7.76.1708291552240.2606@knanqh.ubzr>
References: <20170816173536.1879-1-nicolas.pitre@linaro.org> <20170816173536.1879-5-nicolas.pitre@linaro.org> <20170828064632.GA26136@ZenIV.linux.org.uk> <nycvar.YSQ.7.76.1708280914260.2606@knanqh.ubzr> <20170828142306.GJ5426@ZenIV.linux.org.uk>
 <nycvar.YSQ.7.76.1708281058590.2606@knanqh.ubzr> <SG2PR06MB1165FE414425AFD1C64E7CD78A9F0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=4ncVpAbhEUrnM5zLADF+15CQqepOaBh3BdBg4ykHIQw=;
        b=B+KgGkriCd66M4x0LD1TB+Js/OHUY4EnHvA9tYpAuDePazdG5v8uKi/Hm7oReTK+rZ
         9lwgkVhMyOzJj+S53wZt4bZDbnEZuBD6nZg7dBKLv7fYuTBU2Bi+YKrUZTSlmbA5fN+j
         PNyRtfL+zpg9UBiEO+9anbiOz71wB3gSj9lO4=
In-Reply-To: <SG2PR06MB1165FE414425AFD1C64E7CD78A9F0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, 29 Aug 2017, Chris Brandt wrote:

> On Monday, August 28, 2017, Nicolas Pitre wrote:
> > OK I moved the lock promotion right at the beginning _before_ validating
> > the split point. Also got a reference on the file to make sure that
> > hasn't changed too.
> > 
> > > While we are at it, what happens if you mmap 120Kb, then munmap() the
> > middle
> > > 40Kb.  Leaving two 40Kb VMAs with 40Kb gap between them, that is.  Will
> > your
> > > ->vm_private_data be correct for both?
> > 
> > It wouldn't, but I now changed it to contain absolute values so now it
> > will. And if the split point lands in the hole then the code just
> > readjusts the pgoff at the beginning of the remaining part.
> > 
> > Here's the revised patch:
> 
> 
> For whatever it's worth, as soon as I moved to 4.13-rc7,
> CONFIG_CRAMFS_PHYSMEM=y crashes my XIP_KERNEL system before it can even 
> get to any console output.
> 
> (both the old patch and the new patch)
> 
> If CONFIG_CRAMFS_PHYSMEM is not set, my XIP system boots fine.
> 
> However, if I boot -rc7 as a uImage, the new patch works just as good as
> the old patch.

When not a uImage, do you mean by that a XIP kernel?  If so you should 
know by now from that other thread on LAK that the XIP linker script is 
broken and probably just worked by luck till now. Still, if you could 
bisect between -rc4 and -rc7 and pinpoint the change that makes it not 
work that would be better than speculations.


Nicolas
