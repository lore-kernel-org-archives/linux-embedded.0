From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Tue, 10 Jun 2008 14:12:36 +0100
Message-ID: <20080610131236.GC28565@shareable.org>
References: <20080610075432.GB776@uranus.ravnborg.org> <20080610090924.150D9248AC@gemini.denx.de>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080610090924.150D9248AC@gemini.denx.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfgang Denk <wd@denx.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, Rob Landley <rob@landley.net>, Leon Woestenberg <leon.woestenberg@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org

Wolfgang Denk wrote:
> Being unable to do this just because we now also would need a  native
> Perl is indeed a PITA...

You can run the Perl bit with "ssh remote perl", and still do the rest
of the compile natively.  It's not pretty, but workable.

-- Jamie
