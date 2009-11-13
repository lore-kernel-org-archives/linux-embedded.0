From: Simon Kagstrom <simon.kagstrom@netinsight.net>
Subject: Re: [PATCH, RFC] panic-note: Annotation from user space for panics
Date: Fri, 13 Nov 2009 12:59:46 +0100
Message-ID: <20091113125946.5353164c@marrow.netinsight.se>
References: <20091112021322.GA6166@dvomlehn-lnx2.corp.sa.net>
	<4AFC4D31.2000101@gmail.com>
	<20091112215649.GA28349@dvomlehn-lnx2.corp.sa.net>
	<20091113091031.3f6d4bba@marrow.netinsight.se>
	<1258112748.21596.1227.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755408AbZKML7s@vger.kernel.org>
In-Reply-To: <1258112748.21596.1227.camel@localhost>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: dedekind1@gmail.com
Cc: David VomLehn <dvomlehn@cisco.com>, Marco Stornelli <marco.stornelli@gmail.com>, linux-embedded@vger.kernel.org, akpm@linux-foundation.org, dwmw2@infradead.org, linux-kernel@vger.kernel.org, mpm@selenic.com, paul.gortmaker@windriver.com, "Shargorodsky Atal (EXT-Teleca/Helsinki)" <ext-atal.shargorodsky@nokia.com>

(Also fix David Woodhouses address and add Atal)

On Fri, 13 Nov 2009 13:45:48 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> So we really need to print some user-space supplied information during
> the panic, and then we store it on flash with mtdoops, and the later,
> when the device has network access we send whole bunch of oopses via the
> network.

Yes, I see that your case would have to be handled differently. A
complication (which I believe was discussed before) is that kmsg_dump()
is done before the panic notifiers are called.

The reason I put it there is to have it before crash_kexec(), so I
guess we'll have to take up the discussion on what to do with it. For
me it now seems like it would be OK to move kmsg_dump() down below the
panic notifiers.

If you have a kdump kernel to load, then you will most likely not need
the kmsg dumped data anyway.

// Simon
