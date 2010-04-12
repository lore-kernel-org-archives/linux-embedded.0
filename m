From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH] Pseudo-console for capture and redirection of console 
	output
Date: Mon, 12 Apr 2010 02:40:37 -0400
Message-ID: <p2g8bd0f97a1004112340u547f244bpe0e4f1c9880f0c35@mail.gmail.com>
References: <20100412063545.GA28646@dvomlehn-lnx2.corp.sa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:received:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=vOYdTyLrsfSHj/cw4Oorr5FV+ZDRQvJfwI/zkb8te/Y=;
        b=wGKh/YTg3b/2EI7/ZZWbI24iznjSypICKONL0IpHNgX/7QSYp3NRoBPrnw1DiY8uuJ
         +4Da/eDGhHM/Mqe/rr2bEpfr4QxyrHK0lQ8lrL1GZKmZX8HxLlq836yAxuBH6V8+MWJW
         DqmSWMhx8b8bkw+RpOWWCra/sGbjaCx3kD410=
In-Reply-To: <20100412063545.GA28646@dvomlehn-lnx2.corp.sa.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David VomLehn <dvomlehn@cisco.com>
Cc: to@dvomlehn-lnx2.corp.sa.net, "linux-embedded@vger.kernel.org"@cisco.com, linux-embedded@vger.kernel.org, akpm@linux-foundation.org, dwm2@infradead.org, mpm@selenic.com, paul.gortmaker@windriver.com

On Mon, Apr 12, 2010 at 02:35, David VomLehn wrote:
> Provide functions for capturing console output for storage. The prima=
ry user
> is likely to be embedded systems that don't have the storage for core=
 dumps
> but do have a need to log kernel panic information for later evaluati=
on. It
> offers two main areas of functionality:
>
> o =C2=A0 =C2=A0 =C2=A0 It can maintain a circular log of console outp=
ut so that kernel log
> =C2=A0 =C2=A0 =C2=A0 =C2=A0messages written before panic() was called=
 can be retrieved to be
> =C2=A0 =C2=A0 =C2=A0 =C2=A0added to the failure log.
> o =C2=A0 =C2=A0 =C2=A0 A function can be registered to store output f=
rom printk() in a
> =C2=A0 =C2=A0 =C2=A0 =C2=A0persistent location, such as a reserved lo=
cation in RAM. =C2=A0Then,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0printk() can be used either directly, to p=
rint state information, or
> =C2=A0 =C2=A0 =C2=A0 =C2=A0indirectly, through standard functions lik=
e dump_stack() and
> =C2=A0 =C2=A0 =C2=A0 =C2=A0show_regs().

how is this any different from the already existing mtdoops driver ?
-mike
