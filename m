From: David Brownell <david-b@pacbell.net>
Subject: Re: USB, Host and Device on the same machine
Date: Mon, 27 Oct 2008 09:44:47 -0700
Message-ID: <200810270944.47246.david-b@pacbell.net>
References: <53e45cc30810240018w1c3c73c2nf9a9b606e0e7dea4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <53e45cc30810240018w1c3c73c2nf9a9b606e0e7dea4@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fredrik Johansson <frejo242@gmail.com>
Cc: linux-embedded@vger.kernel.org

On Friday 24 October 2008, Fredrik Johansson wrote:
> if I load the ehci-hcd driver with g_serial already loaded it
> screws everything up since ehci-hcd driver attaches to both the OTG
> and the host controller, how can i prevent it from using the OTG
> controller?

If the OTG controller exposes EHCI as its host interface, it
sure *ought* to be managed by the EHCI driver.  Maybe you
should be submitting a patch adding OTG glue to EHCI?

If it's not exposing EHCI as its host interface, then it seems
your OTG driver is quite buggy...
