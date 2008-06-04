From: Josh Boyer <jwboyer@gmail.com>
Subject: Re: [PATCH] console - Add configurable support for console charset
 translation
Date: Tue, 3 Jun 2008 22:13:09 -0500
Message-ID: <20080603221309.5e2762be@vader.jdub.homelinux.org>
References: <48447615.5050806@am.sony.com>
	<1212500751.16924.322.camel@pmac.infradead.org>
	<4845DB46.3020308@am.sony.com>
	<1212538597.4042.29.camel@shinybook.infradead.org>
	<20080603200349.3b1957e1@vader.jdub.homelinux.org>
	<1212541541.4042.41.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject:message-id:in-reply-to:references:x-mailer:mime-version:content-type:content-transfer-encoding;
        bh=k9AxR5GiRnt5eMupGE57d4CJOq9fXVWkAzpm/eo5bmQ=;
        b=KKvSVFu/kg6b2Tub1b9oId8v/fWV0mlvopLwc0MFeOgrwmZ2hxWcp9RTUVFWh0IRSqvD5xGcC+8fF/ZxK8ZnKYwU3PI49eAMZraVKXwf3jxe1z0VyMQZxLUXZ7Hu5ck3SWcDiGAattz8VgHgac+G3LwU77byLpfChRbIPEPLSZE=
In-Reply-To: <1212541541.4042.41.camel@shinybook.infradead.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Woodhouse <dwmw2@infradead.org>
Cc: Tim Bird <tim.bird@am.sony.com>, linux-tiny <Linux-tiny@selenic.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

On Wed, 04 Jun 2008 02:05:40 +0100
David Woodhouse <dwmw2@infradead.org> wrote:

> On Tue, 2008-06-03 at 20:03 -0500, Josh Boyer wrote:
> > On Wed, 04 Jun 2008 01:16:37 +0100
> > David Woodhouse <dwmw2@infradead.org> wrote:
> > 
> > > On Tue, 2008-06-03 at 17:01 -0700, Tim Bird wrote:
> > > > This is clearly an improvement. But it is missing this part of the
> > > > original patch:
> > > 
> > > Oops, well spotted. I've updated the patch in the git tree; thanks.
> > 
> > What git tree?
> 
>  git.infradead.org/embedded-2.6.git

Do you have plans to get that in -mm, or linux-next?

(Please say yes).

josh
