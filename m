From: Andy Green <andy@warmcat.com>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi,	lightweight
 bootloader
Date: Tue, 22 Dec 2009 08:22:27 +0000
Message-ID: <4B3081C3.3000909@warmcat.com>
References: <4B29EC68.1040109@0xlab.org> <4B29F834.90108@warmcat.com> <20091221193038.38CB63F6EF@gemini.denx.de> <4B2FD7DB.10008@warmcat.com> <20091221213829.1A8B93F6EF@gemini.denx.de> <4B2FF8E7.505@warmcat.com> <20091221231922.GO22533@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:sender:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=og3sAhYEzpu+Ssl0BcRzkMMLtIPVxjQ+Voq41/6bPxQ=;
        b=dZjt4M1Ds0/C8qfDykVVAZP7jMUGWZR1923nz5siVQ7c4XUf05qeu8QBdv7snl9Znz
         Hfc3Tw/Qh/7TIhth+28HFKIATMq8qdBTjYEehYGoEkJZXtA8DNWk4PUJAqnoSdSTqrGQ
         Yow/C/N+sXjjwMUHSHFfkBKDtyeov2HwCSCsQ=
In-Reply-To: <20091221231922.GO22533@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: Wolfgang Denk <wd@denx.de>, celinux-dev@tree.celinuxforum.org, linux-embedded@vger.kernel.org

On 12/21/09 23:19, Somebody in the thread at some point said:

Hi Robert -

