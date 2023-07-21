From: "Theodore Ts'o" <tytso@mit.edu>
Subject: Re: Nobarrier mount option (was: Re: File system robustness)
Date: Fri, 21 Jul 2023 09:35:26 -0400
Message-ID: <20230721133526.GF5764@mit.edu>
References: <20230717075035.GA9549@tomerius.de>
 <4835096.GXAFRqVoOG@lichtvoll.de>
 <20230720042034.GA5764@mit.edu>
 <38426448.10thIPus4b@lichtvoll.de>
Mime-Version: 1.0
Return-path: <linux-ext4-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
        t=1689946529; bh=3EEcRPkd0RCJgKJqBYpNX5ax1tKBce8rGF0BzEn1KwQ=;
        h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
        b=dSTyo3TGo/N35nO/x9E6UB7x3seRAOer+S+iTYCruoY06Gwmb8xfuZAzljAKh8iWN
         lCDA6TM0fULhCMh+ORrUqmY5ZXZMK4hevVIFW3G/YE8en35h7kJIzNJwPGzjwQWMh9
         ge6oUJvH9EWISfyVu95AFJns1BTTtLNjI7w135gZF/gd+P6bCyjyXhOgG+tU0Z+Ml8
         7j2ZGT9SRLLHuNChYceW4S1LtU1hm2KcSQy4u/AJXyx1gtbInmUJgf05nGwgbBSMOr
         BBVabsdgg3NY6L2QrsNiBTbkoNZjKVAyxxH7HTcAigCyWD7liEvB6Z3ik+JrOTV4TF
         8CiRm6K3iw+zQ==
Content-Disposition: inline
In-Reply-To: <38426448.10thIPus4b@lichtvoll.de>
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Steigerwald <martin@lichtvoll.de>
Cc: "Alan C. Assis" <acassis@gmail.com>, =?iso-8859-1?Q?Bj=F8rn?= Forsman <bjorn.forsman@gmail.com>, Kai Tomerius <kai@tomerius.de>, linux-embedded@vger.kernel.org, Ext4 Developers List <linux-ext4@vger.kernel.org>, dm-devel@redhat.com

On Thu, Jul 20, 2023 at 09:55:22AM +0200, Martin Steigerwald wrote:
> 
> I thought that nowadays a cache flush would be (almost) a no-op in the 
> case the storage receiving it is backed by such reliability measures. 
> I.e. that the hardware just says "I am ready" when having the I/O 
> request in stable storage whatever that would be, even in case that 
> would be battery backed NVRAM and/or temporary flash.

That *can* be true if the storage subsystem has the reliability
measures.  For example, if have a $$$ EMC storage array, then sure, it
has an internal UPS backup and it will know that it can ignore that
CACHE FLUSH request.

However, if you have *building* a storage system, the storage device
might be a HDD who has no idea that that it doesn't need to worry
about power drops.  Consider if you will, a rack of servers, each with
a dozen or more HDD's.  There is a rack-level battery backup, and the
rack is located in a data center with diesel generators with enough
fuel supply to keep the entire data center, plus cooling, going for
days.  The rack of servers is part of a cluster file system.  So when
a file write to a cluster file system is performed, the cluster file
system will pick three servers, each in a different rack, and each
rack is in a different power distribution domain.  That way, even the
entry-level switch on the rack dies, or the Power Distribution Unit
(PDU) servicing a group of racks blows up, the data will be available
on the other two servers.

> At least that is what I thought was the background for not doing the 
> "nobarrier" thing anymore: Let the storage below decide whether it is 
> safe to basically ignore cache flushes by answering them (almost) 
> immediately.

The problem is that the storage below (e.g., the HDD) has no idea that
all of this redundancy exists.  Only the system adminsitrator who is
configuring the file sysetm will know.  And if you are runninig a
hyper-scale cloud system, this kind of custom made system will be
much, MUCH, cheaper than buying a huge number of $$$ EMC storage
arrays.

Cheers,

					- Ted
