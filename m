From: Rob Landley <rob@landley.net>
Subject: Re: execve(NULL, argv, envp) for nommu?
Date: Tue, 5 Sep 2017 20:12:01 -0500
Message-ID: <ab6e6e8b-7040-a07d-5502-405701182568@landley.net>
References: <324c00d9-06a6-1fc5-83fe-5bd36d874501@landley.net>
 <CAMuHMdUPUaLfbbFF1kZoEUy7or-9sVOt=ykAHT+S6NBvFy5V=g@mail.gmail.com>
 <20170905142436.262ed118@alans-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wGaIOn9O9JDkvypX7OmwA0SZbiomp4AwAZdeyN9lN7A=;
        b=ehI3mjirTSQy0sD7sx2Z/wfVN0pB8itDsM41yiqs2YPZe54Z4WZX4Wn1XUBwn9/cxZ
         BHVLrjO1cDlHHks3kR+xrTaycIgb+wc2hRw+3fNcvL5bz6niHpUlaafrtq+GQox32KPB
         27eU14o2BTyyqYm9iP9JUEVpSQFNncdZISmF4mw+i+64KxodNbqiaoZtpo6sRID3W/8T
         /ZUIBSUhcl4EF74uPiqlkW/eBBuNjXxZ1GLHLmGwF3q+MvLyeoy542RnsRtKzDVQRXW1
         K9BGNQ1KhBsY0aHmGxn77wN6HdSgzLiWsZekndN6T3PlSAIO9uLYuodPHOeyu+yd2z/C
         fEqg==
In-Reply-To: <20170905142436.262ed118@alans-desktop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>, dalias@libc.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 09/05/2017 08:24 AM, Alan Cox wrote:
>>> anymore. But I'm already _running_ this program. If I could fork() I
>>> could already get a second copy of the sucker and call main() again
>>> myself if necessary, but I can't, so...
> 
> You can - ptrace 8)

Oh I can call clone() with various flags and try to fake it myself, it
just won't do what I want. :)

>>> honoring the suid bit if people feel that way. I just wanna unblock
>>> vfork() while still running this code. 
> 
> Would it make more sense to have a way to promote your vfork into a
> fork when you hit these cases (I appreciate that fork on NOMMU has a much
> higher performance cost as you start having to softmmu copy or swap
> pages).

It's not the performance cost, it's rewriting all the pointers.

Without address translation, copying the existing mappings to a new
range requires finding and adjusting every pointer to the old data,
which you can do for the executable mappings in PIE* binaries, but
tracking down all the pointers on the stack, heap, and in your global
variables? Flaming pain.

Making fork() work on nommu is basically the same problem as making
garbage collection work in C on mmu. Thus those of us who defend vfork()
from the people who don't understand why it exists periodically
suggesting we remove it.

> Alan

Rob

* or FDPIC, which is basically just PIE with 4 individually relocatable
text/data/rodata/bss segments instead of one big mapping you relocate as
a contiguous block; both work on nommu but fdpic can fit into more
fragmented memory, and becauase the segments are independent it lets
nommu share some segments between processes (code+rodata**) without
sharing others (data and bss). That's why nommu can't run normal elf but
can run PIE or FDPIC binaries. Or binflt which is the old a.out version.

** Don't ask me what happens when rodata contains a constant pointer to
a bss or data object. I'm guessing the compiler Does A Thing. Ask Rich
Felker?