Thanks for your reply.

 > mode", so you can re-flash as often as you like. However, our use cases
 > are probably different than yours (deeply embedded systems, which often
 > don't even have removable stuff like SD or USB sticks).

Right, some of what Qi proposes won't work on all systems, like SD boot 
where there is no SD card.  But the core "just load and boot" heuristic 
should work almost anywhere.

 >>    - special update mechanisms
 >
 > What do you mean with "special"?

> Hmm, there have been interesting items in the openmoko trees. For
> barebox, we took the DFU support, which was done in a device specific
> way, cleaned that up and made a generic command out of it:

DFU is a "special update mechanism" which I believe is a bad idea.

I know a lot of people are still putting out full rootfs images as 
updates, and for some platforms that are too resource-constrained that's 
all people can do.

But for modern devices like ARM11+ and the kind of board they typically 
find themselves on with a network connection, these are fundamentally at 
the level of PC from a few years ago.  Linux PCs then and now use 
packaged update systems to manage the software on the device.  And they 
package both the kernel and the bootloader and track and update it like 
any other package, apply packagesets as transactions, etc.  The correct 
approach I believe is to unify the bootloader (and kernel) update path 
with the rest of the system, all done from Linux alone.

(Personally I used Fedora ARM port and RPM, but any distro and 
packagesystem like Debian workable on ARM would be fine).

> dfu /dev/self0(bootloader)sr,/dev/nand0.root.bb(root)
>
> You can specify the slots on the command line, not hardcoded. Whereas we
> reworked the interfaces, the core code was pretty interesting. So I
> think some items it would have been worth to be pushed into u-boot at
> the time it was written.
>
>> Bearing in mind they could only update by DFU and with GTA01, there
>> was no bootloader recovery mechanism if it failed,
>
> Our DFU scenario goes like "press a button while booting goes into DFU
> mode", so you can re-flash as often as you like. However, our use cases
> are probably different than yours (deeply embedded systems, which often
> don't even have removable stuff like SD or USB sticks).

The issue GTA01 faced was that you are updating the thing the button 
takes you to.  If that goes south you have to bust out JTAG / OpenOCD 
and that is definitely not an end-user tool for a consumer product.

In GTA02 a separate NOR was added to contain the "bootloader behind the 
button" which was not updatable in the field, that then caused trouble 
since the updatable NAND bootloaders moved on but that never did.  It 
also acted as the third pole in the love triangle betweeen NAND U-Boot 
and Linux in the NAND ECC / BBT differences since it could only recover 
the NAND bootloader only with the NOR bootloader's fixed idea of what 
ECC and BBT looked like, no matter what we had done with updates to the 
NAND bootloader in the meanwhile (eg, move from soft to incompatible but 
faster hard ECC in Linux).  So we were actually unable to migrate to 
hard ECC in Linux, which is an insane outcome of a broken system.

In contrast if your chip supports it (iMX31 and s3c6410 do and Qi works 
with those) having your bootloader on some sectors of SD card is 
wonderfully simple and easy to dd in on a postinstall scriptlet of your 
bootloader package.

> In general, I like in-system techniques much better than card juggeling,
> because it fits better into automated environments like our RemoteLab,
> which does our automatic nightly tests. But that's surely a matter of
> the use case you have.

Agreed.

But consider this: if your bootloader is on SD, and your bootloader 
completely rejects to hold private state on the board (other than 
onetime individualization, eg MAC address), something awesome happens 
when you pop your SD card and put it in another board, it comes up like 
the previous board did, no ifs or buts.

You can imagine the effect that has on production / test "virgin" board 
bringup.  When you have seen this, you do not want to return to raw 
onboard NAND.

>> The main lessons I took from that was the dollar and time value of
>> removing the "unnecessary features" in U-Boot and especially the
>> Openmoko tree of it:
>
> In barebox, we use Kconfig to configure things away; so removing
> unnecessary features is just a matter of 'make menuconfig'.

That is good, but what I am suggesting is that

  - these things are definitively unnecessary, ie, they deserve 
permanent deselection

  - the config system leads to bootloader-binary-per-variant Hell

Because Qi burns off all the peripheral support and leaves it to Linux, 
actually building in support for multiple boards and multiple variants 
is pretty lightweight.  The CPU bringup is always the same, SDRAM 
bringup may vary slightly and kernel commandlines and paths, amount and 
maybe placement of memory will change.

Qi uses a per-board callback in an API struct to discover at runtime 
which supported board it's on, and the board can check version bits on 
GPIO typically to discover which variant it is (which is passed on to 
Linux in an ATAG).

>>    - video drivers
>
> I see video drivers in the bootloader as an optimization topic: If you
> can effort to get your splash 3 s after power-on, you should leave video
> drivers out of the boot loader and do it all in the kernel.
>
> Our competition in industry projects is often the old 2-lines-alpha
> displays, which are "instant on" after you hit the power switch. If this
> is required, I don't see a way to achieve that with kernel-only at the
> moment.

Yeah that is true.  You are into a 1.8 - 2 second (on iMX31 SD boot) 
delay from hitting the button to your driver starting up in Linux and 
getting your display up.

Given what you get out of that from a project management POV, I don't 
think 2 seconds for startup feedback is a problem for most systems.  If 
your system has a hardwired power LED, then even more so.

But if you have to have the display lit quicker, Qi has per-board API 
callback that lets the board set itself up how it needs.  You could add 
this there if you have to.

Have a look at

http://git.warmcat.com/cgi-bin/cgit/qi/tree/src/cpu/imx31/txtr-steppingstone.c?h=txtr

scroll down to the bottom to see how the per-board setup works.

>>    - shells
>
> Especially during development, we often see that the hardware people
> really like having a very limited shell with hardware bit banging access
> in barebox. In a phase where you port Linux to a device, it gives you
> something that works while Linux is not ready yet. And in barebox, you
> have full scripting capabilities, so hardware people can even use that
> for certain qualification scripts.

Yeah I agree hardware people like doing that.  Here's how that innocent 
pastime can take you to Hell.

I described on the Openmoko list how even normally good programmers 
become "like a fat girl in Ibiza" when they see how it is in (Openmoko 
tree anyway) U-Boot, any wild thing goes.  (It was quite sad to have to 
chop down some of the drivers that had pretty good code quality from 
Linux to fit the simplified world in U-Boot).  And some people who 
describe themselves as "hardware guys" are not good programmers.

What it led to was private bootloader trees that did not track the main 
one, filled with perverted bit-twiddling code that was not understood by 
anyone except the guy who wrote it, and that guy left a while back as 
did the guy after him.

These trees were not even on the radar of the software guys nor did any 
patches come.  But it is these decayed stump versions of the bootloader 
forked years ago that will become the basis of production test in a huge 
expensive factory "because it has the test code in it".  By now it's 
test code nobody really understands (even if they are told The Secret of 
its existence) and they daren't uplevel their tree (even if they know 
such black magic is possible) because they neither have the forked 
version unchanged any more nor have heard of revision control outside 
the context of homework.

Because it was an unknown secret whispered only to new initiates in the 
Hardware Club, nobody in the software world is trying to keep 
compatibility with this forked bootloader with resulting car-crashes. 
And indeed a fourth pole in the NAND / ECC policy love quadrangle if 
we're still counting.

Same thing happens if you allow the existence of "test kernels" as with 
"test bootloaders".

Ultimately, even if that had all been correctly managed, it is still not 
preferable to have anything but truly core hardware tests in the 
bootloader (ie, testing of assets required to boot Linux that may not 
already be working since we are running the bootloader: just SDRAM test 
normally) compared to having them in Linux, since they can be scripted 
and reported easily from Linux.

Therefore the only test code in Qi is SDRAM test, no special bootloader 
version is needed (or allowed in my case) for verification or test.

If rapid asset verification is needed, it should be done in Linux with 
stub drivers or added to machine init code temporarily, and in revision 
control of someone who will write the real driver.

All other test actions should be integrated into the Linux driver and if 
they need to be triggered, exposed down /sys.

All of that should be present in normal shipping kernels, so what you 
take to the factory is simply current shipping version of bootloader and 
kernel with no custom build of anything.

>>    - environments
>
> That was one of our design goals in barebox as well: get rid of the
> scripting in the environment, as it was done in u-boot.
>

>
>>    - raw NAND at all
>>    - duplicating the OS in there
>
> If you want to boot from NAND-only devices, how would you do that
> without NAND drivers?

If all you have is NAND on your board then nothing can be done.

But if you have NAND and SD, it is possible

>>    - private nonvolatile state
>
> ?

Private nonvolatile state is stuff like the U-Boot environment that 
lives on the board itself and is out of any update management.

This leads to the situation where two boards from the same factory can 
act totally differently depending on what opaque different secrets have 
been hidden away in their private nonvolatile state, even if everything 
updatable in the rootfs is at the same patchlevel and even the 
bootloaders themselves at the same patchlevel.

That is "private nonvolatile state Hell".

>>    - PMU management when we are already able to run
>
> Several CPUs need PMU support early in the boot stage, because they come
> up in slow-clock mode. So you either boot slow until the kernel is up
> far enough (but then the whole kernel loading is slow), or you need
> access to the PMU from the bootloader.

Yeah.  But in the PMUs I have seen, Vcore is not by default at the level 
where it can ONLY run at 32kHz or whatever.  Instead it is at some 
intermediate voltage like 1.2V by default that will allow midrange 
operation.  (On this iMX31 board I currently work on in fact the PMU 
comes up by default on Vcore high enough for 532Mhz directly.)

That enables you to complete the boot at a reasonable speed without 
actually having the requirement to touch the PMU in those cases.

> In barebox, our design is that we have frameworks for i2c+spi to access
> a PMU, but if you don't need that, you can configure it away. The idea
> is that *if* you actually need it, then better have a good design for
> it.

Yeah Qi has generic gpio bitbang i2c implemented already and we can do 
the same for SPI if needed.  But I think you find most PMU have Vcore by 
default at a place you can run at a reasonable speed without touching it.

>>    - per board variant bootloader image (ie, GTA02 v3 can only run a
>>      special GTA02 v3 binary of U-Boot that can't run on anything else;
>>      Qi has a per CPU binary that supports all variants)
>
> I don't know the GTA02 hardware, but it is often a problem to actually
> detect a certain CPU or board variant on runtime. But if that's
> possible, I don't see a reason why you can't make a single image.

Yeah if care wasn't taken to reserve some GPIO for the task, it can be 
nontrivial.  But assets like NOR can be detected with a VID / PID and 
used for this to fingerprint a board.

-Andy
