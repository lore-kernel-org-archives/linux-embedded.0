From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [patch 1/3] crypto: Add a zlib crypto module
Date: Sat, 30 Aug 2008 07:39:57 +0100
Message-ID: <1220078397.7107.433.camel@pmac.infradead.org>
References: <20080829134158.108976037@vixen.sonytel.be>
	 <20080829134418.874948211@vixen.sonytel.be>
	 <20080830062315.GA18441@gondor.apana.org.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <20080830062315.GA18441@gondor.apana.org.au>
Sender: linux-crypto-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, linux-crypto@vger.kernel.org, squashfs-devel@lists.sourceforge.net, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 2008-08-30 at 16:23 +1000, Herbert Xu wrote:
> On Fri, Aug 29, 2008 at 01:41:59PM +0000, Geert Uytterhoeven wrote:
> > From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
> > 
> > Add a (de)compression module for the "zlib" format using the crypto API.
> 
> I think we can safely conclude that our current compression
> interface sucks for what you're trying to achieve :)

The main thing that's missing for JFFS2 is 
 "Compress as much of this as you can into X bytes"

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation



