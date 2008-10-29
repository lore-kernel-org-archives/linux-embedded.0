From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: [PATCH V2 14/16] Squashfs: Kconfig entry
Date: Wed, 29 Oct 2008 05:15:05 +0300
Message-ID: <20081029021505.GA977@x200.localdomain>
References: <E1Kv0C4-0006Hm-Jz@dylan>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:references:mime-version:content-type:content-disposition
         :in-reply-to:user-agent;
        bh=n/vWImEXcpm0JlgYBJnG0KS5A0C8HJY8m5GIiOfuVu0=;
        b=dUfuo596p0zKbDvyF76KbYc4WyjjVZ6jhIjnH+pQmWPpEyZtMP5Rjhs/WuPU8rgHxQ
         DvvbT1deldx9NFP3qpX3ISeH4dBWKLaJa1fH2emK7zilPHvQzUug4Xbdiln496tQroCy
         tO7cFn8NTmJwmhUlC0bzDVJuDlXOjJilwMdd8=
Content-Disposition: inline
In-Reply-To: <E1Kv0C4-0006Hm-Jz@dylan>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com

On Wed, Oct 29, 2008 at 01:49:56AM +0000, Phillip Lougher wrote:
>  fs/Kconfig |   52 ++++++++++++++++++++++++++++++++++++++++++++++++++++

> --- a/fs/Kconfig
> +++ b/fs/Kconfig
> @@ -931,6 +931,58 @@ config CRAMFS
>  
>  	  If unsure, say N.
>  
> +config SQUASHFS

No, no, no. Add fs/squashfs/Kconfig and source it from fs/Kconfig.
