From: Wolfgang Denk <wd@denx.de>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Tue, 10 Jun 2008 15:47:08 +0200
Message-ID: <20080610134708.19ABD248AC@gemini.denx.de>
References: <20080610131236.GC28565@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: Your message of "Tue, 10 Jun 2008 14:12:36 BST."
             <20080610131236.GC28565@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Rob Landley <rob@landley.net>, Leon Woestenberg <leon.woestenberg@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org

In message <20080610131236.GC28565@shareable.org> you wrote:
>
> You can run the Perl bit with "ssh remote perl", and still do the rest
> of the compile natively.  It's not pretty, but workable.

This may or may not work. If, for  example,  perl  is  running  on  a
remote  little  endian host (like a standard x86 PC) and we depend on
native bin endian byte order, there may be trouble...

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Quote from a recent meeting:   "We are going to continue having these
meetings everyday until I find out why no work is getting done."
