From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Updated cs8900a driver available anywhere?
Date: Thu, 8 Jul 2010 10:35:11 +0200
Message-ID: <AANLkTinKNV5c41TBQ0zAmUL3E_b2CWlSsWGg8aBbXpAW@mail.gmail.com>
References: <AANLkTilJ8JPjjD2M5Q934V8FIIFoBX9e13P32TliFVwT@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-net-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:sender:received
         :in-reply-to:references:date:x-google-sender-auth:message-id:subject
         :from:to:cc:content-type:content-transfer-encoding;
        bh=rxJZFJMOfAysxSnrvsAv3FkQuljh3tR3BUhc0M3YO6k=;
        b=eUmEJw3FwsJvXFSg+fZaiR/xxn1igMtJ6zHUGcG/xxijJkn99b61K51NhJhaU/y5fJ
         wuZKKZscYvkl0/KqeLeHksxxdUmWbWLket9C7XlghbrUV/c5LU1iQtztw68TpOmQMz5e
         YM4qnAN8Gzs1eOWLY7xkV7t1xiHD7Ti6/9pYo=
In-Reply-To: <AANLkTilJ8JPjjD2M5Q934V8FIIFoBX9e13P32TliFVwT@mail.gmail.com>
Sender: linux-net-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-net@vger.kernel.org, linux-embedded@vger.kernel.org

On Wed, Jul 7, 2010 at 21:44, Bill Gatliff <bgat@billgatliff.com> wrote=
:
> I'm in the process of porting Linux over to an ARM-based platform tha=
t
> features a CS8900 ethernet controller.
>
> The mainlined drivers/net/cs8x0.c file needs some pretty serious love=
=2E
> =C2=A0Before I start hacking on it, does anyone know if there is a
> non-mainlined improvement available anywhere? =C2=A0Like one that sup=
ports
> platform devices, for example?

Please note that there are actually two of them: drivers/net/cs89x0.c a=
nd
drivers/net/mac89x0.c. The latter seems to be only one third of the siz=
e.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
