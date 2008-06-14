From: "Oleg Verych" <olecom@gmail.com>
Subject: Re: about size optimizations (Re: Not as much ccache win as I expected)
Date: Sat, 14 Jun 2008 11:27:02 +0100
Message-ID: <8499950a0806140327l267186c5h621bec0ea3995842@mail.gmail.com>
References: <8499950a0806131452j5dc9574dk336e9e06ee9e1785@mail.gmail.com>
	 <1213429403.26255.298.camel@pmac.infradead.org>
	 <8499950a0806140256o45d3696o505c02b2f34d90db@mail.gmail.com>
	 <1213437917.26255.335.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kbuild-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=GmcKLYDTg0dQ7fTIKV1RDe055W6Iwc432gfKQ5gYK6A=;
        b=AKr94cIBX5Is47QH6Nb4nQWy0njc1tMzu1Jz3Y0eBjOjo8NgGPIZVHsAE7si/e9wB4
         hQTuw8MQD2RzoeXCbQq/lptq5kT4J7vBEgF7SV66bowLyukEh76SMMv5a6TD4/Br9iO9
         fYePv9Jng5JPhqINEyhUoyDW3PGqX0BokFczY=
In-Reply-To: <1213437917.26255.335.camel@pmac.infradead.org>
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux-kbuild@vger.kernel.org, segher@kernel.crashing.org

> _Sometimes_ you can just append C files together and they happen to
> work. But not always. A simple case where it fails would be when you
> have a static variable with the same name in two different files.

Afaik in the kernel global static variables are not appreciated much. I=
n any
case file scope can be easily added by s/// to its name in text compile
stage.

There are much more problems with conditional includes and other source
configuration crutches.

> The compiler will do the right thing there., while na=EFve concatenat=
ion
> of C files will not.

That was an example, of course there must be pre-cc text processing sta=
ge.

> Of course, it's _possible_ to have external text processing cope with
> this case somehow -- you'd probably feed it through the preprocessor,
> then look at the output of the preprocessor and make the variable nam=
es
> unique, perhaps?

Even before cpp. But twisted includes/ifdef's cannot be handled without=
 it.

> And then move on to the next case which is already handled in gcc...

To gain size reduction, some register-wide static variables (ints), whi=
ch are
usually for some state-handling, can be glued together, if whole pictur=
e
permits: all flags fit in limited bit range, needed shift is added text=
ually.

Again developer doing clear/documented semantics, text-based
transformations is needed. Can it be done by GCC optimizing stages?
(However Rusty may try to do that with cpp :)

> But really, I'd rather just leave it to the compiler. And it's not
> because I have some masochistic fascination with makefiles :)
--=20
sed 'sed && sh + olecom =3D love' << ''
-o--=3DO`C
 #oo'L O
<___=3DE M
--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
