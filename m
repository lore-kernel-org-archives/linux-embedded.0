From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 5/5] printk: provide a filtering macro for printk
Date: Thu, 3 Sep 2009 08:29:53 +0200
Message-ID: <2ea1731b0909022329hb0f5eb7q2ea6ad29088d4dd0@mail.gmail.com>
References: <1251901505-4313-1-git-send-email-mat@brain-dump.org>
	 <1251901505-4313-6-git-send-email-mat@brain-dump.org>
	 <4A9EA0E3.8000603@gmail.com>
	 <20090902172724.GA5811@debbook.brain-dump.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=eLjCmNICkB7VbbFQ0Vw9+BlAWJeCFF9YkosLazF67es=;
        b=lhUwFSyEn7Rv3dzcEH3UPW8u0d3XeWCSO2RWM1/EZpNyaDpB414RdWgqlaN7xNxS3z
         LBm7o1XrTJCjuMBtLZuRHWk8QjnxTj1PxAd+MMSvblU49PT6UgQDrd5YlSVjrYZleyxR
         Cy08+JvW7YppG5uGBO7/fMcpWycfNF9BxIKCw=
In-Reply-To: <20090902172724.GA5811@debbook.brain-dump.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Marc Andre Tanner <mat@brain-dump.org>
Cc: linux-embedded@vger.kernel.org

2009/9/2 Marc Andre Tanner <mat@brain-dump.org>:
> On Wed, Sep 02, 2009 at 06:44:19PM +0200, Marco Stornelli wrote:
>>
>>
>> Marc Andre Tanner ha scritto:
>> > +#define printk(fmt, ...) ( =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 \
>>
>> Shouldn't it be an and?
>
> Don't think so. If the expression isn't constant we are unable to fil=
ter it
> and therefore printk is called anyway. However if the expression is c=
onstant
> the second part of the condition is evaluated and we filter based on =
the
> verbosity level.
>

Yes, you're right.

Marco
