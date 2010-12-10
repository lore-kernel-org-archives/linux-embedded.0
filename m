From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: [PATCH 2/2] Squashfs: Add XZ compression configuration option
Date: Fri, 10 Dec 2010 07:30:18 +0000
Message-ID: <4D01D70A.5050508@lougher.demon.co.uk>
References: <4D007315.1090704@lougher.demon.co.uk> <201012091109.32084.lasse.collin@tukaani.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201012091109.32084.lasse.collin@tukaani.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Lasse Collin <lasse.collin@tukaani.org>
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org, Linux Embedded Maillist <linux-embedded@vger.kernel.org>

Lasse Collin wrote:
> On 2010-12-09 Phillip Lougher wrote:
>> +config SQUASHFS_XZ
>> +       bool "Include support for XZ compressed file systems"
>> +       depends on SQUASHFS
>> +       default n
>> +       select XZ_DEC
> 
> Should "select XZ_DEC" be replaced with "depends on XZ_DEC"? XZ_DEC 
> requires CRC32, so if "select XZ_DEC" is used, there needs to be also 
> "select CRC32".
> 

XZ_DEC selects CRC32, kbuild handles these nested selects quite happily,
so if something selects XZ_DEC it knows it has to also select CRC32.

Depends on has quite different semantics to selects.  If SQUASHFS_XZ
was made to depend on XZ_DEC then the option simply won't appear unless
the user knew to select XZ_DEC first (as it's default n).  This would
prove extremely confusing, and probably lead to most people thinking
Squashfs didn't have XZ support, which is somewhat undesirable.

> XZ_DEC may optionally use other XZ_DEC_* symbols, which the user will 
> want to choose when building for an embedded system. With "depends on 
> XZ_DEC" the user will see that there's more than a single option that 
> affects the details of the XZ support in Squashfs.
>

With depends on XZ_DEC the user will simply not see that Squashfs has
XZ support (as the option won't appear unless XZ_DEC is explicitly
selected).

With selects XZ_DEC users will see that Squashfs has XZ support, if
enabled, they'll simply see that XZ_DEC has been automatically
selected in the "Library routines" sub-menu.  If EMBEDDED is not
selected the XZ_DEC options will be automatically selected (as
they're only user selectable if EMBEDDED is selected).  If
EMBEDDED is selected, then they'll have the choice then to decide
which options they wish to de-select.

I think this is preferable to needing XZ_DEC to be selected before
the SQUASHFS_XZ option even appears.

Phillip
