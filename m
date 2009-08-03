From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 6/6] Add LZO compression support for initramfs and old-style
 initrd
Date: Mon, 03 Aug 2009 08:12:03 -0700
Message-ID: <4A76FE43.4070708@zytor.com>
References: <20090731093107.GA29704@merkur.ravnborg.org> <1249311501-23102-1-git-send-email-albin.tonnerre@free-electrons.com> <1249311501-23102-2-git-send-email-albin.tonnerre@free-electrons.com> <1249311501-23102-3-git-send-email-albin.tonnerre@free-electrons.com> <1249311501-23102-4-git-send-email-albin.tonnerre@free-electrons.com> <1249311501-23102-5-git-send-email-albin.tonnerre@free-electrons.com> <1249311501-23102-6-git-send-email-albin.tonnerre@free-electrons.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755211AbZHCPRc@vger.kernel.org>
In-Reply-To: <1249311501-23102-6-git-send-email-albin.tonnerre@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Albin Tonnerre <albin.tonnerre@free-electrons.com>
Cc: sam@ravnborg.org, linux@arm.linux.org.uk, alain@knaff.lu, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, akpm@linux-foundation.org

On 08/03/2009 07:58 AM, Albin Tonnerre wrote:
>  
> +config INITRAMFS_COMPRESSION_LZO
> +	bool "LZO"
> +	depends on RD_LZO
> +	help
> +	  Its compression ratio is the poorest among the four. The kernel
> +	  size is about about 10% bigger than gzip; however its speed
> +
>  endchoice

Truncated help text...

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.
