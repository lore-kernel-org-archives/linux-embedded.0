From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] detour TTY driver - now ttyprintk
Date: Mon, 21 Jun 2010 15:38:58 +0100
Message-ID: <20100621153858.444695c0@lxorguk.ukuu.org.uk>
References: <1273918658.2341.17.camel@itpsd6lap>
	<1275171436.2122.29.camel@itpsd6lap>
	<20100529235402.296406d9@lxorguk.ukuu.org.uk>
	<1275175983.2122.42.camel@itpsd6lap>
	<1276123020.16010.97.camel@itpsd6lap>
	<20100611134455.3fa7d563@lxorguk.ukuu.org.uk>
	<1276291932.2154.45.camel@itpsd6lap>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1276291932.2154.45.camel@itpsd6lap>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Samo Pogacnik <samo_pogacnik@t-2.net>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

> I'm thinking to leave the ratelimit support in for the time being. I had
> in mind cases, when someone does
>  "cat /proc/kmsg > dev/ttyprintk" or
> suppose the console is redirected to ttyprintk (which i would like to be
> able to do from user program)

Console as in the printk sense would then loop.

If you are going to do the flow control you should probably do something
like


write_room()
{
	if (!flow_controlled)
		space = 8192;
	return space;
}

write()
{
	space -= len;
}

then your flow control will behave properly and slow down users rather
than losing data (except stuff sent without blocking)
