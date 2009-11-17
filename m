From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH, RFC] panic-note: Annotation from user space for panics
Date: Tue, 17 Nov 2009 10:53:17 +0200
Message-ID: <1258447997.27437.76.camel@localhost>
References: <20091112021322.GA6166@dvomlehn-lnx2.corp.sa.net>
	 <4AFC4D31.2000101@gmail.com>
	 <20091112215649.GA28349@dvomlehn-lnx2.corp.sa.net>
	 <20091113091031.3f6d4bba@marrow.netinsight.se>
	 <1258112748.21596.1227.camel@localhost>  <4AFE6A14.4010507@gmail.com>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4AFE6A14.4010507@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Simon Kagstrom <simon.kagstrom@netinsight.net>, David VomLehn <dvomlehn@cisco.com>, linux-embedded@vger.kernel.org, akpm@linux-foundation.org, dwm2@infradead.org, linux-kernel@vger.kernel.org, mpm@selenic.com, paul.gortmaker@windriver.com

Hi Marko,

On Sat, 2009-11-14 at 09:28 +0100, Marco Stornelli wrote:
> I think in general the procedure should be: at startup or event (for
> example acquired IP address from DHCP) user applications write in fla=
sh
> (better in persistent ram) a log with a tag or a timestamp or somethi=
ng
> like this, when there is a kernel panic, it is captured in a file sto=
red
> together the log and when possible the system should send all via
> network for example. Are there problems that I can't see to follow th=
is
> approach? When David says "...so this looks much more like a real fil=
e
> than a sysctl file" I quite agree, it seems a normal application/syst=
em
> log indeed.

Please, do not top-post, you make it difficult to discuss things by
messing up the context. Be consistent with how other people reply in
this thread, please.

Take a look at my mails where I describe different complications we hav=
e
in our system. We really want to have an OOPS/panic + our environment
stuff to go together, at once. This makes things so much simpler.

Really, what is the problem providing this trivial panic-note
capability, where user-space can give the kernel a small buffer, and as=
k
the kernel to print this buffer at the oops/panic time. Very simple and
elegant, and just solves the problem.

Why perversions with time-stamps, separate storages are needed?

IOW, you suggest a complicated approach, and demand explaining why we d=
o
not go for it. Simply because it is unnecessarily complex. This patch
solves the problem gracefully, and I'd rather demand you to point what
is the technical problem with the patches.

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
