From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 0/7] printk: add pr_<level>_once, guard print_hex_dump
Date: Mon, 06 Dec 2010 10:51:36 -0800
Message-ID: <1291661496.17494.221.camel@Joe-Laptop>
References: <cover.1291611190.git.joe@perches.com>
	 <1291649869.3065.2095.camel@calx>  <1291659120.17494.179.camel@Joe-Laptop>
	 <1291659380.3065.2214.camel@calx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1291659380.3065.2214.camel@calx>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Mackall <mpm@selenic.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2010-12-06 at 12:16 -0600, Matt Mackall wrote:
> On Mon, 2010-12-06 at 10:12 -0800, Joe Perches wrote:
> > There could be ~500 bytes more saved if hex_dump_to_buffer
> > was compiled out.
> Can't say I'm excited by this approach. .5k is under my threshold for
> this level of invasiveness.

Mine too, but I thought I'd mention it.


