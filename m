From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: Kernel crashing and log buffers...
Date: Thu, 11 Jun 2009 19:27:16 -0400
Message-ID: <8bd0f97a0906111627h128cc561y2bf4a0b2b30d7187@mail.gmail.com>
References: <200906102126.40410.rgetz@blackfin.uclinux.org> 
	<20090611175303.GA10058@cuplxvomd02.corp.sa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=7rmMnyt7esn2Ip9BURabk7TyVSBdIA3ynNlnj2y+O44=;
        b=bPzOWBJ7aZ2skeIiDnCsXy9heKSYmKlXtaCtzr+k/RiArtZGnEBagNy5p4mU/bKRrS
         bV3VsW32GIb/THmcawQgtCwOSZRyycG6iHXbN7D1gw6IkzeNvK5IkDOyHKRZNnneX+fu
         PR6OOOJ20NAnBdplwr9mnnPnYKZpgufm6DDtE=
In-Reply-To: <20090611175303.GA10058@cuplxvomd02.corp.sa.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David VomLehn <dvomlehn@cisco.com>
Cc: Robin Getz <rgetz@blackfin.uclinux.org>, Greg Ungerer <gerg@snapgear.com>, Russell King <rmk@arm.linux.org.uk>, Paul Mundt <lethal@linux-sh.org>, Tim Bird <tim.bird@am.sony.com>, Wolfgang Denk <wd@denx.de>, Grant Erickson <gerickson@nuovations.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Thu, Jun 11, 2009 at 13:53, David VomLehn wrote:
> On Wed, Jun 10, 2009 at 09:26:40PM -0400, Robin Getz wrote:
>> On 17 Oct 2007, after much discussion and debate, Mike added add two=
 new
>> functions for reading the kernel log buffer (from kernel space).
>>
>> http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=
=3Dcommit;h=3D0b15d04af3dd996035d8fa81fc849d049171f9c3
>>
>> The intention was for them to be used by recovery/dump/debug code so=
 the
>> kernel log can be easily retrieved/parsed by the bootloader (or anot=
her
>> kernel) in a crash scenario.
>>
>> I was going to push the arch specific recovery/dump/debug code that =
uses them
>> upstream (yeah, it has been a little while - but anyway...) it was r=
emoved
>> since then by Roel Kluin ...
>>
>> 21 Oct 2008:
>> http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=
=3Dcommitdiff;h=3Dacff181d3574244e651913df77332e897b88bff4
>>
>> Before I ask Andrew to add it back, I thought I would make sure it w=
as still a
>> useful function, and did everything everyone wanted - and wasn't dee=
med
>> unnecessary by a feature/function that I wasn't aware of - like the =
next
>> thing...
>>
>> I saw the patch Grant sent recently - Add Alternative Log Buffer Sup=
port for
>> printk Messages (in Nov2008 to the embedded list, and Jan 2009 to lk=
ml) - but
>> I couldn't find any followups - and it doesn't seem to be in Linus's=
 tree.
>>
>> http://thread.gmane.org/gmane.linux.kernel.embedded/1358/focus=3D137=
3
>>
>> http://lkml.org/lkml/2009/1/21/250
>>
>> I can see the desire on Wolfgang & Grant's part - for not needing th=
e copy
>> from/to - (you never have to worry about crashing "nicely" - the ker=
nel
>> panics, but you still need to copy memory around - potentially causi=
ng all
>> kinds of secondary issues - and masking the real reason the crash oc=
curred).
>>
>> But for the majority of the case - the copy from/to would work much =
better
>> than what we have in mainstream today...
>>
>>
>> I would be interested in Paul and Russell - how have you solved this=
 issue?
>> (Or do your kernel's never crash? :)
>
> Our kernel does crash, so we have to do this. I had submitted a patch=
 a
> while ago that tweaks emit_log_char, but this was bounced, reasonably=
,
> because it would be interferring with the great majority of people wh=
o
> are not interested in capturing log output. The suggestion was made t=
hat
> we do this with a console driver. I've recently got a version working=
, as
> a module, but I've only started testing of the version integrated int=
o the
> kernel tree. =C2=A0Still, post early, post often, so I've appended a =
version
> of the patch here to see if this seems to be the right direction.

i guess there's two distinct crash types: early and late.  your
console driver seems like it should be able to handle the "late"
variety ok (i.e. the kernel is up and running and at some point, it
blows up).  but it doesnt address the early crashes which is what
we're currently looking for (i.e. kernel crash occurs before the
serial console is up and running).

i think extending this driver to include early printk support should
address that ?
-mike
