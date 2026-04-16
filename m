Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657F739DBD0
	for <linux-embedded@vger.kernel.org>; Thu, 16 Apr 2026 10:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776336736; cv=none; b=LHZ3N0yxgyQkAYzctJFQLGvHrjZYAeFosl4hLiTsFErX5bEwpxNzN3Zj+/EG7gNM1qXE29Bm/VthHW7vj5l+8ZN8S6USyBTzclzToGJHYqUakXdXyEulaeo3tMQVONs7MikDLSsBmOxDS5eCMFjQPwvcG82aucRMgSw6Leu+/mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776336736; c=relaxed/simple;
	bh=hVmr3mjQuyKk378a0s4h0Va+RBp4VNKdqT8ntjnlWM4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ikvDkFveWNgSQ/IRTbr3HL5sRCTCN9w9nb5ceyOvgyw8t7GaY/uLtxKvvwFEaG7mlM1TJgsnVVEEgTkrmObbeaAcQdBoDTbN+bCnbyCPsbb1+0N1CzBHNEOkk4fkFFPiWV135QPIDlSkU5VtP7WJwzzuZie2zkMoLbNfm9TIzh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gg/ibIuu; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gg/ibIuu"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488c2690057so79228835e9.0
        for <linux-embedded@vger.kernel.org>; Thu, 16 Apr 2026 03:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776336734; x=1776941534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7vHKX90MoXsm8fwyGFV9MhIDI35q/OCMxxuUps36Zg=;
        b=Gg/ibIuu9WA7ZA8hnpRRnYPXdXGcxZM9m4zHA8wyyMIhY3h2QuJp258fvvPBFT3Fux
         8R+ZLm07ggA8E56NV+9he7QLaxKT1JIDCtXVZw9sDrsVMj9xI21JL3OCsGMxxSYQ8Z+a
         MLRIedl19sgAnx1kfI8TmicfRuH6dgjkZmVuiXXS/lkimjvX8/u3aCr55hxVKQNzAL6+
         SnFTg1FKsEF6rCune21co3DlYw1qYPgTkDcxwkv5VHigJkLI7Xu1PPMs6O0cEiIj4bY+
         BcMHwS96xE4tXbqqH6UG/ph0S+4OP3fksGPG4G+8wQfO0QxaAsfR1YAxe2QLBkheT8BT
         H/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776336734; x=1776941534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M7vHKX90MoXsm8fwyGFV9MhIDI35q/OCMxxuUps36Zg=;
        b=njDQ4WTxcPasJN/cKwHTuLmGiIgHrMnt9cSF7NKMa/gHc1SMb0JNfGXs5hpZIlFDS+
         EQKOZ5tLlFtIBQ2uhcqjRSEGI2L7+zg311WyOVwqWOVBWLhAFsELRcio/vbfQxMfaGbB
         EzntfqbMXgsTsc/FS58rFYl1c8yuDSgGhuvwyYGSZWxIftJdGhMO58O38qKhad3aCKxm
         XzCznzCyDtoACOlDWy//x0Oul9/3ulLEC5OWLgd9P6t1NpA4v4r0TnMEt133BOMZDRmX
         aY/KXI6U7+0F39cdSX14msFUYJ5egHZaOSEI0gplOE4mFcTgs5L9wrXwptClrriq9EaK
         4Kww==
X-Forwarded-Encrypted: i=1; AFNElJ9uoDa4R6IWdUqaThLov9h9nw47UMRAI2rrJAItwCHgPyFOhw86x9eLTds7N5nKdM2GhBlRICDYYsLpFP2NCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQH1FsP4QPXv5juD4+dwTAyxxvHUR7Zi7QPDV9oJOi3tzM1EcV
	f8bt/Z36wo5KvI5RQ/dMPGcPjgRMNqCsg9U/nS+mIYmZGIS3alV1RA5L
X-Gm-Gg: AeBDieu+3yiqr8IaNeuhL5ickClKDq3mr1C8BMnve++VEpgNYfhpEwpJ1DrL5hEXkRX
	bobz0TWHkVw3527lebCPS1JvmBdz0fVZOTcwxeZHkAFFkEjkqRV0nO8bwUQXZpdyBcrvQ979Yhn
	uzrSvVDyxBoKoMlHT8JmVduR7D5ET83faah2Tn6a794ijF4FT3FYL5mDkaLOM1wxFO0XJnQlo9n
	JcTI62o92wJpSHSZ2lPyMLN8Ylgj8bujwDa7OhKlWcVOQu/fPsAmzCGcXsY8+43FnoTlWPY6r8l
	FBPQyLdwuogAui1hWem5Bk/hdE+CUHa5PmYohCFHeQWTkvcpGNRsvvqgJL5YogaGRQQuWjJ/pXz
	Z0IVwizhXqHWj5tg94Jdvacd3vE0WzN/U2m5WqV7SUKZgNIa9ThRLhbSdn+3ai726PwWhnnCWzz
	7sIL4+R0UPwcnvOEVIacwWc/a0OJ3VtKQ8u/Ro3xuIAfHeEdtxkFo3bsrh0Q2pM0kd
