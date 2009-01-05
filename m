From: "Pekka Enberg" <penberg@cs.helsinki.fi>
Subject: Re: [PATCH V3 12/17] Squashfs: header files
Date: Mon, 5 Jan 2009 15:32:13 +0200
Message-ID: <84144f020901050532m3c8a4d68q655514051d4e259a@mail.gmail.com>
References: <E1LJnJo-0002Lz-2y@dylan.lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender
         :to:subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references
         :x-google-sender-auth;
        bh=Qa3SzxtV3Kyzb+mciis2Po7TjKzcVNJM29+Hc3oLG04=;
        b=ljer/sa4/daEJEJ0PpXYUpb9t/pB5EI9dRUPhp3/pmjOR1fnCDnIDJ/TPvgvXmlHm0
         Jo4gBGrdNt+QL2lQFG/Y73Jaii/xS+oyoOtI/sktiPRJtbAexDkohXSDcgLNnT6YohEn
         Ho+YDqPYle8LTQml08VOUN9WTjNHDvSEAqcxI=
In-Reply-To: <E1LJnJo-0002Lz-2y@dylan.lougher.demon.co.uk>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com, sfr@canb.auug.org.au

Hi Phillip,

On Mon, Jan 5, 2009 at 1:08 PM, Phillip Lougher
<phillip@lougher.demon.co.uk> wrote:
> +#define TRACE(s, args...)      pr_debug("SQUASHFS: "s, ## args)

You've probably heard this before but silly "tracing" such as:

    TRACE("Entered squashfs_fill_superblock\n");

should really be removed from the filesystem code.

> +#define ERROR(s, args...)      pr_err("SQUASHFS error: "s, ## args)
> +
> +#define WARNING(s, args...)    pr_warning("SQUASHFS: "s, ## args)

I think you're supposed to #define pr_fmt() in your header instead of
adding wrappers like these.

                        Pekka
