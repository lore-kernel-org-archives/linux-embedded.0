From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Thu, 25 Jun 2009 08:44:28 +0200
Message-ID: <2ea1731b0906242344x5c8a6e58t5f82377be3d73411@mail.gmail.com>
References: <4A33A7A2.1050608@gmail.com> <20090613155957.GA16220@shareable.org>
	 <4A34A394.5040509@gmail.com> <20090614114613.GC9514@shareable.org>
	 <4A351FA9.1090808@gmail.com> <20090616150750.GF29040@shareable.org>
	 <4A37EF4A.1080006@gmail.com> <20090624174140.GH14121@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=FeF1nukwa6h2j7QzDn2nRtJ4SRX6nFPHwZYtnhHNcnQ=;
        b=NZ8xiQtXZusX7uueGDYKO0eXmak6cTtl6N8Alw2KbM13NmboryQSbuMakKRHzGSNVq
         SsTSt/u5SkiRHjIPiFpN4p/rDYmr8GDbVzaiZXE9eiZ3BKe6VboorFcIZ0+JaGtWE47L
         kksKF2S6Pq2pgVUb4xFmq6bS+QJtRg/bs/y38=
In-Reply-To: <20090624174140.GH14121@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jamie Lokier <jamie@shareable.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

2009/6/24 Jamie Lokier <jamie@shareable.org>:
> Marco wrote:
>> > Second question: what happens if the system crashing _during_ a wr=
ite
>> > to a file. =A0Does it mean that file will fail it's checksum when =
it's
>> > read at the next boot?
>> >
>> > Maybe files aren't so important. =A0What about when you write a fi=
le,
>> > and then rename it over an existing file to replace it. =A0(E.g. a
>> > config file), and the system crashes _during_ the rename? =A0At th=
e next
>> > boot, is it guaranteed to see either the old or the new file, or c=
an
>> > the directory be corrupt / fail it's checksum?
>>
>> First of all I have to explain better the current policy: the checks=
um
>> works at inode and superblock level and currently there isn't a reco=
very
>> function as the journaling. About the superblock it's easy to use a
>> redundant policy to be more robust.
>
> To be honest, superblock robustness is less of a concern. =A0The real
> concern is losing file or directory contents, so it can't be used to
> store persistent configuration data, only debugging logs.
>
>> About the inode, at the moment when the checksum doesn't match the
>> inode it's marked as bad calling the function make_bad_inode().
>
> Let's see if I understand right.
>
> If it lose power when writing to a file, after boot the file is likel=
y
> to be marked bad and so return -EIO instead of any file contents?

Depends on the checksum. If you lose power before the checksum update
of the inode
you'll have a bad inode and then an -EIO at the next access.

>
> If it loses power when doing atomic rename (to replace config files,
> for example), it's likely that the whole /pramfs/configs/ directory
> will be corrupt, because the rename is writing to the directory inode=
,
> so you lose access to all names in that directory?
>
> That sounds like it can't be used for persistent configuration data.

It's true from this point of view currently there is a lack for this
and it needs a bit of effort to resolve this problem.
=46rom this point of view I'd like to point out that I know that there
was some aspects to study in a deeper way, so I'll need
of more then one review :) but since this fs has been abandoned since
2004 and it hadn't ever reviewed, it was important
to do a serious review with the kernel community to understand all the
problems.

>
> If a directory is marked as bad, or a file-inode in it is marked bad,
> can you even rmdir it to clean up and start again?
>

You can start again always. You can remount the fs with the init
option and then you'll have a new fs.

Marco
