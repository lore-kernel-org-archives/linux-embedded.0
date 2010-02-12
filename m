From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PWM PATCH 2/5] Emulates PWM hardware using a high-resolution 
	timer and a GPIO pin
Date: Fri, 12 Feb 2010 14:13:11 +0100
Message-ID: <10f740e81002120513y457de2afqa155441941261f7a@mail.gmail.com>
References: <cover.1265094517.git.bgat@billgatliff.com>
	 <2d73f9b2fd175fd3e482920baebcd3028206f02e.1265094517.git.bgat@billgatliff.com>
	 <20100211200702.GB1487@ucw.cz> <4B746A02.9060306@billgatliff.com>
	 <20100211205801.GA29159@elf.ucw.cz>
	 <A8919B3D-43EF-4EA5-8334-F1B52AE97E5A@lvk.cs.msu.su>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type;
        bh=TP9BxShPhfZfo7q0oOmSrCRaqpOjdl987HKUAClKBRM=;
        b=XsxEh2pBY4T72sjbOf0l4IfxLYiPqG849FB6Y9HqsL/dOiNHgLX24nm0Xcq0NbW44C
         CHW1aI6+IpOHg3UQY1ZWdKN1TkCC8zNCNGi3unzFArpNMEG4+kV6ZcByVK0BJlk/d/4N
         aLFr8XsJKC7CZAUZgXhU8aWJ8avzs5EHEqNQM=
In-Reply-To: <A8919B3D-43EF-4EA5-8334-F1B52AE97E5A@lvk.cs.msu.su>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Stanislav O. Bezzubtsev" <stas@lvk.cs.msu.su>
Cc: Pavel Machek <pavel@ucw.cz>, Bill Gatliff <bgat@billgatliff.com>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org

2010/2/12 Stanislav O. Bezzubtsev <stas@lvk.cs.msu.su>:
> The second strange thing is "unsigned long <name>:1". I'm not sure but as far as I can remember the right way to define several-bits field is "int <name>:1". But I might be mistaken.

A bitfield of size 1 should not be signed, as there's no space for a sign bit.
Usually, you want all bitfields to be unsigned anyway.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
