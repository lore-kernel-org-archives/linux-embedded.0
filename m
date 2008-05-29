From: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Subject: Re: Some embedded topics
Date: Wed, 28 May 2008 22:01:48 -0500
Message-ID: <200805282201.48746.rob@landley.net>
References: <483C83DE.3040604@cisco.com> <8bd0f97a0805271527i622a31b8t68ba24c80a2e034a@mail.gmail.com> <20080527223142.GU26837@email.mot.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080527223142.GU26837-qbu1+ugcRq/by3iVrkZq2A@public.gmane.org>
Content-Disposition: inline
Sender: linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: T Ziomek <ctz001-qbu1+ugcRq/by3iVrkZq2A@public.gmane.org>
Cc: Mike Frysinger <vapier.adi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tuesday 27 May 2008 17:31:42 T Ziomek wrote:
> If I understand correctly David is talking about logging some trace-like
> info (so it exists before a HW watchdog expires), and having it somewhere
> "safe" from being disturbed by a HW reset.

The standard way of doing this is to use the mem= kernel command line 
parameter to tell the system it has less memory than it does, and using 
what's left as a ramdisk.  Years ago I saw some userspace thing running as 
root mmap() /dev/mem (or whatever they're calling it these days) and log to 
it.  In theory you could even set the dmesg buffer up at the end of physical 
memory with a smallish kernel patch, make it big, and set the kernel to doing 
verbose printks.

The trick is A) knowing the absolute physical address at which your debug 
buffer lives so you can find it after the reboot, B) convincing the system to 
do something useful with it on reboot rather than just overwriting it with 
fresh log data.

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
--
To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
