From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH 0/6] Generic PWM API implementation
Date: Sat, 28 Nov 2009 13:28:30 -0800
Message-ID: <200911281328.30904.david-b@pacbell.net>
References: <cover.1224093510.git.bgat@billgatliff.com> <4B02C3A6.5030000@billgatliff.com> <fa686aa40911201449we09fe69i7c7601e705b9e39e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <fa686aa40911201449we09fe69i7c7601e705b9e39e@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Bill Gatliff <bgat@billgatliff.com>, linux-embedded@vger.kernel.org, Mike Frysinger <vapier.adi@gmail.com>

On Friday 20 November 2009, Grant Likely wrote:
> I don't think that's true, but I'm approaching it from the viewpoint
> of managing pins; not the usage API. =A0ie. the difference between
> gpiolib (management) and the gpio api (usage).

Don't follow.  The gpiolib code is unrelated to pin managment.
It's purely an aid for implementations of the API.
