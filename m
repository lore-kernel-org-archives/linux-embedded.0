From: Andy Green <andy@warmcat.com>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi, lightweight
 bootloader
Date: Sun, 27 Dec 2009 10:09:23 +0000
Message-ID: <4B373253.9050006@warmcat.com>
References: <20091221193038.38CB63F6EF@gemini.denx.de> <20091223085607.GE22533@pengutronix.de> <4B31E2F2.4010206@warmcat.com> <200912270127.35414.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:sender:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=aFvBeTNjdPe33HxA0Ts1WLJVRa5OnNIwcaButdPG3FU=;
        b=hVayAxPbOnkuiwcdqaCWtTbBHLe3maqj75wIH/2slgHp5FJUQ/ytN5XtT3taTvagVl
         5DiZuZQD5Sa0S7lMtvL0Wqaf07oPnDIIm/Cm58gGF6t7eEQ5p+WaGvU3IQc4V3aBfd3g
         EHAKmRIxr1hR5dKHGxyqMCgmbwX1x78QVkG40=
In-Reply-To: <200912270127.35414.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rob Landley <rob@landley.net>
Cc: celinux-dev@tree.celinuxforum.org, Robert Schwebel <r.schwebel@pengutronix.de>, linux-embedded@vger.kernel.org

On 12/27/09 07:27, Somebody in the thread at some point said:

Hi Rob -

>> Again this is buildroot thinking.  The distro provides both the native
>> and cross toolchains for you.  You're going to want to use the same
>> distro as you normally use on your box so the cross toolchain installs
>> as a package there.
>
> Because boards that use things like uClibc and busybox just aren't interesting
> to you?

I used them both before, but I can say with confidence if the platform 
will take glibc and bash, most people will expect more complete, in that 
sense, more reliable, performance from those.

It breaks down at stock distro init because it's painfully slow.  But 
otherwise there are real advantages in having the full-strength versions 
of everything.

> Please don't confuse "development environment" with "build environment".  A

Since I didn't use either term, I don't know why you think I'm confusing 
them.

> development environment has xterms and IDEs and visual diff tools and a web
> browser and PDF viewer and so on.  A build environment just compiles stuff to
> produce executables.  (Even on x86, your fire breathing SMP build server in the
> back room isn't necessarily something you're going to VNC into and boot a
> desktop on.)

As I said in the other reply, my workflow is to edit a package's source 
tree on a host (so you can use any editor on your host not just kate / 
fish:// ) and by host script with scp and ssh get the current tree 
package-built and installed on the device in one step.

So I hope it's clear there is solid separation between what you're 
calling "development environment" and "build environment" to the point 
they have nothing to do with each other except ssh-based script to get 
stuff built.

> I agree it's nice to have a build environment compatible with your deployment
> environment, and distros certainly have their advantages, but you may not want
> to actually _deploy_ 48 megabytes of /var/lib/apt from Ubuntu in an embedded
> device.

I did say in the thread you want ARM11+ basis and you need 100-200MBytes 
rootfs space to get the advantages of the distro basis.  If you have 
something weaker (even ARM9 since stock Fedora is ARMv5+ instruction set 
by default) then you have to do things the old way and recook everything 
yourself one way or another.

Even now there are plenty of suitable platforms that will work with it, 
and over time they will only increase.  Nothing seems to totally die out 
(8051-based micros are still in the market) but each time something new 
comes in at the top it grabs some of the market and the older ones shrink.

It boils down to the point that if you just treat the ARM11+ platforms 
like the previous generation and stick fat bootloaders and buildroot 
blobs on them, you are going to miss out on an epochal simplification 
where embedded Linux largely becomes like desktop Linux in workflow, 
quality and reliability of update mechanisms, and effort needed to bring 
up a box / device.

-Andy
