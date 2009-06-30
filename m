From: Johnny Hung <johnny.hacking@gmail.com>
Subject: Re: PCI device support in Open Firmware (device tree syntax)
Date: Tue, 30 Jun 2009 09:36:51 +0800
Message-ID: <cb9ecdfa0906291836mf74c41fn9c187e305771920a@mail.gmail.com>
References: <cb9ecdfa0906290858x125b8149na037f33258c21426@mail.gmail.com>
	 <20090629165133.GC1323@b07421-ec1.am.freescale.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=GEj+MulkCAntHGLeHdGVZAm9v1dVpp56FR7rKABY+6U=;
        b=liLW1Z2oevSy01QyvdQXgN8D2P+QdMnbnRx7Kx+dOmwsR7M5SGWJza51gKqVv+HXIj
         qnUsSdsp01CuJeA+g3zbMM8PA9jqd4cx0isyQe58Jw0GCc9gF5hRRzBZJ7Bhma5JpyFd
         iHV9U/G7nKVoQTKLNcYy+phU/owlp3Vqr53Qs=
In-Reply-To: <20090629165133.GC1323@b07421-ec1.am.freescale.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
content-type: text/plain
To: Scott Wood <scottwood@freescale.com>
Cc: linux-embedded@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernelnewbies@nl.linux.org

Thanks for your reply. So there are no PCI device resource info in
flat device tree.
How do PCI device resources be assign in general case or is there any e=
xample?
I am so confusing, would you please give me detailed describle?

BRs, H. Johnny
>
> With flat device trees, PCI devices are not typically included as the=
y
> can be probed instead. =A0Interrupt mapping is conveyed by the
> interrupt-map property in the PCI controller node.
>
> -Scott
>
