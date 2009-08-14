From: Jamie Lokier <jamie@shareable.org>
Subject: Re: New fast(?)-boot results on ARM
Date: Fri, 14 Aug 2009 19:46:51 +0100
Message-ID: <20090814184651.GA12021@shareable.org>
References: <20090814170228.GM13320@pengutronix.de> <4A85AAC4.7050505@acm.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756907AbZHNSq4@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A85AAC4.7050505@acm.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zan Lynx <zlynx@acm.org>
Cc: Robert Schwebel <r.schwebel@pengutronix.de>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>, Tim Bird <tim.bird@am.sony.com>, kernel@pengutronix.de

Zan Lynx wrote:
> Or maybe its cheap and slow flash. In that case I think your only hope 
> is to make all the code as small as possible and/or find a different 
> flash filesystem that does not have to read so much of the device to 
> mount. Perhaps use a read-only compressed filesystem for the system 
> binaries and reflash it for software upgrades. Only init and mount the 
> writable flash for user-storable data well after system boot has finished.

Fwiw, logfs claims to mount quickly, but I haven't heard much about it
in recent months and http://logfs.org/logfs/ implies it's not really
stable yet.  But maybe if you're working on a prototype that doesn't
matter so much.

-- Jamie
