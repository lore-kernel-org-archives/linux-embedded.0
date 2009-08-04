From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 3/6] Add support for LZO-compressed kernels
Date: Tue, 4 Aug 2009 16:00:43 -0700
Message-ID: <20090804160043.82b256d8.akpm@linux-foundation.org>
References: <20090731093107.GA29704@merkur.ravnborg.org>
	<1249311501-23102-1-git-send-email-albin.tonnerre@free-electrons.com>
	<1249311501-23102-2-git-send-email-albin.tonnerre@free-electrons.com>
	<1249311501-23102-3-git-send-email-albin.tonnerre@free-electrons.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933571AbZHDXA5@vger.kernel.org>
In-Reply-To: <1249311501-23102-3-git-send-email-albin.tonnerre@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Cc: sam@ravnborg.org, hpa@zytor.com, linux@arm.linux.org.uk, alain@knaff.lu, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, albin.tonnerre@free-electrons.com

On Mon,  3 Aug 2009 16:58:18 +0200
Albin Tonnerre <albin.tonnerre@free-electrons.com> wrote:

> This is the first part of the lzo patch
> The lzo compressor is worse than gzip at compression, but faster at
> extraction. Here are some figures for an ARM board I'm working on:
> 
> Uncompressed size: 3.24Mo
> gzip  1.61Mo 0.72s
> lzo   1.75Mo 0.48s
> 
> So for a compression ratio that is still relatively close to gzip, it's
> much faster to extract, at least in that case.

Is 3.2Mb a typical kernel size for small systems?  It sounds large.


0.24 seconds booting speedup sounds pretty thin.  Adding a new
decompression format will introduce more configuration/build/deployment
complexities.  How do we justify this?

Did anyone look into just speeding up the gzip decompressor?

> +#ifdef STATIC

What is this STATIC thing for?

