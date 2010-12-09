From: Lasse Collin <lasse.collin@tukaani.org>
Subject: Re: [PATCH 2/2] Squashfs: Add XZ compression configuration option
Date: Thu, 9 Dec 2010 11:09:31 +0200
Message-ID: <201012091109.32084.lasse.collin@tukaani.org>
References: <4D007315.1090704@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4D007315.1090704@lougher.demon.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org, Linux Embedded Maillist <linux-embedded@vger.kernel.org>

On 2010-12-09 Phillip Lougher wrote:
> +config SQUASHFS_XZ
> +       bool "Include support for XZ compressed file systems"
> +       depends on SQUASHFS
> +       default n
> +       select XZ_DEC

Should "select XZ_DEC" be replaced with "depends on XZ_DEC"? XZ_DEC 
requires CRC32, so if "select XZ_DEC" is used, there needs to be also 
"select CRC32".

XZ_DEC may optionally use other XZ_DEC_* symbols, which the user will 
want to choose when building for an embedded system. With "depends on 
XZ_DEC" the user will see that there's more than a single option that 
affects the details of the XZ support in Squashfs.

-- 
Lasse Collin  |  IRC: Larhzu @ IRCnet & Freenode
