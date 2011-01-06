From: "Luck, Tony" <tony.luck@intel.com>
Subject: RE: [PATCH 00/17] pramfs: persistent and protected RAM filesystem
Date: Thu, 6 Jan 2011 10:22:42 -0800
Message-ID: <987664A83D2D224EAE907B061CE93D530193FC6AA2@orsmsx505.amr.corp.intel.com>
References: <4D25AEEE.1050401@gmail.com> <1294322613.2016.333.camel@laptop>
 <4D25ED22.3070900@gmail.com> <4D25F4CF.1030009@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4D25F4CF.1030009@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>

> Errata corrige: maybe I used the wrong term, I meant "volatile" instead
> of "temporary" information, i.e. I'd like to save this info to re-read
> it later but I don't want to store it in flash, a simple log, run-time
> information for debug like a flight-recorder or whatever you want.

I'm puzzled by the use of "a generic piece of memory" to store "persistent"
things (Perhaps this is made clear in the 17 parts of the patch? I haven't
read them yet).  On x86 f/w typically clears all of memory on reset ... so
you only get persistence if you use kexec to get from the old kernel to
the new one.

-Tony
