From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: ELBS mindshare
Date: Wed, 17 Sep 2008 22:27:19 +0200
Message-ID: <20080917202719.GR9852@pengutronix.de>
References: <488FCF7D.5010005@websterwood.com> <20080810151435.GG15696@tamay-dogan.net> <48B188CE.1030006@websterwood.com> <20080917181323.GD7913@secretlab.ca> <20080917182333.GO9852@pengutronix.de> <5763a8949cead468dd505137165e8e65.squirrel@www.geekisp.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5763a8949cead468dd505137165e8e65.squirrel@www.geekisp.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Traynor <wmat@naoi.ca>
Cc: linux-embedded@vger.kernel.org

On Wed, Sep 17, 2008 at 03:48:57PM -0400, Bill Traynor wrote:
> > On Wed, Sep 17, 2008 at 11:13:23AM -0700, Grant Likely wrote:
> >> BTW, I was talking with a guy from TI last night (Mike Turquette; works
> >> on the OMAP) and I asked him my standard question about what he thinks
> >> about the state of building root filesystems for embedded systems.
> >>
> >> When he listed the toolkits he knows about and is interested in, ELBS
> >> was either the 2nd or 3rd tool that he mentioned.
> >>
> >> Word is getting around dude.
> >
> > What is ELBS? If it is somehow better than ptxdist, I'll have to apply a
> > few patches there 8-)
>
> Embedded Linux Build System
> http://debian.websterwood.com/elbs/
>
> Article on LinuxDevices:
> http://www.linuxdevices.com/news/NS5894411715.html

Ok, you do native building, that's not what we do for ptxdist's standard
root filesystems.

But note that ptxdist itself is only a system to manage configurable
rules which are being executed in a dependency-defined order; so in the
end, it can built whatever it likes.

rsc
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hannoversche Str. 2, 31134 Hildesheim, Germany
   Phone: +49-5121-206917-0 |  Fax: +49-5121-206917-9
