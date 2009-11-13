From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH, RFC] panic-note: Annotation from user space for panics
Date: Fri, 13 Nov 2009 16:16:53 +0200
Message-ID: <1258121813.21596.1229.camel@localhost>
References: <20091112021322.GA6166@dvomlehn-lnx2.corp.sa.net>
	 <4AFC4D31.2000101@gmail.com>
	 <20091112215649.GA28349@dvomlehn-lnx2.corp.sa.net>
	 <20091113091031.3f6d4bba@marrow.netinsight.se>
	 <1258112748.21596.1227.camel@localhost>
	 <20091113125946.5353164c@marrow.netinsight.se>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20091113125946.5353164c@marrow.netinsight.se>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
Cc: David VomLehn <dvomlehn@cisco.com>, Marco Stornelli <marco.stornelli@gmail.com>, linux-embedded@vger.kernel.org, akpm@linux-foundation.org, dwmw2@infradead.org, linux-kernel@vger.kernel.org, mpm@selenic.com, paul.gortmaker@windriver.com, "Shargorodsky Atal (EXT-Teleca/Helsinki)" <ext-atal.shargorodsky@nokia.com>

On Fri, 2009-11-13 at 12:59 +0100, Simon Kagstrom wrote:
> (Also fix David Woodhouses address and add Atal)
>=20
> On Fri, 13 Nov 2009 13:45:48 +0200
> Artem Bityutskiy <dedekind1@gmail.com> wrote:
>=20
> > So we really need to print some user-space supplied information dur=
ing
> > the panic, and then we store it on flash with mtdoops, and the late=
r,
> > when the device has network access we send whole bunch of oopses vi=
a the
> > network.
>=20
> Yes, I see that your case would have to be handled differently. A
> complication (which I believe was discussed before) is that kmsg_dump=
()
> is done before the panic notifiers are called.
>=20
> The reason I put it there is to have it before crash_kexec(), so I
> guess we'll have to take up the discussion on what to do with it. For
> me it now seems like it would be OK to move kmsg_dump() down below th=
e
> panic notifiers.
>=20
> If you have a kdump kernel to load, then you will most likely not nee=
d
> the kmsg dumped data anyway.

Yeah, I think this is a separate issue which can be fixed separately.

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
