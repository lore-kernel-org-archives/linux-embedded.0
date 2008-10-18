From: Ben Nizette <bn@niasdigital.com>
Subject: Re: Power cut in management
Date: Sun, 19 Oct 2008 08:33:34 +1100
Message-ID: <1224365614.4208.27.camel@moss.renham>
References: <4917.79.37.233.237.1224328849.squirrel@nausicaa2.coritel.it>
	 <20081018114910.GA29345@shareable.org>
	 <1224331493.6770.1360.camel@macbook.infradead.org>
	 <20081018125621.GA30391@shareable.org>
	 <1224336683.6770.1364.camel@macbook.infradead.org>
	 <20081018133801.GA30897@shareable.org>  <48FA0851.4010209@coritel.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48FA0851.4010209@coritel.it>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marco <marco.stornelli@coritel.it>
Cc: Jamie Lokier <jamie@shareable.org>, David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org


On Sat, 2008-10-18 at 18:01 +0200, Marco wrote:
> The only problem is: what
> happens if before I install the irq handler the user turn off the
> system? I mean I can't "loose" the interrupt. In this case it'd be like
> a spurious interrupt from system point view. Let me know if I'm wrong.
> Thanks.
> 

Make sure that
1- The grace period the hardware guys give you is long enough,
theoretically, to install the handler _and_ handle it
1a- The grace period is guaranteed no matter how long the system has
been on for
2- make the interrupt level-triggered so you don't miss it (note that
that interrupt should be disabled before a handler is registered so you
won't get a spurious interrupt)
3- ensure you don't do anything which would be affected by incorrect
power, such as fs writes, before the handler has been installed both in
the kernel and in userspace.

You should be fine :-)

	--Ben.
