From: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
Subject: Re: Some embedded topics
Date: Thu, 29 May 2008 07:34:10 +0200
Message-ID: <20080529053410.A43D3247CC@gemini.denx.de>
References: <200805282201.48746.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: Your message of "Wed, 28 May 2008 22:01:48 CDT."
             <200805282201.48746.rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Sender: linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Cc: T Ziomek <ctz001-qbu1+ugcRq/by3iVrkZq2A@public.gmane.org>, Mike Frysinger <vapier.adi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

In message <200805282201.48746.rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org> you wrote:
> 
> The standard way of doing this is to use the mem= kernel command line 
> parameter to tell the system it has less memory than it does, and using 
> what's left as a ramdisk.  Years ago I saw some userspace thing running as 
> root mmap() /dev/mem (or whatever they're calling it these days) and log to 
> it.  In theory you could even set the dmesg buffer up at the end of physical 
> memory with a smallish kernel patch, make it big, and set the kernel to doing 
> verbose printks.

That's not theory, but a standard feature in U-Boot. It's called
shared log buffer, as U-Boot can also use this buffer for example for
POST results.

> The trick is A) knowing the absolute physical address at which your debug 
> buffer lives so you can find it after the reboot, B) convincing the system to 
> do something useful with it on reboot rather than just overwriting it with 
> fresh log data.

There is no trickery involved.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd-ynQEQJNshbs@public.gmane.org
My brother sent me a postcard the other day with this  big  sattelite
photo  of the entire earth on it. On the back it said: "Wish you were
here".                                                - Steven Wright
--
To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
