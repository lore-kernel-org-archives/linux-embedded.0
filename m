From: Alex Riesen <raa.lkml@gmail.com>
Subject: Re: New fast(?)-boot results on ARM
Date: Tue, 18 Aug 2009 12:34:52 +0200
Message-ID: <81b0412b0908180334u51fd957dh36f2a4946dffbb0b@mail.gmail.com>
References: <20090814170228.GM13320@pengutronix.de>
	 <1158166a0908141304y70300ab3p899b0d4609efded9@mail.gmail.com>
	 <20090814204305.GA31727@pengutronix.de>
	 <20090815103532.GA5596@sig21.net> <4A8A7D38.5020201@gmail.com>
	 <20090818102136.GN29655@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758628AbZHRKex@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=7mWLHZ/+HP0dXy9717Ad+wD3zuz8C5GxVwXYOTo3OR8=;
        b=biD42cqjSMOHwQl16q0KHHUDtpkuX5RBRLXoym+FXCC7afs/R0QNwI5fbUAmQHcv73
         +5ZpZd85708GqVz0Gyt3CBkYmv1SirZQu8ivaR44L7t/mhUo07/Kcdu9I+WF8KQ9/guM
         S9cF4YnePMoHONNxHpL/iowF7HMnJmQxR2hog=
In-Reply-To: <20090818102136.GN29655@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: Marco Stornelli <marco.stornelli@gmail.com>, Johannes Stezenbach <js@sig21.net>, Denys Vlasenko <vda.linux@googlemail.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>, Tim Bird <tim.bird@am.sony.com>, kernel@pengutronix.de

On Tue, Aug 18, 2009 at 12:21, Robert Schwebel<r.schwebel@pengutronix.d=
e> wrote:
> - In general we want to have our systems close to what the mainline
> =C2=A0does; Automation & Embedded is only a small market, and anythin=
g
> =C2=A0which is *not* specific to these markets but mainline is good.

BTW, what is your mainline (or it looks like you mean "upstream")?
