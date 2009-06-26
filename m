From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: Kernel crashing and log buffers...
Date: Fri, 26 Jun 2009 13:50:22 -0400
Message-ID: <8bd0f97a0906261050u5baba3f0j88217eca96849f3e@mail.gmail.com>
References: <200906102126.40410.rgetz@blackfin.uclinux.org> 
	<20090611175303.GA10058@cuplxvomd02.corp.sa.net> <200906261039.50570.rgetz@blackfin.uclinux.org> 
	<20090626174219.GA19426@cuplxvomd02.corp.sa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=uozDPmm5nyipWmhtSAeaCGbmucB087g3NdG7txnjLgE=;
        b=Xz33t8TSi4zeiBV+qxn83wa1iUVtbmkSwS8lGMAU2TSps5OmpKXe4gV9ftHonBUik+
         bbBHySnrqDJcrGKzzGmZQ/JAbV8DVRX7F42LX7kiTB1yDATbLsrzRrCNM7TZ3laizIYM
         gspP0KKb21r6VkYmaOAmDlAQ9uZUgI2c0Ssfs=
In-Reply-To: <20090626174219.GA19426@cuplxvomd02.corp.sa.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David VomLehn <dvomlehn@cisco.com>
Cc: Robin Getz <rgetz@blackfin.uclinux.org>, Greg Ungerer <gerg@snapgear.com>, Russell King <rmk@arm.linux.org.uk>, Paul Mundt <lethal@linux-sh.org>, Tim Bird <tim.bird@am.sony.com>, Wolfgang Denk <wd@denx.de>, Grant Erickson <gerickson@nuovations.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Fri, Jun 26, 2009 at 13:42, David VomLehn wrote:
> On Fri, Jun 26, 2009 at 10:39:50AM -0400, Robin Getz wrote:
>> OK - so after a bit more digging into things (and a poke by Mike) - =
I think
>> most of the stuff already exists.
>>
>> Normal run time issues:
>> --------------------------
>> =C2=A0- MTD_OOPS - on 2007-06-28 this was added to Linus's tree:
>> =C2=A0 =C2=A0 http://lkml.org/lkml/2007/6/18/234
>> =C2=A0 =C2=A0 CONFIG_MTD_OOPS
>> =C2=A0 =C2=A0 =C2=A0 tristate "Log panic/oops to an MTD buffer"
> ...
>> early boot issues:
>> ----------------------
>> =C2=A0- CONFIG_EARLY_PRINTK
>> =C2=A0 =C2=A0- early printk just defined a console - and is supporte=
d by:
>> =C2=A0 =C2=A0 =C2=A0 alpha, blackfin, microblaze, mips, powerpc, sh,=
 x86
>> =C2=A0 =C2=A0- it's pretty trivial to support a memory based buffer =
- some
>> =C2=A0 =C2=A0 =C2=A0archs already support it.
>>
>> I think this only leaves Wolfgang's desire for memory buffers from t=
he
>> bootloader to get (somehow) into the kernel's log buffer for syslog
>> processing...
>>
>> Anyone else agree?
>
> Almost. A couple of us also want memory for "flight data record" FDR =
data
> for doing continuous logging. This would, ideally, be either uncached=
 or cached
> in such a way that data is guaranteed to be written to memory in the =
event of
> a watchdog timer-induced system reset.

can none of the existing mtd devices provide uncached ram ?
otherwise, create a mtd map that simply calls data flush after every
write.  then the existing mtd stack can provide what you want.
-mike
