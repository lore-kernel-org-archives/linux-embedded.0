From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 3/6] Add support for LZO-compressed kernels
Date: Tue, 04 Aug 2009 18:36:41 -0700
Message-ID: <4A78E229.2030309@zytor.com>
References: <20090731093107.GA29704@merkur.ravnborg.org>	<1249311501-23102-1-git-send-email-albin.tonnerre@free-electrons.com>	<1249311501-23102-2-git-send-email-albin.tonnerre@free-electrons.com>	<1249311501-23102-3-git-send-email-albin.tonnerre@free-electrons.com> <20090804160043.82b256d8.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090804160043.82b256d8.akpm@linux-foundation.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Albin Tonnerre <albin.tonnerre@free-electrons.com>, sam@ravnborg.org, linux@arm.linux.org.uk, alain@knaff.lu, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

On 08/04/2009 04:00 PM, Andrew Morton wrote:
> 
> 0.24 seconds booting speedup sounds pretty thin.  Adding a new
> decompression format will introduce more configuration/build/deployment
> complexities.  How do we justify this?
> 

Keep in mind this may be out of a 3-5 second boot budget.

	-hpa
