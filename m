From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: RE: [PATCH 0/5] cramfs refresh for embedded usage
Date: Mon, 14 Aug 2017 14:17:02 -0400 (EDT)
Message-ID: <alpine.LFD.2.20.1708141405390.17016@knanqh.ubzr>
References: <20170811192252.19062-1-nicolas.pitre@linaro.org> <SG2PR06MB1165840F183EADFC3265D7D98A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com> <alpine.LFD.2.20.1708141322170.17016@knanqh.ubzr>
 <SG2PR06MB116563FCF10E2615C65080F28A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=T9vkqenupLxeZesb0/Ls4/TNZFtSmiH8THAPy3QRVa0=;
        b=jqoOHAgbFkBvy/kAJwYtfctSP9SuicZRC/z0fyasCDLfSJovq2kAfULPxCTiwmaUEC
         daXGT85nDP8ab4oXuwlr8hhu2fqSP05/v0e3L+ky7cKDdgZdpDalpO2wRg6tNC5rG1EP
         9u9wExItl7cqGrCPTjvuXu+sexuYKFnXZ62R0=
In-Reply-To: <SG2PR06MB116563FCF10E2615C65080F28A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, 14 Aug 2017, Chris Brandt wrote:

> On Monday, August 14, 2017, Nicolas Pitre wrote:
> > > I just applied the patches tried this simple test:
> > >  - tested with a Renesas RZ/A1 (Cortex-A9...so it has an MMU).
> > >  - I set the sticky bit for busybox before using mkcramfs
> > 
> > You need the newer mkcramfs I linked to in the documentation. With it
> > you don't need to play tricks with the sticky bit anymore. However you
> > need to specify -X twice (or just once for no-MMU targets) and it will
> > make every ELF files XIPable automatically.
> 
> OK. Now I am getting bigger images that makes me think all the ELF files
> are uncompressed.

Yeah. No way around that of course. I listed a few TODO items to 
mitigate the alignment losses if you have many executables.

> > > However, at this point I'm not sure how I can confirm that the XIP
> > > busybox actually executed as XIP or not.
> > 
> > Just use busybox's built-in cat command and dump the content of
> > /proc/self/maps. You should see an offset that refers to a physical
> > address within your cramfs image for those segments marked read-only and
> > executable.
> 
> It works! Pretty cool.
> 
> $ /mnt/bin/busybox cat /proc/self/maps
> 00008000-000a1000 r-xp 1b005000 00:10 18192      /mnt/bin/busybox
> 
>   (my cramfs flash image is at physical address 0x1B000000)

Good!  Independent validation is always nice.

> However, now with your mkcramfs tool, I can no longer mount my cramfs 
> image as the rootfs on boot. I was able to do that before (ie, 30 minutes 
> ago) when using the community mkcramfs (ie, 30 minutes ago).
> 
> I get this:
> 
> [    1.712425] cramfs: checking physical address 0x1b000000 for linear cramfs image
> [    1.720531] cramfs: linear cramfs image appears to be 15744 KB in size
> [    1.728656] VFS: Mounted root (cramfs_physmem filesystem) readonly on device 0:12.
> [    1.737062] devtmpfs: mounted
> [    1.741139] Freeing unused kernel memory: 48K
> [    1.745545] This architecture does not have kernel memory protection.
> [    1.760381] Starting init: /sbin/init exists but couldn't execute it (error -22)
> [    1.769685] Starting init: /bin/sh exists but couldn't execute it (error -14)

Is /sbin/init a link to busybox?
I suppose it just boots if you do mkcramfs without -X?
If so could you share your non-working cramfs image with me?


Nicolas
