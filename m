From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Tue, 10 Jun 2008 09:54:32 +0200
Message-ID: <20080610075432.GB776@uranus.ravnborg.org>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806092253.11897.rob@landley.net> <20080610043020.GA31765@uranus.ravnborg.org> <200806100155.31904.rob@landley.net>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200806100155.31904.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Landley <rob@landley.net>
Cc: Leon Woestenberg <leon.woestenberg@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org

> (Maybe I _am_ the only person who still cares about 
> building on a host without perl.  If I wasn't, somebody else would have acked 
> the patch...)

perl is pretty standard and I fail to see the benefits of avoiding it.
For embedded development I see even less benefits as I assume
any sane embedded development environment are based on a
cross-toolchain so you do the build on a high perfomance box.

Building everything for my arm board on the arm board would be a disater
for example.

	Sam
