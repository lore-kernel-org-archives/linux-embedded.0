From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH] Pseudo-console for capture and redirection of console 
	output
Date: Mon, 12 Apr 2010 09:06:17 +0200
Message-ID: <s2g2ea1731b1004120006t81106be1g851d1c1cc272d83a@mail.gmail.com>
References: <20100412063545.GA28646@dvomlehn-lnx2.corp.sa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=AEw77GCSllu6VBGNVqgg2xQTnHr7oN1zhWF/cIL3n4g=;
        b=G0H03MQrPq9gPOSK2tBH7UFzGd0geyN+f9NmzjvPXOIgIpbcFwHXajyb9g+oTNhDqn
         dI+XoxC7gfBTTo3TdQlp3ZVi6Ue3ZrG76KGgcaiM1+VD6jdAmvIei9QRKRPdYmb+JbeK
         gNrof2d7WbTDRRBLcwWJYTjF8I4zziw4lOmTE=
In-Reply-To: <20100412063545.GA28646@dvomlehn-lnx2.corp.sa.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David VomLehn <dvomlehn@cisco.com>
Cc: to@dvomlehn-lnx2.corp.sa.net, "linux-embedded@vger.kernel.org"@cisco.com, linux-embedded@vger.kernel.org, akpm@linux-foundation.org, dwm2@infradead.org, mpm@selenic.com, paul.gortmaker@windriver.com

2010/4/12 David VomLehn <dvomlehn@cisco.com>:
> Provide functions for capturing console output for storage. The prima=
ry user
> is likely to be embedded systems that don't have the storage for core=
 dumps
> but do have a need to log kernel panic information for later evaluati=
on. It
> offers two main areas of functionality:
>
> o =A0 =A0 =A0 It can maintain a circular log of console output so tha=
t kernel log
> =A0 =A0 =A0 =A0messages written before panic() was called can be retr=
ieved to be
> =A0 =A0 =A0 =A0added to the failure log.
> o =A0 =A0 =A0 A function can be registered to store output from print=
k() in a
> =A0 =A0 =A0 =A0persistent location, such as a reserved location in RA=
M. =A0Then,
> =A0 =A0 =A0 =A0printk() can be used either directly, to print state i=
nformation, or
> =A0 =A0 =A0 =A0indirectly, through standard functions like dump_stack=
() and
> =A0 =A0 =A0 =A0show_regs().
>
> During normal operation, we use the circular logging. When we crash, =
almost
> the first thing we do is to switch to storing output. This goes in a =
memory
> buffer that is preserved over reboots. We then write a detailed crash
> report using printk() and functions that use printk(). We retrieve th=
e last
> n lines of the log before the crash and print it, so that gets captur=
ed
> in the log, too.
>

It's very similar to my driver ramoops, have you already seen it?
Currently it's in the mm tree, I think it will be included in mainline
early.

Marco
