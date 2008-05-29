From: "Paul Gortmaker" <paul.gortmaker-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: YAFFS in the kernel tree?
Date: Wed, 28 May 2008 22:25:04 -0400
Message-ID: <7d1d9c250805281925m7cfddb68nf9d591d51e52c4f1@mail.gmail.com>
References: <200805290859.54396.manningc2@actrix.gen.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=Kwa83eqj1cClr4p9WWXr54lQjxbSj8Mv5BFltS7cDBs=;
        b=AfqAVBeIVBluPBB+I3IH4JuU9DUFQoHyojTI7vN4Ip0WWeCJsiyee6K7W140lWsMU5Wf8vX+BAck1L3biCezqMEIXrOMRhGJDUazFsIU0d7SmKLPqU/5cIl2TfPDbidRox80zq9jsTBMoMOgQOJsB9MGJFGjk9YrkGBg1a91+Hs=
In-Reply-To: <200805290859.54396.manningc2-jEEI2ySEPisjAXWc8ALWsQ@public.gmane.org>
Content-Disposition: inline
Sender: linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Charles Manning <manningc2-jEEI2ySEPisjAXWc8ALWsQ@public.gmane.org>
Cc: linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, May 28, 2008 at 4:59 PM, Charles Manning
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

 * exposes your code to folks who otherwise might not be
aware it even exists.

>
> Cons:
> * More effort for YAFFS maintainers (me mostly).

It may look like this is the case initially, but really it becomes a case of
less effort for maintainers (you), once you get over the initial blip/hump of
knocking things into shape and getting it merged.  If you are out of tree,
you have to be aware of all the API changes and subtle dependencies that
may lurk from a side effect of some other changeset.  If you are in-tree and
Al Viro discovers some wide-sweeping bug, he will most likely fix your stuff
for you before you were even aware there was a problem....   :-)

> * Effort getting code into kernel coding style (unless I can get a waiver on
> this).

No get out of jail free card here, for anyone.  Sorry.

Paul.


>
> Thoughts??
>
> -- CHarles
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
