From: Vitaly Wool <vitalywool@gmail.com>
Subject: Re: RFC: direct MTD support for SquashFS
Date: Tue, 16 Mar 2010 22:18:31 +0300
Message-ID: <acd2a5931003161218id7b0c4bp3b6dc366e4e56d5d@mail.gmail.com>
References: <87vdcwv139.fsf@tac.ki.iif.hu> <87ljdsibqe.fsf@macbook.be.48ers.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=mH2CEZU1wDjWQ2UbEoaccFRYVn06GpJ/S4rZhKk0mkQ=;
        b=sOMnr2Bbj/e/w5WAngcnoR8ds4A6mZeFmiN+dHnba0lrCnO/ygqsnFo2MgvaQqYzBb
         vmK5pU9B7X1kDxPwyN6MWoZwfjt4V9+eaL6gX0x2yW0lZQot+/VDcfYKsnIfoLzAvCe0
         znb7FyDJHG58xij+h1ABUA409Ok+hXpTi4yoM=
In-Reply-To: <87ljdsibqe.fsf@macbook.be.48ers.dk>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Peter Korsgaard <jacmet@sunsite.dk>
Cc: Ferenc Wagner <wferi@niif.hu>, Phillip Lougher <phillip@lougher.demon.co.uk>, linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

On Tue, Mar 16, 2010 at 5:26 PM, Peter Korsgaard <jacmet@sunsite.dk> wr=
ote:
>>>>>> "Ferenc" =3D=3D Ferenc Wagner <wferi@niif.hu> writes:
> =A0Ferenc> For now, 2.6.34 gained pluggable decompressors, so this pa=
tch
> =A0Ferenc> does not apply anymore, though the main idea holds. =A0My
> =A0Ferenc> questions: is the community interested in integrating some=
thing
> =A0Ferenc> like this, should this patch transformed into something
> =A0Ferenc> acceptable, or am I a total lunatic? =A0I don't know a thi=
ng
> =A0Ferenc> about filesystem development, but willing to learn and
> =A0Ferenc> refactor. =A0Comments welcome.
>
> Nice, I have been thinking about that as well. What kind of size savi=
ngs
> are you getting with this?

Yeah, I'm interested in that as well.

~Vitaly
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
