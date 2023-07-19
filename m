From: Martin Steigerwald <martin@lichtvoll.de>
Subject: Re: File system robustness
Date: Wed, 19 Jul 2023 08:22:43 +0200
Message-ID: <4835096.GXAFRqVoOG@lichtvoll.de>
References: <20230717075035.GA9549@tomerius.de>
 <CAG4Y6eTN1XbZ_jAdX+t2mkEN=KoNOqprrCqtX0BVfaH6AxkdtQ@mail.gmail.com>
 <20230718213212.GE3842864@mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-ext4-owner@vger.kernel.org>
In-Reply-To: <20230718213212.GE3842864@mit.edu>
List-ID: <linux-embedded.vger.kernel.org>
To: "Alan C. Assis" <acassis@gmail.com>, Theodore Ts'o <tytso@mit.edu>
Cc: =?ISO-8859-1?Q?Bj=F8rn?= Forsman <bjorn.forsman@gmail.com>, Kai Tomerius <kai@tomerius.de>, linux-embedded@vger.kernel.org, Ext4 Developers List <linux-ext4@vger.kernel.org>, dm-devel@redhat.com

Theodore Ts'o - 18.07.23, 23:32:12 CEST:
> If you get it all right, you'll be fine.  On the other hand, if you
> have crappy hardware (such as might be found for cheap in the checkout
> counter of the local Micro Center, or in a back alley vendor in
> Shenzhen, China), or if you do something like misconfigure the file
> system such as using the "nobarrier" mount option "to speed things
> up", or if you have applications that update files in an unsafe
> manner, then you will have problems.

Is "nobarrier" mount option still a thing? I thought those mount options 
have been deprecated or even removed with the introduction of cache flush 
handling in kernel 2.6.37?

Hmm, the mount option has been removed from XFS in in kernel 4.19 
according to manpage, however no mention of any deprecation or removal 
in ext4 manpage. It also does not seem to be removed in BTRFS at least 
according to manpage btrfs(5).

-- 
Martin


