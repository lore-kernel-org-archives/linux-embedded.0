From: Marco <marco.stornelli@gmail.com>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Tue, 23 Jun 2009 20:07:23 +0200
Message-ID: <4A4119DB.4030203@gmail.com>
References: <20090621064040.GC1656@ucw.cz> <4A3E6F28.4090404@gmail.com> <20090621205245.GC3254@elf.ucw.cz> <2ea1731b0906212333r20deb71q2f021fc79bcc8a8e@mail.gmail.com> <20090622172003.GB21149@elf.ucw.cz> <4A3FBFF0.40006@am.sony.com> <20090622173704.GC21299@elf.ucw.cz> <4A3FC84A.6060608@gmail.com> <20090622204031.GA24236@elf.ucw.cz> <4A3FFC89.4070006@am.sony.com> <20090622215753.GA25434@elf.ucw.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=4+6hrjPBpsnYCzdJyih9wiOlQDvCUlaqX6pIj8NqEjM=;
        b=S1pTv2zI94Og07sfIa0x7aOOi2h548YMEjJyPCgd5VyyFAoUciiJCuTOElb3gUUzH8
         iZNY2slFGG+HKH3BV9UVyrsODz4ockfYQF/u76xTkxlbjAHrKYNShPxxXpzr9ypy9Hdu
         z/LsVbJNwIIekSrjRSXsjBB3M792rZhruRJws=
In-Reply-To: <20090622215753.GA25434@elf.ucw.cz>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pavel Machek <pavel@ucw.cz>
Cc: Tim Bird <tim.bird@am.sony.com>, Jamie Lokier <jamie@shareable.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

Pavel Machek wrote:
> On Mon 2009-06-22 14:50:01, Tim Bird wrote:
>> Pavel Machek wrote:
>>>> block of fast non-volatile RAM that need to access data on it using a
>>>> standard filesytem interface."
>>> Turns a block of fast RAM into 13MB/sec disk. Hmm. I believe you are
>>> better with ext2.
>> Not if you want the RAM-based filesystem to persist over a kernel
>> invocation.
> 
> Yes, you'll need to code Persistent, RAM-based _block_device_. 
> 									Pavel

First of all I have to say that I'd like to update the site and make it
clearer but at the moment it's not possible because I'm not the admin
and I've already asked to the sourceforge support to have this possibility.

About the comments: sincerely I don't understand the comments. We have
*already* a fs that takes care to remap a piace of ram (ram, sram,
nvram, etc.), takes care of caching problems, takes care of write
protection, takes care to be "persistent", can use xip and it's my
intention to add in the next future other features like acl, xattr and
so on.

You are talked about journaling. This schema works well for a disk, but
what about a piece of ram? What about a crazy kernel that write in that
area for a bug? Do you remember for example the e1000e bug? It's not
casual that this fs use an hw protection schema. I mean, this fs is not
only a "yet another fs", but a fs born with a specific target. So I
think modifying a ramdisk to have these behaviors isn't a little
modification.

Marco
