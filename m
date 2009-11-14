From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH, RFC] panic-note: Annotation from user space for panics
Date: Sat, 14 Nov 2009 09:28:04 +0100
Message-ID: <4AFE6A14.4010507@gmail.com>
References: <20091112021322.GA6166@dvomlehn-lnx2.corp.sa.net>	 <4AFC4D31.2000101@gmail.com>	 <20091112215649.GA28349@dvomlehn-lnx2.corp.sa.net>	 <20091113091031.3f6d4bba@marrow.netinsight.se> <1258112748.21596.1227.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=7d/3LagYFMVKsQUVXYHHrYkw/akee2bCgtkzbPwZsoU=;
        b=MaA6S40nBBJ3efj4ArJSRVY3ZlaTme+eLoOCz/nWbTtF5LenXVqaFwC8z7owvKgtKa
         6LpQ+7pnIQR/qMg72dfdc90+ltTjPCnrfasIx0Ml7h/9yKaBVnAKfIk22MfTNvsDkrHf
         zVrShuglODw85FZfuchfon6w+m/uEkbQr+dRQ=
In-Reply-To: <1258112748.21596.1227.camel@localhost>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: dedekind1@gmail.com
Cc: Simon Kagstrom <simon.kagstrom@netinsight.net>, David VomLehn <dvomlehn@cisco.com>, linux-embedded@vger.kernel.org, akpm@linux-foundation.org, dwm2@infradead.org, linux-kernel@vger.kernel.org, mpm@selenic.com, paul.gortmaker@windriver.com

I think in general the procedure should be: at startup or event (for
example acquired IP address from DHCP) user applications write in flash
(better in persistent ram) a log with a tag or a timestamp or something
like this, when there is a kernel panic, it is captured in a file stored
together the log and when possible the system should send all via
network for example. Are there problems that I can't see to follow this
approach? When David says "...so this looks much more like a real file
than a sysctl file" I quite agree, it seems a normal application/system
log indeed.

Marco

Artem Bityutskiy wrote:
> On Fri, 2009-11-13 at 09:10 +0100, Simon Kagstrom wrote:
>> On Thu, 12 Nov 2009 16:56:49 -0500
>> David VomLehn <dvomlehn@cisco.com> wrote:
>>
>>> Good question. Some more detail on our application might help. In some
>>> situations, we may have no disk and only enough flash for the bootloader.
>>> The kernel is downloaded over the network. When we get to user space, we
>>> initialize a number of things dynamically. For example, we dynamically
>>> compute some MAC address, and most of the IP addresses are obtained with
>>> DHCP. This are very useful to have for panic analysis.
>>>
>>> Since there is neither flash nor disk, user space has no place to store
>>> this information, should the kernel panic. When we come back up, we will get
>>> different MAC and IP addresses. Storing them in memory is our only hope.
>>>
>>> Fortunately, there is a section of RAM that the bootloader promises not
>>> to overwrite. On a panic, we capture the messages written on the console
>>> and store them in the protected area. If the information from the
>>> /proc file is written as part of the panic, we will capture it, too.
>> Can't you solve this completely from userspace using phram and mtdoops
>> instead? I.e., setup two phram areas
>>
>> 	modprobe phram 4K@start-of-your-area,4K@start-of-your-area+4K    # Can't remember the exact syntax!
>>
>> you'll then get /dev/mtdX and /dev/mtdX+1 for these two. You can then do
>>
>> 	modprobe mtdoops mtddev=/dev/mtdX+1 dump_oops=0
>>
>> to load mtdoops to catch the panic in the second area, and just write
>> your userspace messages to /dev/mtdX.
> 
> This might work for them, not sure, but not for us. We store panics on
> flash, and later they are automatically sent to the panic collection
> system via the network. And the complications are:
> 
> 1. There may be many panics before the device has network access and has
> a chance to send the panics.
> 2. User can re-flash the device with different SW inbetween.
> 
> So we really need to print some user-space supplied information during
> the panic, and then we store it on flash with mtdoops, and the later,
> when the device has network access we send whole bunch of oopses via the
> network.
> 
>> One thing probably have to be fixed though: I don't think phram has a
>> panic_write, which will be needed by mtdoops to catch the panic - this
>> should be trivial to add though since it's plain RAM.
> 
