From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [RFC|PATCH] Compile time printk verbosity
Date: Tue, 1 Sep 2009 19:37:27 -0400
Message-ID: <8bd0f97a0909011637p1d97b3cft91708225c7514f9f@mail.gmail.com>
References: <1251844269-12394-1-git-send-email-mat@brain-dump.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=MHo6ntOCYnyy1wVMLcpJAlmBIHpFW11V6FmqKkJwbVY=;
        b=YT6muQKGS10TePdVKOLkijcSha7UgB/gFvQ4W5T72kD0BDdbr5OG5kIxeMov9hYA6u
         cxNRrnqzFc8+vcszmp4czG6uNZlGnm2tqZ39zFjKDBsHwyBrCmjhHu8wAtbeA+VrBexm
         vqZOk+guGz2YfVndMo1T8PpMrVh3YykKYj/SI=
In-Reply-To: <1251844269-12394-1-git-send-email-mat@brain-dump.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Marc Andre Tanner <mat@brain-dump.org>
Cc: linux-embedded@vger.kernel.org

On Tue, Sep 1, 2009 at 18:31, Marc Andre Tanner wrote:
> This series adds a configuration option to selectively compile out
> printk message strings based on a verbosity level.
>
> This works by wrapping printk with a macro which evaluates to a
> constant if condition which the compiler will be able to optimize
> out.
>
> However because printk might be wrapped by a macro it no longer has
> a return value. This means that constructs like the following ones
> don't work:
>
> =C2=A0 ((void)(SOME_RANDOM_DEBUG_FLAG && printk(...));
>
> =C2=A0 some_random_variable =3D printk(...);
>
> Therefore printk_unfiltered is introduced which is just an alias
> to the standard printk function but not wrapped by a macro.

why dont you return 0 if it gets optimized away ?  then you wont have
to screw with external code at all and things "just work".
-mike
