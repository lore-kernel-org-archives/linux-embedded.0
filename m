From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [RFC|PATCH] Compile time printk verbosity
Date: Wed, 2 Sep 2009 05:56:34 -0400
Message-ID: <8bd0f97a0909020256o2426d932x507f1193fa01c34c@mail.gmail.com>
References: <1251844269-12394-1-git-send-email-mat@brain-dump.org> 
	<8bd0f97a0909011637p1d97b3cft91708225c7514f9f@mail.gmail.com> 
	<20090902085749.GA2736@debbook.brain-dump.org> <8bd0f97a0909020211m5636880cp6d9c0a63b7fe71e3@mail.gmail.com> 
	<20090902094343.GC2736@debbook.brain-dump.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=F4wePVjJNZXI+OaML5/ER5d2Zq58g6A+Kkndl8DOQIM=;
        b=ZvLTrLMQQqu1VtmITplDG2V7zMo6ycLBaFXSqFNscuZsbh9QAqONJiAgRuLx0vzWmO
         BxIdz5ExiYpvz5BhBgh/CM2FfVkxjUmSvIdjvyLH/27IS7BzR7rFv2m1Mr1b3w2Bd6fn
         Q93X7jgveQFyDzBjvyONcJ1zBqtND8oBAx9ZE=
In-Reply-To: <20090902094343.GC2736@debbook.brain-dump.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Marc Andre Tanner <mat@brain-dump.org>
Cc: linux-embedded@vger.kernel.org

On Wed, Sep 2, 2009 at 05:47, Marc Andre Tanner wrote:
> On Wed, Sep 02, 2009 at 05:11:12AM -0400, Mike Frysinger wrote:
>> On Wed, Sep 2, 2009 at 04:57, Marc Andre Tanner wrote:
>> > On Tue, Sep 01, 2009 at 07:37:27PM -0400, Mike Frysinger wrote:
>> >> On Tue, Sep 1, 2009 at 18:31, Marc Andre Tanner wrote:
>> >> > This series adds a configuration option to selectively compile =
out
>> >> > printk message strings based on a verbosity level.
>> >> >
>> >> > This works by wrapping printk with a macro which evaluates to a
>> >> > constant if condition which the compiler will be able to optimi=
ze
>> >> > out.
>> >> >
>> >> > However because printk might be wrapped by a macro it no longer=
 has
>> >> > a return value. This means that constructs like the following o=
nes
>> >> > don't work:
>> >> >
>> >> > =C2=A0 ((void)(SOME_RANDOM_DEBUG_FLAG && printk(...));
>> >> >
>> >> > =C2=A0 some_random_variable =3D printk(...);
>> >> >
>> >> > Therefore printk_unfiltered is introduced which is just an alia=
s
>> >> > to the standard printk function but not wrapped by a macro.
>> >>
>> >> why dont you return 0 if it gets optimized away ? =C2=A0then you =
wont have
>> >> to screw with external code at all and things "just work".
>> >
>> > This won't work because it would for example also return from func=
tions
>> > which call printk but aren't checking for the return value (which =
is
>> > the common case).
>>
>> why would it matter ?
>>
>> ({
>> =C2=A0 =C2=A0 int __printk_ret =3D 0;
>> =C2=A0 =C2=A0 if (crazy stuff you're adding)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 __printk_ret =3D printk(.....);
>> =C2=A0 =C2=A0 __printk_ret;
>> })
>
> Yes I missunderstood your "return 0" statement in the first mail.
> The same effect could also be achieved by:
>
> ((crazy stuff) ? printk(...) : 0;

while true, i thought your (crazy stuff) pretty verbose and the
tertiary operator might get swallowed in the noise.  not that it
matters that much to me as this is now a pure style choice ... your
patch, you pick.
-mike
