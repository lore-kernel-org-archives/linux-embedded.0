From: Marco <marco.stornelli@gmail.com>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Mon, 15 Jun 2009 19:44:28 +0200
Message-ID: <4A36887C.1050906@gmail.com>
References: <4A33A7A2.1050608@gmail.com> <4A3681C2.5010508@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=bG6DByrzDbUyKqeVZjQhnMjituSLn43fjp1lOKqBP5M=;
        b=qYTeB9yx1yMtNvSj4ceZIfjKhie0D/TmLS8UtkS5ww+KLa5Pp6gSvAjWfczRJgZKHm
         /dI2E1KE30vgwPpfRPCcGLhQ56kkUHrE9MpFyP0gRKUHuTfjKJds4N8UPoq679ti+GrV
         oO/HAs6OZKp7EpWc4Wooo+xdw8A1ttq2PU53c=
In-Reply-To: <4A3681C2.5010508@am.sony.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Daniel Walker <dwalker@soe.ucsc.edu>

Tim Bird wrote:
> Marco wrote:
>> This is a second attempt at mainlining Pramfs. The first attempt was
>> back in early 2004 by MontaVista. Since then the kernel code has almost
>> been completely rewritten. So my first item on the list was porting the
>> code on a recent kernel version. After that I added the XIP support.
> 
> It's very nice to see this technology revived.
> 
> Is the information at:
> http://pramfs.sourceforge.net/
> and
> http://pramfs.sourceforge.net/pramfs-spec.html
> still valid - particularly the latter?

Yep. at 99%. I've done some modifications due to the porting and there
will be some ones due to this review. I tried to talk with Steve
Longerbeam to update the site but without success. I'd like to update it.

> 
> It would be very nice to see this get mainlined.  I believe that
> one of the main uses for this is to store crash information
> over a reboot so the next kernel (not in crashing state) can have
> a better chance of dealing with it.  As such, I think
> it's important to keep the code paths for Pramfs short, synchronous,
> and unentangled with other kernel systems (block IO, page cache, etc.).
> 

Yes, I quite agree. I think that this kind of feature would be very
useful especially for the embedded world.

Marco
