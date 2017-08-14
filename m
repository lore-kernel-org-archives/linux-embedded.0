From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: RE: [PATCH 0/5] cramfs refresh for embedded usage
Date: Mon, 14 Aug 2017 13:31:47 -0400 (EDT)
Message-ID: <alpine.LFD.2.20.1708141322170.17016@knanqh.ubzr>
References: <20170811192252.19062-1-nicolas.pitre@linaro.org> <SG2PR06MB1165840F183EADFC3265D7D98A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=h/491wV3gmDcGmjdPKlDZROwXM3dpCUm36HjIMNMwhM=;
        b=O7oIYfZNv5YGyaAZT3YrcAN7accKdQmBHABvvmS5aOpm0+1QSO534ijE7AoftBWDtu
         eLu6ex9oeCwe0/9T+6K6peCntKXFDXXIgRL+UPuV0NbqCcz44bILp0NzebHtgG9IWUpK
         M5sVigbX2gvt+iYFgcy2HFwWp/Qgg3uKo13Nw=
In-Reply-To: <SG2PR06MB1165840F183EADFC3265D7D98A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, 14 Aug 2017, Chris Brandt wrote:

> On Friday, August 11, 2017, Nicolas Pitre wrote:
> > This series brings a nice refresh to the cramfs filesystem, adding the
> > following capabilities:
> > 
> > - Direct memory access, bypassing the block and/or MTD layers entirely.
> > 
> > - Ability to store individual data blocks uncompressed.
> > 
> > - Ability to locate individual data blocks anywhere in the filesystem.
> > 
> > The end result is a very tight filesystem that can be accessed directly
> > from ROM without any other subsystem underneath. Also this allows for
> > user space XIP which is a very important feature for tiny embedded
> > systems.
> 
> 
> 
> I just applied the patches tried this simple test:
>  - tested with a Renesas RZ/A1 (Cortex-A9...so it has an MMU).
>  - I set the sticky bit for busybox before using mkcramfs

You need the newer mkcramfs I linked to in the documentation. With it 
you don't need to play tricks with the sticky bit anymore. However you 
need to specify -X twice (or just once for no-MMU targets) and it will 
make every ELF files XIPable automatically.

>  - booted (with squashfs) and mounted the cramfs image
>  - confirmed that the sticky bit was still set on busybox
>  - was able to execute busybox in the cramfs image
> 
> 
> However, at this point I'm not sure how I can confirm that the XIP 
> busybox actually executed as XIP or not.

Just use busybox's built-in cat command and dump the content of 
/proc/self/maps. You should see an offset that refers to a physical 
address within your cramfs image for those segments marked read-only and 
executable.


Nicolas
