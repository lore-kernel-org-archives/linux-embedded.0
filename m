From: Martin Steigerwald <martin@lichtvoll.de>
Subject: Re: Nobarrier mount option (was: Re: File system robustness)
Date: Fri, 21 Jul 2023 16:51:31 +0200
Message-ID: <4918028.0VBMTVartN@lichtvoll.de>
References: <20230717075035.GA9549@tomerius.de> <38426448.10thIPus4b@lichtvoll.de>
 <20230721133526.GF5764@mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-ext4-owner@vger.kernel.org>
In-Reply-To: <20230721133526.GF5764@mit.edu>
List-ID: <linux-embedded.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: "Alan C. Assis" <acassis@gmail.com>, =?ISO-8859-1?Q?Bj=F8rn?= Forsman <bjorn.forsman@gmail.com>, Kai Tomerius <kai@tomerius.de>, linux-embedded@vger.kernel.org, Ext4 Developers List <linux-ext4@vger.kernel.org>, dm-devel@redhat.com

Theodore Ts'o - 21.07.23, 15:35:26 CEST:
> > At least that is what I thought was the background for not doing the
> > "nobarrier" thing anymore: Let the storage below decide whether it
> > is safe to basically ignore cache flushes by answering them (almost)
> > immediately.
> 
> The problem is that the storage below (e.g., the HDD) has no idea that
> all of this redundancy exists.  Only the system adminsitrator who is
> configuring the file sysetm will know.  And if you are runninig a
> hyper-scale cloud system, this kind of custom made system will be
> much, MUCH, cheaper than buying a huge number of $$$ EMC storage
> arrays.

Okay, that is reasonable.

Thanks for explaining.

-- 
Martin


