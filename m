From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [RFC|PATCH] Compile time printk verbosity
Date: Wed, 2 Sep 2009 05:11:12 -0400
Message-ID: <8bd0f97a0909020211m5636880cp6d9c0a63b7fe71e3@mail.gmail.com>
References: <1251844269-12394-1-git-send-email-mat@brain-dump.org> 
	<8bd0f97a0909011637p1d97b3cft91708225c7514f9f@mail.gmail.com> 
	<20090902085749.GA2736@debbook.brain-dump.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=HIfG3x66tiSZQ5c3YBDc5Y93M02UpS+iFyXSSvzi5h0=;
        b=t06oN4KVYrfIN33XJzYU8WhHEeuHqmIaaxYpqUxMHd/Y5deMEd3Q5Z1Tu1kFmBBnMl
         Qxt8kXQUg8nIOfHDcOi0lPbMl5Zv6tn5tS9LWxkR6xar4McNL1qoCIUL+xle8XHzib9H
         Q4Jqt3CL1njd3cNLrSNM+g9z3p3e3/PgmF7LQ=
In-Reply-To: <20090902085749.GA2736@debbook.brain-dump.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Marc Andre Tanner <mat@brain-dump.org>
Cc: linux-embedded@vger.kernel.org

On Wed, Sep 2, 2009 at 04:57, Marc Andre Tanner wrote:
> On Tue, Sep 01, 2009 at 07:37:27PM -0400, Mike Frysinger wrote:
>> On Tue, Sep 1, 2009 at 18:31, Marc Andre Tanner wrote:
>> > This series adds a configuration option to selectively compile out
>> > printk message strings based on a verbosity level.
>> >
>> > This works by wrapping printk with a macro which evaluates to a
>> > constant if condition which the compiler will be able to optimize
>> > out.
>> >
>> > However because printk might be wrapped by a macro it no longer ha=
s
>> > a return value. This means that constructs like the following ones
>> > don't work:
>> >
>> > =C2=A0 ((void)(SOME_RANDOM_DEBUG_FLAG && printk(...));
>> >
>> > =C2=A0 some_random_variable =3D printk(...);
>> >
>> > Therefore printk_unfiltered is introduced which is just an alias
>> > to the standard printk function but not wrapped by a macro.
>>
>> why dont you return 0 if it gets optimized away ? =C2=A0then you won=
t have
>> to screw with external code at all and things "just work".
>
> This won't work because it would for example also return from functio=
ns
> which call printk but aren't checking for the return value (which is
> the common case).

why would it matter ?

({
    int __printk_ret =3D 0;
    if (crazy stuff you're adding)
        __printk_ret =3D printk(.....);
    __printk_ret;
})
-mike
