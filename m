From: Geunsik Lim <leemgs1@gmail.com>
Subject: Re: Android mainlining project
Date: Wed, 21 Dec 2011 08:27:42 +0900
Message-ID: <CABiHV1Q2SyXX3h99tAo6Z4tmd1HUsj0KaQB5OV3qqm4Yn8P2ag@mail.gmail.com>
References: <4EEFD926.3040201@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=p1ImOznXRChNyMWW+REDm+PJ4X6Pskkw9jSOhBVngQg=;
        b=d7HziklHOHZDk+z+3OZihjrI8/Wqq44aKO2NeeF5wcWY0SDEOmyg0aL9l+YCbJKUCl
         WnI6OLl5NQybD20ESeRFKae5qBRdqYTZQfPlrkKrIR9jpT/RjLzOUTjm+wIpPoXJ+byd
         BJn6RRjgo9iHH0o4Yj1XuVmpa1FQkAThKbp0A=
In-Reply-To: <4EEFD926.3040201@am.sony.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Tim Bird <tim.bird@am.sony.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

On Tue, Dec 20, 2011 at 9:39 AM, Tim Bird <tim.bird@am.sony.com> wrote:
> Hello all,
>
> I would like to announce the beginning of a project to
> make a concerted effort to mainline patches and features
> from Android into the mainline Linux kernel.
>
> At the recent kernel summit in Prague, there was a discussion
> about re-evaluating some of the Android-specific features
> that are found in Google's android kernel, and looking at
> whether and how to incorporate them into the mainline (kernel.org)
> kernel.
>
> Various parties, including individual developers, the
> CE workgroup in the Linux Foundation, and a group at Linaro
> have been working on different aspects of this. =C2=A0A wiki
> page and mailing list have been created to help coordinate
> our efforts and avoid duplication and confusion.
>
> The wiki page for this effort (still under construction) is
> at: http://elinux.org/Android_Mainlining_Project
Actually, current linux-next tree is not including ashmem(anonymous
shared memory).
When I checked android kernel features of linux-next(20111219),
Wakelock API feature(./kernel/power/*lock.c) still isn't appeared in
linux-next tree.

>
> There's a mailing list if you wish to follow discussions
> about this project. =C2=A0It's available at:
> https://lists.linuxfoundation.org/mailman/listinfo/ce-android-mainlin=
e
>
> If you are interested in this work, please join the mailing
> list or send me an e-mail. =C2=A0Some interesting things are already
> happening. =C2=A0I'll send a status message to the ce-android-mainlin=
e
> list in a day or two to let interested parties know what's currently
> going on.
>
> Regards,
> =C2=A0-- Tim
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> Tim Bird
> Architecture Group Chair, CE Workgroup of the Linux Foundation
> Senior Staff Engineer, Sony Network Entertainment
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
> Please read the FAQ at =C2=A0http://www.tux.org/lkml/



--=20
Best regards,
Geunsik Lim ( Samsung Electronics )
Blog : http://blog.naver.com/invain/
Homepage: http://leemgs.fedorapeople.org
--
To unsubscribe from this list: send the line "unsubscribe linux-kernel"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at=C2=A0 http://vger.kernel.org/majordomo-info.html
Please read the FAQ at=C2=A0 http://www.tux.org/lkml/