X-Received: by 2002:a05:600d:1:b0:488:8bdd:cfcc with SMTP id 5b1f17b1804b1-488d6772785mr310820585e9.0.1776336733668;
        Thu, 16 Apr 2026 03:52:13 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f0ec9687sm44981195e9.32.2026.04.16.03.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 03:52:13 -0700 (PDT)
Date: Thu, 16 Apr 2026 11:52:11 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "Bird, Tim"
 <Tim.Bird@sony.com>, Thomas Gleixner <tglx@kernel.org>, "pmladek@suse.com"
 <pmladek@suse.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "john.ogness@linutronix.de" <john.ogness@linutronix.de>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "francesco@valla.it"
 <francesco@valla.it>, "shashankbalaji02@gmail.com"
 <shashankbalaji02@gmail.com>, "linux-embedded@vger.kernel.org"
 <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in
 early boot
Message-ID: <20260416115211.20d04a1f@pumpkin>
In-Reply-To: <CAJGKYO6As=rYv2TfKVRkA_g5tiTt5ajSeG4NL8YHC1avq6dCaA@mail.gmail.com>
References: <20260410203741.997410-1-tim.bird@sony.com>
	<20260410203741.997410-2-tim.bird@sony.com>
	<87qzohdv6i.ffs@tglx>
	<CAJGKYO6Kk4+=9FEJYGxmBQhsB871ERaG0i33Pzx2BV-o7QDFJA@mail.gmail.com>
	<87bjfjap37.ffs@tglx>
	<CAJGKYO5R3yM_DtALNd7BYoNMP6RiRJvCfU84vQNPCKz_Vizweg@mail.gmail.com>
	<CAJGKYO4PatnJLPVuwp730hEEqsMCEAravO-cS6xyenMNJEsXtQ@mail.gmail.com>
	<MW5PR13MB563296D757735B5B84336781FD222@MW5PR13MB5632.namprd13.prod.outlook.com>
	<CAJGKYO5TotaDTPYP5Ddoy9cgi2L8emFrNxdxyJNZ_UZm=jfWLA@mail.gmail.com>
	<CAJGKYO7==hZ3OnRNuG81j6rxH3y1gK8qB-orxxrDsc4pNFv=hQ@mail.gmail.com>
	<CAMuHMdUW1CGpR3k8UCCGLdoEBgxpHz5=sgMGOB0E4FNmA94MiA@mail.gmail.com>
	<CAJGKYO6As=rYv2TfKVRkA_g5tiTt5ajSeG4NL8YHC1avq6dCaA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 16 Apr 2026 11:38:53 +0200
"Roberto A. Foglietta" <roberto.foglietta@gmail.com> wrote:

> On Thu, 16 Apr 2026 at 10:44, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Roberto,
> >
> > On Thu, 16 Apr 2026 at 10:25, Roberto A. Foglietta
> > <roberto.foglietta@gmail.com> wrote:  
> > > In attachment the V6 of the patch, and these are the changes since Tim
> > > proposed it:  
> >
> > Please no attachments, as it makes it much harder to read the patch,
> > and comment on it:  
> 
> Thanks for having considered the patch.
> 
> >
> > https://elixir.bootlin.com/linux/v7.0/source/Documentation/process/submitting-patches.rst#L278
> >  
> 
> Is this a link? ;-)
> 
> --> No MIME, no links, no compression, no attachments. Just plain text  
> 
> You guys need a plugin for TUI e-mail readers/git-am that solves the
> text/base64 attachments issue.

Eh?
Not the least of the problems is that you (typically) have to explicitly
open the attachment in order to actually read it.
If it is inline you can just scroll down and give it a quick scan.

Have you ever tried reading patch attachments with what might be the
most common MUA on everything except phones?
You actually have to save them somewhere before you can open them.

	David

> 
> Seriously, someone should write it and write it in a manner that
> kernel guys are happy to adopt/use it.
> 
> It will be a great relief for both the sides (senders, receivers)
> because space/tab mismatch hurts as well.
> 
> While git-send requires some hard-to-grant precautions to not become a
> serious trouble / headache.
> 
> Best regards, R-
> 

