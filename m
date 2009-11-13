From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH, RFC] panic-note: Annotation from user space for panics
Date: Fri, 13 Nov 2009 13:26:46 +0200
Message-ID: <1258111606.21596.1208.camel@localhost>
References: <20091112021322.GA6166@dvomlehn-lnx2.corp.sa.net>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756205AbZKML1Y@vger.kernel.org>
In-Reply-To: <20091112021322.GA6166@dvomlehn-lnx2.corp.sa.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David VomLehn <dvomlehn@cisco.com>
Cc: linux-embedded@vger.kernel.org, akpm@linux-foundation.org, dwm2@infradead.org, linux-kernel@vger.kernel.org, mpm@selenic.com, paul.gortmaker@windriver.com

On Wed, 2009-11-11 at 21:13 -0500, David VomLehn wrote:
> diff --git a/kernel/panic.c b/kernel/panic.c
> index 96b45d0..513deae 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -70,6 +70,7 @@ NORET_TYPE void panic(const char * fmt, ...)
>         vsnprintf(buf, sizeof(buf), fmt, args);
>         va_end(args);
>         printk(KERN_EMERG "Kernel panic - not syncing: %s\n",buf);
> +       panic_note_print();
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
>         dump_stack();
>  #endif
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug

You should use panic notifiers instead. See the panic_notifier_list.

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
