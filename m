From: "Theodore Ts'o" <tytso@mit.edu>
Subject: Re: File system robustness
Date: Thu, 20 Jul 2023 00:20:34 -0400
Message-ID: <20230720042034.GA5764@mit.edu>
References: <20230717075035.GA9549@tomerius.de>
 <CAG4Y6eTN1XbZ_jAdX+t2mkEN=KoNOqprrCqtX0BVfaH6AxkdtQ@mail.gmail.com>
 <20230718213212.GE3842864@mit.edu>
 <4835096.GXAFRqVoOG@lichtvoll.de>
Mime-Version: 1.0
Return-path: <linux-ext4-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
        t=1689826838; bh=3XJCOb5v+cTa0HgiQv1Jsq9Fu13cCQuFEnmD+Q/7lWA=;
        h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
        b=A9g+ho5jvo/zXkVA9BMs4PbJ7g86tVqZr6dtcpHRS2DUeJkGEsn3q+3F7HmujqSAY
         DVK/oHf/oUarVIgbPh5Vsxvs62UJJu9kCACetLMOLnAdKcxtQ1wY4YlIZ+rA76lIkd
         nN6MmX3BTuG7xWw6EFo8wBHmACJQEi0rlrFFZ21HpPV66dlp9gL3GrzQC+TDN368M5
         1YEXv2OyTQuVt6a/tSI0rnARycn3eNd+YUs0CO3CevSN3qm7vFhNLMUu41IG7PmeXY
         xSxuVTdM5NtIOoxcm5y+88XtGCi85pT9ePpdYHkp3upzuT5X+NDa7RRqbdYmRS71pt
         Ycf675hnWvDzg==
Content-Disposition: inline
In-Reply-To: <4835096.GXAFRqVoOG@lichtvoll.de>
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Steigerwald <martin@lichtvoll.de>
Cc: "Alan C. Assis" <acassis@gmail.com>, =?iso-8859-1?Q?Bj=F8rn?= Forsman <bjorn.forsman@gmail.com>, Kai Tomerius <kai@tomerius.de>, linux-embedded@vger.kernel.org, Ext4 Developers List <linux-ext4@vger.kernel.org>, dm-devel@redhat.com

On Wed, Jul 19, 2023 at 08:22:43AM +0200, Martin Steigerwald wrote:
> 
> Is "nobarrier" mount option still a thing? I thought those mount options 
> have been deprecated or even removed with the introduction of cache flush 
> handling in kernel 2.6.37?

Yes, it's a thing, and if your server has a UPS with a reliable power
failure / low battery feedback, it's *possible* to engineer a reliable
system.  Or, for example, if you have a phone with an integrated
battery, so when you drop it the battery compartment won't open and
the battery won't go flying out, *and* the baseboard management
controller (BMC) will halt the CPU before the battery complete dies,
and gives a chance for the flash storage device to commit everything
before shutdown, *and* the BMC arranges to make sure the same thing
happens when the user pushes and holds the power button for 30
seconds, then it could be safe.

We also use nobarrier for a scratch file systems which by definition
go away when the borg/kubernetes job dies, and which will *never*
survive a reboot, let alone a power failure.  In such a situation,
there's no point sending the cache flush, because the partition will
be mkfs'ed on reboot.  Or, in if the iSCSI or Cloud Persistent Disk
will *always* go away when the VM dies, because any persistent state
is saved to some cluster or distributed file store (e.g., to the MySQL
server, or Big Table, or Spanner, etc.  In these cases, you don't
*want* the Cache Flush operation, since skipping it reduce I/O
overhead.

So if you know what you are doing, in certain specialized use cases,
nobarrier can make sense, and it is used today at my $WORK's data
center for production jobs *all* the time.  So we won't be making
ext4's nobarrier mount option go away; it has users.  :-)

Cheers,

					- Ted
