From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Thu, 12 Jun 2008 21:29:52 -0400
Message-ID: <8bd0f97a0806121829o6138cb30se025fa3c29cdd1a8@mail.gmail.com>
References: <1209577322.25560.402.camel@pmac.infradead.org>
	 <1213285831.26255.152.camel@pmac.infradead.org>
	 <48514D77.4060007@am.sony.com> <200806122025.54791.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=rocNVP2lrY1GnLW9xdh0Fr45S+XO5pEaTJYXwNUK7nA=;
        b=vV+u8SM7wfguJrOgnVO3nQk2LapXdYNbIrHQlX03PlkAnHOf+65bq97AI/gQBOR0zE
         qbpOjW68cyNpa0m+lKJgw/me/bLYpTlMSH1KqwSan3HAIDXFdyhJpvMcfO79tHbnkPIk
         IM3bhLznubCuCpunbWbctYxu49gV3dkBHP1Og=
In-Reply-To: <200806122025.54791.rob@landley.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Landley <rob@landley.net>
Cc: Tim Bird <tim.bird@am.sony.com>, David Woodhouse <dwmw2@infradead.org>, Greg Ungerer <gerg@snapgear.com>, Sam Ravnborg <sam@ravnborg.org>, Leon Woestenberg <leon.woestenberg@gmail.com>, linux-embedded@vger.kernel.org

On Thu, Jun 12, 2008 at 9:25 PM, Rob Landley wrote:
> He recently converted Battle for Wesnoth to use something called "scons" as
> its build system, and apparently the resulting make stuff was 1/17th the size
> of the original.

probably because scons has ~1/17th the functionality of autotools.
seriously, it's terrible.  funny you should mention it in a thread
about cross-compiling seeing as how it doesnt have a chance of
supporting it (has hard enough time supporting native builds).
-mike
