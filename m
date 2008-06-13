From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: Not as much ccache win as I expected
Date: Fri, 13 Jun 2008 14:10:29 -0700
Message-ID: <4852E245.4020502@am.sony.com>
References: <4852C51D.30206@am.sony.com> <8499950a0806131354u7d2431b2n2df50b7b6c98f18d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <8499950a0806131354u7d2431b2n2df50b7b6c98f18d@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Verych <olecom@gmail.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux-kbuild@vger.kernel.org

Oleg Verych wrote:
> And what kinds of source/kconfig changes are made for every build?

I start with a baseline config for an embedded board, then
alter, one at a time, individual config items related to kernel size.
No source changes are made.

I do full removal of the kernel source tree and build area
before the start of each test.

> (any versions, e.g. localversion, .version, aren't important, they are for
> modules ko and vmlinux, afaik)
Ok - this is helpful.

> kbuild is `ccache` on itself. Every *.o.cmd is kind of info `ccache`
> hashes (except things like stderr, gcc version) to check repeated
> rebuilds.
Yeah, I'm pretty impressed with how well kbuild avoids rebuilding
stuff in the first place.

Maybe I should just be grateful for any ccache hits I get.

Thanks,
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================

