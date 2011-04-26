From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: Expose regulator:set_consumer_device_supply()?
Date: Mon, 25 Apr 2011 21:25:22 -0500
Message-ID: <BANLkTikQSus=o3=TVdEPBfnP6HZJvxt4Vw@mail.gmail.com>
References: <BANLkTi=dCHXEtv+=+sRaDp_Pt3zQy5o7ug@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=dCHXEtv+=+sRaDp_Pt3zQy5o7ug@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-embedded@vger.kernel.org
Cc: lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com

Guys:

On Mon, Apr 25, 2011 at 9:16 PM, Bill Gatliff <bgat@billgatliff.com> wr=
ote:
> A much cleaner way might be to pass a struct regulator_dev pointer in
> the i2c chip's platform data, and then use something similar to
> set_consumer_device_supply() to add the i2c chip's "VDD" pin as a
> consumer of the regulator. =A0Or maybe that function exactly.

This would also imply the ability to register a regulator with no
consumers listed, as they would be added later when i2c, etc. devices
were registered.


b.g.
--=20
Bill Gatliff
bgat@billgatliff.com
