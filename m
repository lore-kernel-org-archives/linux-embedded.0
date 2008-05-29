From: "Mike Frysinger" <vapier.adi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Some embedded topics
Date: Thu, 29 May 2008 00:21:52 -0400
Message-ID: <8bd0f97a0805282121j10a99bb7ve92efc6a8dc8bbb1@mail.gmail.com>
References: <483C83DE.3040604@cisco.com>
	 <8bd0f97a0805271527i622a31b8t68ba24c80a2e034a@mail.gmail.com>
	 <20080527223142.GU26837@email.mot.com>
	 <200805282201.48746.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=dWtYXgRSCcgd6OIMOMIbWPQeYyNAE3gY/SdYzCX7ieQ=;
        b=Jc67NdtlMsiFI88hS7AHNaLYdNqZdkJI9/R0Sfcb4ej28w2jsRZY+tw6xfq5nA+IPL+Ok5QQ34kOrSXSdg0dG8yfbquARr4bHULbi67Mser2Sf9J6DEeBdEWaxyqJGlHz8KMNGRnfhiK7nmmkBaG9s2uYyX/amuwbtSpXYhMvAQ=
In-Reply-To: <200805282201.48746.rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Content-Disposition: inline
Sender: linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Cc: T Ziomek <ctz001-qbu1+ugcRq/by3iVrkZq2A@public.gmane.org>, David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, May 28, 2008 at 11:01 PM, Rob Landley wrote:
> On Tuesday 27 May 2008 17:31:42 T Ziomek wrote:
>> If I understand correctly David is talking about logging some trace-like
>> info (so it exists before a HW watchdog expires), and having it somewhere
>> "safe" from being disturbed by a HW reset.
>
> The standard way of doing this is to use the mem= kernel command line
> parameter to tell the system it has less memory than it does, and using
> what's left as a ramdisk.  Years ago I saw some userspace thing running as
> root mmap() /dev/mem (or whatever they're calling it these days) and log to
> it.  In theory you could even set the dmesg buffer up at the end of physical
> memory with a smallish kernel patch, make it big, and set the kernel to doing
> verbose printks.
>
> The trick is A) knowing the absolute physical address at which your debug
> buffer lives so you can find it after the reboot, B) convincing the system to
> do something useful with it on reboot rather than just overwriting it with
> fresh log data.

how about the fact that when the core resets, the memory controller is
often reset as well ?  that external memory is going to degrade.  or
do we just bite our thumb and weather the few random bit errors ?
-mike
--
To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
