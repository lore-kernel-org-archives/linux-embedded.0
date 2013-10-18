From: Michael Opdenacker <michael.opdenacker@free-electrons.com>
Subject: Re: [PATCH v2] init: make init failures more explicit
Date: Fri, 18 Oct 2013 15:03:52 +0200
Message-ID: <526131B8.5030207@free-electrons.com>
References: <1382097633-10166-1-git-send-email-michael.opdenacker@free-electrons.com> <CAMuHMdXas3ALeMXkj1YuDARVAL4Ln19UjXm8oRiGoLyKBc_B7A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXas3ALeMXkj1YuDARVAL4Ln19UjXm8oRiGoLyKBc_B7A@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, janne.karhunen@gmail.com

On 10/18/2013 02:20 PM, Geert Uytterhoeven wrote:
> On Fri, Oct 18, 2013 at 2:00 PM, Michael Opdenacker
> <michael.opdenacker@free-electrons.com> wrote:
>> +               pr_err("Starting init: %s exists but couldn't execute it (error: %d - see errno-base.h and errno.h)\n",
> IMHO the "- see errno-base.h and errno.h" is a bit overkill.
Yes, I was wondering. Good to have your opinion on this!

I'll post an update with just the error number, also adding the error
code to the other two "Failed to execute" error messages.

Thanks!

Michael.

-- 
Michael Opdenacker, CEO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
+33 484 258 098
