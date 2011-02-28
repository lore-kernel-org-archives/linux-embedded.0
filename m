From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 5/5] KBUS source file
Date: Mon, 28 Feb 2011 20:23:13 +0100
Message-ID: <20110228192312.GA1832@merkur.ravnborg.org>
References: <cover.1298829754.git.tibs@tonyibbs.co.uk> <3CEFF9DA-16D6-43E1-A8A5-658EB1D426C7@tonyibbs.co.uk>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3CEFF9DA-16D6-43E1-A8A5-658EB1D426C7@tonyibbs.co.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tony Ibbs <tibs@tonyibbs.co.uk>
Cc: Linux-embedded <linux-embedded@vger.kernel.org>, Tibs at Kynesim <tibs@kynesim.co.uk>, Richard Watts <rrw@kynesim.co.uk>, Grant Likely <grant.likely@secretlab.ca>

On Sun, Feb 27, 2011 at 07:26:49PM +0000, Tony Ibbs wrote:
> Apologies, my fifth patch (the actual KBUS source file) appears to be
> too long - I hadn't realise the 100,000 character limit on majordomo
> messages. The file as submitted is that at:
> 
>   https://github.com/crazyscot/linux-2.6-kbus/blob/6cc3262bd3e28757179dd8a0d30298dfb2f70845/ipc/kbus.c


You are using /proc/* to something that is not process related.
At lkml you will be requested to use something else.

You can conisder splitting this up in another file so you
in the Makefile can use it conditionally.

> If there is a better way for me to submit this, please let me know.

One way you would not like....
Let the first patches introduce core-functionality and add features
in later patches - touching the same file many times.

Also please submit the Makefile/Kconfig stuff in the _last_ mail.
Otherwise you would ruin bisect because we cannot build kbus until
you have the last files included.

	Sam
