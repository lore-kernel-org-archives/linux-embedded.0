From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
Subject: Re: selecting initramfs support without initrd?
Date: Thu, 26 Jun 2008 11:40:41 +0200
Message-ID: <c384c5ea0806260240k507c8349v66c87b957544465c@mail.gmail.com>
References: <alpine.LFD.1.10.0806241805390.5000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=2Y9C8ArGtgWb6niuHu6Ynccks/PA00oEx4+LQ5aAIKM=;
        b=eSAcS2gGq8/YxvjnPqphedqYrqrI6eh1s1QVsCIPgmS60qmVXuomNrawIJD6+ll2y8
         ONzFrpXlW59YqCJJoAkKNm8veKDIyQRhWDbl/IyiMsVS1pAkQZ6RJnd9GR9J3qUtvWy4
         dUzvjUargS5yL3/h/Kq8syleCkhdAA+tyQrdM=
In-Reply-To: <alpine.LFD.1.10.0806241805390.5000@localhost.localdomain>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: linux-embedded@vger.kernel.org

Hello Robert,

On Wed, Jun 25, 2008 at 12:11 AM, Robert P. J. Day
<rpjday@crashcourse.ca> wrote:
>
> perusing the early boot code, i noticed that selecting the config
> variable BLK_DEV_INITRD gives you support for both initramfs, and an
> initrd image.
>
Yes, I thought initrd to disappear when no block drivers where
selected. (because initramfs does not depend on the disk block i/o
stuff).

I may be confused and cannot check at this moment. At least I am sure
I saw the idea or a patch, maybe in the -tiny patches?

Regards,
-- 
Leon
