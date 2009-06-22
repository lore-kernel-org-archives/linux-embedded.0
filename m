From: Marco <marco.stornelli@gmail.com>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Mon, 22 Jun 2009 20:08:14 +0200
Message-ID: <4A3FC88E.3010904@gmail.com>
References: <4A33A7A2.1050608@gmail.com> <20090613155957.GA16220@shareable.org> <4A34A394.5040509@gmail.com> <20090621064040.GC1656@ucw.cz> <4A3E6F28.4090404@gmail.com> <20090621205245.GC3254@elf.ucw.cz> <2ea1731b0906212333r20deb71q2f021fc79bcc8a8e@mail.gmail.com> <20090622172003.GB21149@elf.ucw.cz> <4A3FBFF0.40006@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=/f5u3sUf62Af2Hf1Ek5H9/CZh1zDK47mlL7yAqKlnSI=;
        b=jhuXuSMVoyxY4Yz4oohQMd0zvhrII+cGpO/fgePF/faWt9dpPKcD6PBlPAgo1BXJQY
         BEtWve02t8E56Cz02Wa8eSfEedpLA1B1jhaHfJm2nB3hAs7N4aYfh77aEEYuUQbX1I8p
         mTWqNq6zK00DfHzwbWC3p7JNl+c7LYH1NGUGM=
In-Reply-To: <4A3FBFF0.40006@am.sony.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Pavel Machek <pavel@ucw.cz>, Jamie Lokier <jamie@shareable.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

Tim Bird wrote:
> Pavel Machek wrote:
>>>> How do you handle hard-links, then?
>>> Indeed hard-links are not supported :) Due to the design of this fs
>>> there are some limitations explained in the documentation as not
>>> hard-link, only private memory mapping and so on. However this
>>> limitations don't limit the fs itself because you must consider the
>>> special goal of this fs.
>> I did not see that in the changelog. If it is not general purpose
>> filesystem, it is lot less interesting.
> 
> PRAMFS is not a general purpose filesystem. Please read
> the introductory post to this thread, or look at
> http://pramfs.sourceforge.net/ for more information.
> 
> Since the purpose of PRAMFS is to provide a filesystem
> that is persistent across kernel instantions, it is not
> designed for high speed.  Robustness in the face of
> kernel crashes or bugs is the highest priority, so
> PRAMFS has significant overhead to make the window
> of writability to the filesystem RAM as small as possible.
> 
> This is not a file system one would do kernel compiles on.
> This is where someone would keep a small amount of sensitive
> data, or crash logs that one needed to preserve over kernel
> invocations.
> 

Yep, I quite agree.

Marco
