From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: How to store kernel pranic/oops
Date: Mon, 28 Dec 2009 12:12:34 +0000
Message-ID: <1262002354.3181.411.camel@macbook.infradead.org>
References: <4B3899DB.1020308@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4B3899DB.1020308@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: CeLinux <celinux-dev@tree.celinuxforum.org>, Linux Embedded <linux-embedded@vger.kernel.org>

On Mon, 2009-12-28 at 12:43 +0100, Marco Stornelli wrote:
> It would be nice to have a "ramoops" to save in a circular buffer in a
> persistent ram this kind of information. Any comments? Is there already
> anything similar out-of-tree? 

Can't it be done with what's in the tree already? Just create an MTD
device using phram or something else, then point mtdoops at it.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
