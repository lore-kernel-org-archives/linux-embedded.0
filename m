Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE002FC52
	for <linux-embedded@vger.kernel.org>; Sun,  3 Nov 2024 16:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730650555; cv=none; b=mYRChcYw/2lh7UXmy+WslBPG4yzKZaNwIxVJMEbhsyHK1fsPrbRs/aQQt5tGoEGWMZvplio5aTLqyhtL1+T8f42FSYGD6C5JtQM0Whwwl6JWGzOtkpTrHnAS+EtJFx9JzKWj5WX5svuEmkIUS95SEi6rCwm3eYfH9HhLi39c/8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730650555; c=relaxed/simple;
	bh=lhi5V9gbpRTPScby0NS+5Hpir9Fo50/eGOB5Hf50XyA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g42l5hC57+DrqK9m1yWNAl8VxCpUvFdrgyLaQaVG15nYQ9/Y64Avqg3SNOYZ9PAfBiw+Sai4Y1JMy3UgZt4wa7xB4nMBMMU4bCoXo/CUqsW2uZqqU//kfzUmpzxjMXl2eOhtJ0GaO8gU3uSKq4m1f3HVc7Z6g+M6LCrYVVp3PpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S57tGql1; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S57tGql1"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a99f9fa66fdso67284166b.0
        for <linux-embedded@vger.kernel.org>; Sun, 03 Nov 2024 08:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730650551; x=1731255351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXFkdgpXKRZqqfEBVC1ZZT4uD/7wi8lLkrekQX/xAQU=;
        b=S57tGql1Aq0qYWRsGYd18/MGMzhJ1l5FkFbIzmsS70LOuUVuTBkCgwyGu2PvhZg+ki
         SAFNNuC9Uld7ucdgjeBCYL1st61pNqSR3CrugfPlWBFD8mQpta6NwAnv9d55V31uXnzg
         AXRGJVvzz4Ij2Z4pQkESaZuOYJNFISnTHiz5ntgdkxWFpgsq+Hhxsq5hYO5tFalkG8II
         h/YSzoLvzxZxwjC/88u185Fx2JlVQKgSD6p/Xh/ogd/5PMBJfI6C8+PDOKjKrtAHlxxk
         MpRztLneECqmV7DpW0xhoeftVCIyPHHGBYy9+Md+4L5tOjYf8PsvXFIuowSfmWI2CE1s
         Pz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730650551; x=1731255351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NXFkdgpXKRZqqfEBVC1ZZT4uD/7wi8lLkrekQX/xAQU=;
        b=dITY7EMJV1AyYyFMPFxeL9z6ta+lYeIKsuuxDXcf0FU11x/0jfjhCvzf9+AB+luZLP
         i1k7oOaEHKNt4OYi5+MfCxXBydE2OcopqHW0aslQm2bLRK1GFAKyfPEMPBlCmunwf2Cw
         TPKY4J1dGvR+nwMVowaGqp97rqGNaamCTFLbU+BHzBIA0FQIlqOWtz9pbObYAFPIfWwB
         0ArGnuHoSVq7ZfRMg/7t14oUU/wwbUGfi5lB+blBK+bjneg+ZPLcpd5OXvASxLrrriHD
         GAguJKRuUAAYcXeiS7wbuJ756lb31dhznNNuJKEBnoFjNgCcnWxE711V9y+aJdlf5N+S
         QGwA==
X-Gm-Message-State: AOJu0YxLKsuTGiqkH4uRkHluLVI0dY+rkxtLK2j2+M2TgwqfTBenEHkw
	K8hFM8T5jBqQWueekjEmTh5U94Dfky2ztiANnXmCnjgtjiHXtMsWpqcXrQ==
X-Google-Smtp-Source: AGHT+IEyagGs1LmD4qLqSG6a2ig0BLdV/dQWaqXMk8pirijgouKlNAL9YF+4Qyn1P38+qqvjW8NFnw==
X-Received: by 2002:a05:6402:42d5:b0:5c9:6b2b:5502 with SMTP id 4fb4d7f45d1cf-5cbbf89209fmr9562176a12.3.1730650551075;
        Sun, 03 Nov 2024 08:15:51 -0800 (PST)
Received: from fedora.fritz.box (host-79-34-200-95.business.telecomitalia.it. [79.34.200.95])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac770ee2sm3408454a12.39.2024.11.03.08.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 08:15:50 -0800 (PST)
From: Francesco Valla <valla.francesco@gmail.com>
To: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>,
 "Bird, Tim" <Tim.Bird@sony.com>
Subject: Re: [boot-time] RFC: proposal for boot-time tools github repository
Date: Sun, 03 Nov 2024 17:15:50 +0100
Message-ID: <2523504.XAFRqVoOGU@fedora.fritz.box>
In-Reply-To:
 <MW5PR13MB5632D76A85C2DCE48B5AA2B4FD542@MW5PR13MB5632.namprd13.prod.outlook.com>
References:
 <MW5PR13MB5632D76A85C2DCE48B5AA2B4FD542@MW5PR13MB5632.namprd13.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Wednesday, 30 October 2024 at 09:22:09 Bird, Tim <Tim.Bird@sony.com> wrote:
> I have a few tools that I plan to publish over the next little while.
> 
> Some of these might make their way into the kernel 'scripts' directory, but some
> others of these might not be appropriate to add there.
> 
> So I'm  thinking of putting together a repository of boot-time related tools
> for people to play with.  Here's a sample of one tool that I find handy:
> ----
> #!/bin/sh
> # sort-initcalls.sh - sort the initcalls by duration
> 
> if [ -z "$1" -o "$1" = "-h" ] ; then
>     echo "Usage: sort-initcalls.sh <dmesg file>"
>     exit 1
> fi
> 
> grep "initcall.*after" $1 | sed "s/\(.*\)after\(.*\)/\2 \1/g" | sed "s/\r//" | sort -n
> ----
> See https://elinux.org/Initcall_Debug for details.
> 
> For tools on their way upstream, this would serve as a development repository
> where different ideas and techniques can get hashed out.
> 
> So, does anyone have alternative ideas for hosting such tools, or comments on
> this approach?

Sounds fine, at least from the perspective of a developer not so much expert
on the whole mainline development flow (like me).

Were you thinking of using the Github PR method to accept contributions?

Greetings,

Francesco






