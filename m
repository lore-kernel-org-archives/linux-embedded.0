From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Tue, 10 Jun 2008 11:20:18 +0100
Message-ID: <20080610102018.GB25910@shareable.org>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806092253.11897.rob@landley.net> <20080610043020.GA31765@uranus.ravnborg.org> <200806100155.31904.rob@landley.net> <20080610075432.GB776@uranus.ravnborg.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080610075432.GB776@uranus.ravnborg.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Landley <rob@landley.net>, Leon Woestenberg <leon.woestenberg@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org

My only comment is I remember when Eric Raymond submitted a smart
config thing (before Kconfig, which copied Eric's best ideas).

The main objection to Eric's patch was that it was written in Python,
causing kernel builds to depend Python.

When did this policy change, so that it's now acceptable to depend on
Perl, which is roughly equivalent as a tool dependency?

-- Jamie

