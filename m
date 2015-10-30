From: Trevor Woerner <twoerner@gmail.com>
Subject: Re: [PATCH v2] fs/binfmt_elf_fdpic.c: provide NOMMU loader for
 regular ELF binaries
Date: Fri, 30 Oct 2015 15:39:01 -0400
Message-ID: <5633C755.5050306@gmail.com>
References: <20151008163810.GX8645@brightrain.aerifal.cx>
 <561CFF51.40909@uclinux.org> <20151013154940.GR8645@brightrain.aerifal.cx>
 <561F0ADA.40504@uclinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=P5opSQAwB6XlXoV47CkM24Wp+xaLpns06MZRoBi+taI=;
        b=CXtmyTF1nJmaYf6J5mBtUR1MpjKZYS/KLiF0gZS5mWdMIpU5LXSTjsIZ0AI7m9u8Uj
         akBwAdz6PvzcPqNtLhEmM0XT3WT5z60z2OI2BzMFUf99JTfBXHDKCI2V7985u+YwWceB
         Qf0VapDhMNee6dG87LaaO8ejh6lXPbUTRznn8yB+43lfMBDt5Bdr1OUUP61DR6BJVVWF
         ikKJxEQYB8/jvL7sYkO1NYuqqEgixhR6MSw9zl3bzen1ZpaeniROTLU+oMyzKgbpw41F
         qZ3YQ546OPkVy6U8E09pb3sipRUthNjMMkK54oLBhEBnUgEnXejTWNzOC7IGqsJZXqBn
         osUw==
In-Reply-To: <561F0ADA.40504@uclinux.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Greg Ungerer <gerg@uclinux.org>, Rich Felker <dalias@libc.org>
Cc: linux-embedded@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Matt Mackall <mpm@selenic.com>, David Woodhouse <dwmw2@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>, Oleg Endo <oleg.endo@t-online.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org



On 10/14/15 22:09, Greg Ungerer wrote:
> Hi Rich,
>
> On 14/10/15 01:49, Rich Felker wrote:
>> On Tue, Oct 13, 2015 at 10:55:45PM +1000, Greg Ungerer wrote:
>>> Hi Rich,
>>>
>>> On 09/10/15 02:38, Rich Felker wrote:
>>> It would be good to get some testing and verification on other
>>> fdpic supported arches (frv or blackfin or microblaze for example).
>> I wasn't aware Microblaze had an FDPIC ABI; are you sure it does?

What about ARM Cortex-M?
https://sfo15.pathable.com/mobile/meetings/303078
