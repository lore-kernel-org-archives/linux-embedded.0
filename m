Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CC334BA29
	for <linux-embedded@vger.kernel.org>; Tue, 30 Sep 2025 11:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759232266; cv=none; b=LUxGMYq3b+DWZc2dbpVU/rt4UkArDdTyKKxzFYy2mZMFnQdyIRQThBYXlsRLUUzh3o/9ArOvS2SIDFWdChtY/VDghFlfdvRUDdGfo4LQOPMwHZBIp8p0q0F9Qc2LYCbH7Rq/iFQ/oertEWYLZMbh7jan2nhCaFy1o2oi6CjTkPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759232266; c=relaxed/simple;
	bh=5JD5RLB1JyfEqAtXBQsY7L69/ZKl0KwwXCvaDBMURxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zl+Hh4yr1Z99FvNbgGtcPz4HCrwA4SX0sTvrd93KzCNH7iBAXIz6tsgeps0/05GFzu5IeE1IiAGK5TYC1vIqM1OGuu9aIb5jjLifKteq2cyC39b7ZMNG4x4xlYQw56dR6Rjx8vhLko5GqVkNWnXXWRuHKC2o+MV3UtBLq1sn1xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=12ixXPM0; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="12ixXPM0"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-428f0147279so33110045ab.1
        for <linux-embedded@vger.kernel.org>; Tue, 30 Sep 2025 04:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1759232263; x=1759837063; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0p4EcZJlWaiyfJrfqqynyPwJvwAiJ1KLaZpzkXnH4U=;
        b=12ixXPM0ekKNe8lK+lfzp0tTPCydNUUeNBIWVUD4LGt0EatK/mHwZ+Cga986cZOSbj
         NfPYeVIqaH3Gi4MZxk1Q/F5X5bx6zyyZ//zJwk44uzEPkFQviGwC62obkvj0suq7cA/v
         vbMSYQcgZOXxJG8n9CENsS3uYI2Xb4qd9OxLIrfctYZwclfiTYRVFTA9oDAcrr0KBeM5
         TrihPmt6/8RI+nflXEWnQ/YAmBBBATDtcrULNgxX1ArA7de4yEuv0XOoWfsqkBPuvTcG
         XQ5HBOex9XlIiDmVYpRINxMgm7Rl3RpD6crdwc0m6GXdu6xvlcve3X48GlSvaiqZ/0FD
         jhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759232263; x=1759837063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0p4EcZJlWaiyfJrfqqynyPwJvwAiJ1KLaZpzkXnH4U=;
        b=NXKkFVeZwfyg6iE3zcw4r101C0+lPWkn8x4ZvdbeIPJna2Inbphlii7+N6pqOh1c4v
         XfyM8ih+iQgAgRo+uzTVWWF+YAp+ZnEUajIcx6Q3klV1FKNP8ypW0u2VKbmUe54tEWNY
         Oz8PywUPXSm24bEFtHu8/dgqO0UxcMeq2nmNDkAgQSV4dJV5yBRw/PauVdvBZj/wI99s
         fYD//N5hnV1ilNxNUdilE8wabuhZjxP8uAd4YypeKOGOBDXZTwS7nhOaHKBtsVlimCRd
         jErCdgs/Xld5XU/VUzUb8ld4ztIXwAYva+F32SgQ1UNzDBeJur08ZwrQV7rGRaO6hW49
         Q0rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRgR7zdn6wR1ZHcUL2aZLgT2pMXaiZo/W8GvSZgnAQebybrbJkusX3Dzjrk7Zx1RpL9u2U1MF3xwxKEOWHPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVwNUncrCA4faeLvUHeCiiQaycPUVRhEOtQmaWptKFMZhcVJL9
	tvAUk9kQHSKLHt608zC3P4vw/xmX//6jzuH0gnEEIeu3T7TeE5pMaDHWIE9eMeLc1MrYXB8bdHM
	ufe/jKuVutFq86RcvJIMyiHp8JTqvEvpv07I0D5My5YXdhEF+AqWPOOg=
