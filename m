From: Marco <marco.stornelli@gmail.com>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Fri, 26 Jun 2009 18:56:59 +0200
Message-ID: <4A44FDDB.1000902@gmail.com>
References: <4A33A7A2.1050608@gmail.com> <20090613155957.GA16220@shareable.org> <4A34A394.5040509@gmail.com> <20090614114613.GC9514@shareable.org> <4A351FA9.1090808@gmail.com> <20090616150750.GF29040@shareable.org> <4A37EF4A.1080006@gmail.com> <20090624174140.GH14121@shareable.org> <2ea1731b0906242344x5c8a6e58t5f82377be3d73411@mail.gmail.com> <20090626113016.GB17737@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=xnUUuKPA/yRIUnTpR1dfEwNqoR4jRP8ipFyKGzj+Rdo=;
        b=JfUT2nDSKjQLhEO8nKjx6zL2dFxLMWzGClcwfEG+MYBOd83MVVoPFYKPRCZHeGBrWc
         KmJPhOpEbARTeh2vdwqoUNHjiaHb2rwULxdIb3aHiMfCaRnZCoggE2EgagFfjL6xygr9
         HQBLCNWiyx4Zaz5A8LX0s3OO9Rlm3WXAB4W90=
In-Reply-To: <20090626113016.GB17737@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

Jamie Lokier wrote:
> Marco Stornelli wrote:
>> 2009/6/24 Jamie Lokier <jamie@shareable.org>:
>>> Marco wrote:
>>> If it loses power when doing atomic rename (to replace config files,
>>> for example), it's likely that the whole /pramfs/configs/ directory
>>> will be corrupt, because the rename is writing to the directory inode,
>>> so you lose access to all names in that directory?
>>>
>>> That sounds like it can't be used for persistent configuration data.
>> It's true from this point of view currently there is a lack for this
>> and it needs a bit of effort to resolve this problem.  >From this
>> point of view I'd like to point out that I know that there was some
>> aspects to study in a deeper way, so I'll need of more then one
>> review :) but since this fs has been abandoned since 2004 and it
>> hadn't ever reviewed, it was important to do a serious review with
>> the kernel community to understand all the problems.
> 
> That's reasonable.
> 
> What do you think of my suggestion to double-buffer writes using a
> single fixed position block, as explained elsewhere in this thread?
> 
> It should give the power fail safety with very little code.  I don't
> know how much it would slwo down writing.  That probably depends on
> whether it's the checksum which is slow (which only needs to be done
> once when double-buffering), or the writing.
> 
> -- Jamie
> 

Yeah it can be a choice. For this fs it's important to use "simple" but
useful mechanism. What do you exactly mean with "fixed position block"?
A fixed position in the fs? For example superblock+inodetable+in-use
bitmap+blocks+"double-buffering block"? Using a temp block of the same
size of blocks used, isn't it? I agree, but I think it needs more then
100 lines of code. Even with this simple schema it needs a mechanism
with a timeout to do the "commit" of the temp block, it needs a
mechanism to read the temp block instead of the "old" block or a
mechanism to write-back the temp block. So it can be implemented but it
needs a bit of effort. I think I'll implement it in the next release.

Marco
