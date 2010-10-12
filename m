From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH 14(16] pramfs: memory protection
Date: Tue, 12 Oct 2010 13:56:39 +0200
Message-ID: <20101012115639.GB20436@basil.fritz.box>
References: <4CB1EBA2.8090409@gmail.com>
 <87aamm3si1.fsf@basil.nowhere.org>
 <4CB34A1A.3030003@gmail.com>
 <20101012074522.GA20436@basil.fritz.box>
 <AANLkTinpoL+AMU62PMvXs78Y6v0efDm3eq++NiVk8XUB@mail.gmail.com>
Mime-Version: 1.0
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <AANLkTinpoL+AMU62PMvXs78Y6v0efDm3eq++NiVk8XUB@mail.gmail.com>
Sender: owner-linux-mm@kvack.org
List-Id: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Andi Kleen <andi@firstfloor.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, linux-mm@kvack.org

> per-arch?! Wow. Mmm...maybe I have to change something at fs level to
> avoid that. An alternative could be to use the follow_pte solution but
> avoid the protection via Kconfig if the fs is used on some archs (ia64
> or MIPS), with large pages and so on. An help of the kernel community
> to know all these particular cases is welcome.

It depends if the protection is a fundamental part of your design
(but if it is I would argue that's broken because it's really not very good
protection): If it's just an optional nice to have you can stub
it out on architectures that don't support it.

-Andi
-- 
ak@linux.intel.com -- Speaking for myself only.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>