X-Gm-Gg: ASbGncuKKMzxDlf42ENF4LWhIssaxlIBSgr+X/4qp9+u5unFwYzcRMP7ASNqJ/E/RZW
	YlmUG2vKXjzOLu0c8e8T4++hdG05kY9uYNPBH1lKspg+UwdTf5h7yO5B2Bm/oPE3a6xSA8Q6OmX
	7IXtOqzB0KPiuzv6VVjPXG+qvjb8M3XUS56XKniLSJjOd8jv5B9lpGpMZbcNlD7We+yYIw9vBcT
	4gFvlmrAP41bdY4/yOP3m82YohaBfN2yy5GKa5zp8daEnioArpRvYbvm4CO7EeuTL4llIOkVzI=
X-Google-Smtp-Source: AGHT+IFyg87ngGxp4lX3dqQFfcPmtl6CgW+fJ6SiLROhqdavLhpetKun79tE9cVteehpYeZgDjrLvfksQ9a7jAdQk8w=
X-Received: by 2002:a05:6e02:3a0d:b0:425:7ab4:d61 with SMTP id
 e9e14a558f8ab-4259563bb2bmr321860075ab.25.1759232263137; Tue, 30 Sep 2025
 04:37:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923-bootcache-v1-0-4f86fdc38b4e@thegoodpenguin.co.uk>
 <20250923-bootcache-v1-3-4f86fdc38b4e@thegoodpenguin.co.uk> <MW5PR13MB56323768BFB9EE9C5D18DB8DFD1BA@MW5PR13MB5632.namprd13.prod.outlook.com>
In-Reply-To: <MW5PR13MB56323768BFB9EE9C5D18DB8DFD1BA@MW5PR13MB5632.namprd13.prod.outlook.com>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Tue, 30 Sep 2025 12:37:31 +0100
X-Gm-Features: AS18NWDMVsGGzhhthtkGVDiCsEVgk6vJeepTRnUAGd5VR6VW0Ndy42dVxA79kpA
Message-ID: <CALqELGzpskB_2rdendVY7P=aWEDqY3Gx4OfpmVgUKyMYinPYPw@mail.gmail.com>
Subject: Re: [PATCH PREVIEW RFC 3/6] crypto: use bootcache to cache fastest algorithm
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: acampanella-thegoodpenguin <acampanella@thegoodpenguin.co.uk>, 
	"linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 30 Sept 2025 at 00:48, Bird, Tim <Tim.Bird@sony.com> wrote:
>
> > -----Original Message-----
> > From: acampanella-thegoodpenguin <acampanella@thegoodpenguin.co.uk>
> > Sent: Tuesday, September 23, 2025 8:24 AM
> > To: linux-embedded@vger.kernel.org
> > Subject: [PATCH PREVIEW RFC 3/6] crypto: use bootcache to cache fastest=
 algorithm
> >
> > From: Andrew Murray <amurray@=E2=80=8Athegoodpenguin.=E2=80=8Aco.=E2=80=
=8Auk> During boot xor_blocks may determine the fastest xor algorithm by us=
ing
> > do_xor_speed to perform a speed test on available algorithms. This proc=
ess can increase the overall boot time. Let's
> > From: Andrew Murray <amurray@thegoodpenguin.co.uk>
> >
> > During boot xor_blocks may determine the fastest xor algorithm
> > by using do_xor_speed to perform a speed test on available
> > algorithms. This process can increase the overall boot time.
>
> It would be good to mention the amount of time we're talking about here.
> It won't be the same value for all platforms, but you could mention the
> amount of time this takes on the platform you're working on (or on a part=
icularly
> slow machine, if you want, just to highlight where it might be a problem
> for some situations but not all.)

Good idea, thanks!

Though, it may be that a whole bunch of patches like this are
accumulated, you boot the kernel with them enabled, blindly cache all
the results (for reuse in subsequent boots), and gain a quicker boot.
I.e. it may not be necessary for users to pick and choose.


