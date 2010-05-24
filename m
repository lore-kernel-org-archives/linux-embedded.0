From: Ming Lei <tom.leiming@gmail.com>
Subject: Re: [RESEND PATCH] ARM: fix 'unannotated irqs-on' lockdep warning
Date: Mon, 24 May 2010 23:19:48 +0800
Message-ID: <AANLkTikGwEVtnGb5KdJb0GzWDpu-zk9bWwa3JAgwy1v3@mail.gmail.com>
References: <1274615328-27953-1-git-send-email-tom.leiming@gmail.com>
	 <AANLkTikRp0EHxshKYq39p18ymoRNAtyHrNm3yq6A49-r@mail.gmail.com>
	 <20100523141300.GD950@n2100.arm.linux.org.uk>
	 <AANLkTinV9Na9zxYMIfTr893Ynnc0YOk2B6uPKEa9s4R1@mail.gmail.com>
	 <20100523194746.GE950@n2100.arm.linux.org.uk>
	 <20100524112355.18424622@tom-lei>
	 <20100524071921.GA17528@n2100.arm.linux.org.uk>
	 <20100524101416.GA21117@n2100.arm.linux.org.uk>
	 <20100524222033.12b25f2a@tom-lei>
	 <20100524144539.GE21117@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=CDhyIo4WeOukV0aaNVV42DXKhianne8vivNOSKDnG8g=;
        b=QPLd5CM4JlhHfuBpXk8SsyNscQAHmu54Wgk92j3Upkg7/dcxDXzPjZry8OwrHSxQsb
         E+b7fNS+uoXSudrn+Ozy8zww9UQfMXfGedR4621yODpfr/60PH8n+XGJocBx0BxXfz9w
         /7cM6tRMIYWLmxPFR7oAsH6HqYwR2oxp8n1qw=
In-Reply-To: <20100524144539.GE21117@n2100.arm.linux.org.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-arm-kernel@lists.infradead.org, a.p.zijlstra@chello.nl

2010/5/24 Russell King - ARM Linux <linux@arm.linux.org.uk>:
> which needs to be redone with a little more understanding, like the
> following patch. =A0Note: you will need the previous patch as well,
> which is separate because it addresses a *different* issue.

OK, the two patches do fix the 'unannotated irqs-on' lockdep warning.

Thanks,

--=20
Lei Ming
