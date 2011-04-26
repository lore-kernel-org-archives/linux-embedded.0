From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: Expose regulator:set_consumer_device_supply()?
Date: Tue, 26 Apr 2011 09:34:39 +0100
Message-ID: <20110426083439.GB20595@sirena.org.uk>
References: <BANLkTi=dCHXEtv+=+sRaDp_Pt3zQy5o7ug@mail.gmail.com> <BANLkTikQSus=o3=TVdEPBfnP6HZJvxt4Vw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BANLkTikQSus=o3=TVdEPBfnP6HZJvxt4Vw@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org, lrg@slimlogic.co.uk, linux-kerne@vger.kernel.org

On Mon, Apr 25, 2011 at 09:25:22PM -0500, Bill Gatliff wrote:

> This would also imply the ability to register a regulator with no
> consumers listed, as they would be added later when i2c, etc. devices
> were registered.

This is already possible, not all consumers are visible to software
anyway.
