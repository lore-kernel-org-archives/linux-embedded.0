From: "Mike Frysinger" <vapier.adi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: YAFFS in the kernel tree?
Date: Wed, 28 May 2008 17:24:14 -0400
Message-ID: <8bd0f97a0805281424g2ceae455x774e8d66aba4ec2b@mail.gmail.com>
References: <200805290859.54396.manningc2@actrix.gen.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=GQOpP2XceD1iBDt7x2Ho4Llr8U5jRhlQYbd9in3bkUQ=;
        b=PLJfuxGLMtzzPXxjBvIe9+R1kxZaabXCEKuZSfJcllwcxl3NSsOl2JRxEDiMGTAK6CQzI5Hl+hzF3ypOmChBDyQrSV7zIzZfdxFS5fnwu8HQ+m3k2tPLd0jnuaEmepEuWHJ5mYAXltvvdcGJnDsE22/2pbUFUSmj3e8RtxAx770=
In-Reply-To: <200805290859.54396.manningc2-jEEI2ySEPisjAXWc8ALWsQ@public.gmane.org>
Content-Disposition: inline
Sender: linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Charles Manning <manningc2-jEEI2ySEPisjAXWc8ALWsQ@public.gmane.org>
Cc: linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, May 28, 2008 at 4:59 PM, Charles Manning wrote:
> I'm the author of YAFFS. This is not in the kernel tree, but is fairly easy to
> integrate by just pulling a tarball and running  patch-in script.
>
> I am curious as to whether people consider the current mechanism "good enough"
> or whether it is worth the effort trying to get YAFFS into the kernel tree.
>
> Pros I can see:
> * In tree means better testing (maybe).
> * Keeping current with kernel API changes.
>
> Cons:
> * More effort for YAFFS maintainers (me mostly).
> * Effort getting code into kernel coding style (unless I can get a waiver on
> this).

i'm pretty sure you're going to have to cull all of the
LINUX_VERSION_CODE checks.  that means the in tree yaffs code is only
going to track mainline kernel versions.  i dont know whether you
consider that a pro or con (i say it's a pro), but if you want/need
those checks, you're basically going to have to maintain two forked
versions ...
-mike
--
To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