> >
> > Let's make use of bootcache to cache the result of the speed
> > test for subsequent boots.
> >
> > Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
> > ---
> >  crypto/xor.c | 29 ++++++++++++++++++++++++++++-
> >  1 file changed, 28 insertions(+), 1 deletion(-)
> >
> > diff --git a/crypto/xor.c b/crypto/xor.c
> > index f39621a57bb33c4015c06dff00e03a07716618f6..3457df0414064758a192375=
2e91642d2237af7b3 100644
> > --- a/crypto/xor.c
> > +++ b/crypto/xor.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/raid/xor.h>
> >  #include <linux/jiffies.h>
> >  #include <linux/preempt.h>
> > +#include <linux/bootcache.h>
> >  #include <asm/xor.h>
> >
> >  #ifndef XOR_SELECT_TEMPLATE
> > @@ -54,13 +55,13 @@ EXPORT_SYMBOL(xor_blocks);
> >  /* Set of all registered templates.  */
> >  static struct xor_block_template *__initdata template_list;
> >
> > -#ifndef MODULE
> >  static void __init do_xor_register(struct xor_block_template *tmpl)
> >  {
> >       tmpl->next =3D template_list;
> >       template_list =3D tmpl;
> >  }
> >
> > +#ifndef MODULE
> >  static int __init register_xor_blocks(void)
> >  {
> >       active_template =3D XOR_SELECT_TEMPLATE(NULL);
> > @@ -79,6 +80,21 @@ static int __init register_xor_blocks(void)
> >  #define BENCH_SIZE   4096
> >  #define REPS         800U
> >
> > +static struct xor_block_template * __init
> > +xor_get_template_by_name(char *fastest_name)
> > +{
> > +     struct xor_block_template *f;
> > +
> > +#define xor_speed    do_xor_register
> > +     // build a list of templates
> > +     XOR_TRY_TEMPLATES;
> > +#undef xor_speed
> > +     for (f =3D template_list; f; f =3D f->next)
> > +             if (!strcmp(f->name, fastest_name))
> > +                     return f;
> > +     return NULL;
> > +}
> > +
> >  static void __init
> >  do_xor_speed(struct xor_block_template *tmpl, void *b1, void *b2)
> >  {
> > @@ -117,9 +133,18 @@ calibrate_xor_blocks(void)
> >  {
> >       void *b1, *b2;
> >       struct xor_block_template *f, *fastest;
> > +     char cached_name[32];
> > +     int ret;
> >
> >       fastest =3D XOR_SELECT_TEMPLATE(NULL);
> >
> > +     if (!fastest) {
> > +             ret =3D bootcache_get_string("xor_blocks_fastest",
> > +                             cached_name, sizeof(cached_name));
> > +             if (!ret)
> > +                     fastest =3D xor_get_template_by_name(cached_name)=
;
>
> I presume that if CONFIG_BOOTCACHE is not defined, then ret ends up being=
 -ENOENT
> always, which makes this whole block completely evaporate. Is that right?
> In that case, do you end up with a warning about unused variable cached_n=
ame?
> Or does the compiler know not to complain about that?  Do you still end u=
p with
> space reserved on the stack?

Good spot, I'm not sure the answer but i'll find out.

Thanks,

Andrew Murray


>
> > +     }
> > +
> >       if (fastest) {
> >               printk(KERN_INFO "xor: automatically using best "
> >                                "checksumming function   %-10s\n",
> > @@ -149,6 +174,8 @@ calibrate_xor_blocks(void)
> >               if (f->speed > fastest->speed)
> >                       fastest =3D f;
> >
> > +     bootcache_set_string("xor_blocks_fastest", fastest->name);
> > +
> >       pr_info("xor: using function: %s (%d MB/sec)\n",
> >              fastest->name, fastest->speed);
> >
> >
> > --
> > 2.48.1
> >
>
