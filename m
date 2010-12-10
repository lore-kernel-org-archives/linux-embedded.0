From: Lasse Collin <lasse.collin@tukaani.org>
Subject: Re: [PATCH 2/2] Squashfs: Add XZ compression configuration option
Date: Fri, 10 Dec 2010 12:37:23 +0200
Message-ID: <201012101237.23379.lasse.collin@tukaani.org>
References: <4D007315.1090704@lougher.demon.co.uk> <201012091109.32084.lasse.collin@tukaani.org> <4D01D70A.5050508@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4D01D70A.5050508@lougher.demon.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org, Linux Embedded Maillist <linux-embedded@vger.kernel.org>

On 2010-12-10 Phillip Lougher wrote:
> Lasse Collin wrote:
> > On 2010-12-09 Phillip Lougher wrote:
> >> +config SQUASHFS_XZ
> >> +       bool "Include support for XZ compressed file systems"
> >> +       depends on SQUASHFS
> >> +       default n
> >> +       select XZ_DEC
> > 
> > Should "select XZ_DEC" be replaced with "depends on XZ_DEC"? XZ_DEC
> > requires CRC32, so if "select XZ_DEC" is used, there needs to be
> > also "select CRC32".
> 
> XZ_DEC selects CRC32, kbuild handles these nested selects quite
> happily, so if something selects XZ_DEC it knows it has to also
> select CRC32.

OK, I had misunderstood the notice about "select" and dependencies in 
Documentation/kbuild/kconfig-language.txt.

> Depends on has quite different semantics to selects.  If SQUASHFS_XZ
> was made to depend on XZ_DEC then the option simply won't appear
> unless the user knew to select XZ_DEC first (as it's default n). 
> This would prove extremely confusing, and probably lead to most
> people thinking Squashfs didn't have XZ support, which is somewhat
> undesirable.

Good point. I always keep the inactive options visible in xconfig so I 
missed this. I will need to update my XZ boot-time support patch to use 
"select" instead of "depends on" too. Thanks!

-- 
Lasse Collin  |  IRC: Larhzu @ IRCnet & Freenode
