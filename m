From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Where to post an embedded-centric filesystem driver?
Date: Wed, 04 Aug 2010 13:18:45 +0100
Message-ID: <1280924325.19499.29.camel@localhost>
References: <AANLkTi=oBoVKW4QrtjCYfsM7bd+W-9RPgExGe=iQwvQt@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=oBoVKW4QrtjCYfsM7bd+W-9RPgExGe=iQwvQt@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Wed, 2010-08-04 at 07:16 -0500, Bill Gatliff wrote:
> 
> 
> I just finished a filesystem driver that provides Linux the ability to
> do a read-only mount of Micromonitor's TFS filesystem.  Micromonitor
> is a great little bootloader that I use on all my boards.  A
> read-write filesystem driver for Linux is in the works.
> 
> Nobody outside of the embedded world will ever hear of
> Micromonitor/TFS.  So I'm not quite sure where to post my patches.
> Suggestions? 

linux-fsdevel@vger.kernel.org

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation

