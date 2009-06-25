From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Thu, 25 Jun 2009 08:32:08 +0200
Message-ID: <2ea1731b0906242332n305a8ebbgf37b259171741ea8@mail.gmail.com>
References: <2ea1731b0906212333r20deb71q2f021fc79bcc8a8e@mail.gmail.com>
	 <4A3FBFF0.40006@am.sony.com> <20090622173704.GC21299@elf.ucw.cz>
	 <4A3FC84A.6060608@gmail.com> <20090622204031.GA24236@elf.ucw.cz>
	 <4A3FFC89.4070006@am.sony.com> <20090622215753.GA25434@elf.ucw.cz>
	 <4A4119DB.4030203@gmail.com> <20090623182941.GA2045@elf.ucw.cz>
	 <20090624174700.GI14121@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=/sLqertL0l1GB1FVoVLJJkHudtIcr5ypLudDtbtPAmI=;
        b=AJvLpju6T7F1dyRjEWBxm7ftmZmiFMWQSf7qNuvddZ4zC/AgrhKitMYJ5aEHhpWkLC
         kA2DUGb3c1v2daINuwucJzxiKn7bSK4/tJ3BZa+pS60CjZIa88HzXRvVXzJB50b+wF5P
         Fu8eae2dC2kC1rkgbBBQhXY+Vf2TlLcyMykOQ=
In-Reply-To: <20090624174700.GI14121@shareable.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jamie Lokier <jamie@shareable.org>
Cc: Pavel Machek <pavel@ucw.cz>, Tim Bird <tim.bird@am.sony.com>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

2009/6/24 Jamie Lokier <jamie@shareable.org>:
> Pavel Machek wrote:
>> On Tue 2009-06-23 20:07:23, Marco wrote:
>> > You are talked about journaling. This schema works well for a disk=
, but
>> > what about a piece of ram? What about a crazy kernel that write in=
 that
>> > area for a bug? Do you remember for example the e1000e bug? It's n=
ot
>>
>> I believe you need both journaling *and* write protection. How do yo=
u
>> handle power fault while writing data?
>
> I think this is basically right.
>
> write protection for the crazy kernels, and journalling for
> powerfail/crash during updates.
>
> Journalling can be extremely simple. =A0It can be just one memory blo=
ck
> at a fixed location, double-buffering all writes.
>
> Pramfs already has checksums, which makes that easier. =A0You just wr=
ite
> to the buffer area first, with checksum, then write to the final area=
=2E
> Mount looks at the buffer area, and if the checksum is fine, copies
> the contents to the destination block.
>
> That's all it takes to be resistant against power failures and crashe=
s
> during writes. =A0Probably <100 lines of code.
>
> -- Jamie
>

It seems a reasonable request.

Marco
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
