From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: ramfs/tmpfs for application partition
Date: Thu, 15 Jan 2009 12:04:08 -0500
Message-ID: <8bd0f97a0901150904p134def6ay66797705cab99595@mail.gmail.com>
References: <FF584854D6FFE547AB2F7515A798AC3A045716A1B4@venus.imagineil.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=csLRh2X+RVRV1uLqjq3Ey6BnibTNzFsfWItc0466uYM=;
        b=Pse1uAQ5fP86ql5BprhHCphRDDI8hUBSXITdadx2opDbly35sqaNCvfa5RHMdTJnoe
         lIKCz+4zMCR6HozhbbD4t5UvlcK5RCmqXs91YvRCB+ES1guL3DdcwoYAV96ErCOaij0L
         nAC39+XL2DIjALe8uCUHBmfVjTv4yAE0qQWJY=
In-Reply-To: <FF584854D6FFE547AB2F7515A798AC3A045716A1B4@venus.imagineil.tv>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jacob Avraham <jacob@imaginecommunications.com>
Cc: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

On Thu, Jan 15, 2009 at 11:43, Jacob Avraham wrote:
> I have a system with 128M RAM and a flash partitioned so that 10M is dedicated to initramfs image,
> 6M to application partition. And another 6M for JFFS2.
> As I have plenty of RAM, I'd like to have my application directory mounted on RAM, from a pre-populated
> filesystem that resides in the 6M application partition.
> So basically I want to use the same mechanism as initramfs, but mounted on /my/app/partition instead of root.
> Does it make sense? How do I go about and do that?

`mount -t tmpfs tmpfs /my/app/partition` ?
-mike
