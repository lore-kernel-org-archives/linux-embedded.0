From: "Alexey Zaytsev" <alexey.zaytsev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: YAFFS in the kernel tree?
Date: Thu, 29 May 2008 02:15:27 +0400
Message-ID: <f19298770805281515u1602e18enbad78fccfda24b02@mail.gmail.com>
References: <200805290859.54396.manningc2@actrix.gen.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=5+1uJcbPPxrtgkfTOsxwD9dmHYNtHTnNgZyzead/f2M=;
        b=u64HV62azgXXT99l7K+h7RQ9oIX/FxMIy4fw9jjpM306CsKS2AFC9ZQ8uUjsJ+lwk8m5ORc4+LLfG4CNZJV3Y6aD7XK7g99YHAfzzlsDcsaCGwIWZ2Ov09dNj89IIPixWGrLDPYmE+Mz+Ri+o19xa53DroJhPdb70e72q7nqOEo=
In-Reply-To: <200805290859.54396.manningc2-jEEI2ySEPisjAXWc8ALWsQ@public.gmane.org>
Content-Disposition: inline
Sender: linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Charles Manning <manningc2-jEEI2ySEPisjAXWc8ALWsQ@public.gmane.org>
Cc: linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, May 29, 2008 at 12:59 AM, Charles Manning
<manningc2-jEEI2ySEPisjAXWc8ALWsQ@public.gmane.org> wrote:
> Hi
>
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
>
> Thoughts??

We at protei (protei.ru) are using yaffs for over a year now, switched from
jffs2, mostly because of the huge mount time difference. Have yet to
see any serious problems.

The process of patching the kernel with yaffs is quite smooth, but you
loose the ability to track the changes made in yaffs. We've got a git
kernel tree, to which we add our stuff, and also periodically repatch it
with a fresh yaffs. The problem is, all you can see later is a commit
labelled "A Yaffs update", revealing little details on the contents. Not cool.

If anything, I'd ask for merging this files sytem rather sooner than later,
as it should be useful for many embedded developers and touches
nothing outside the fs/yaffs2 directory.

The only thing that bothers me, is the licensing. Currently is seems
like Apleph1 is selling license exceptions for yaffs. Either this should
become impossible after yaffs gets any commits from the community,
or you will have to maintain a separate version without such commits.

> -- CHarles
> --

And thank you for working on yaffs and being positive about merging it
into the mainline kernel.
--
To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
