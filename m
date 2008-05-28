From: Charles Manning <manningc2-jEEI2ySEPisjAXWc8ALWsQ@public.gmane.org>
Subject: YAFFS in the kernel tree?
Date: Thu, 29 May 2008 08:59:54 +1200
Message-ID: <200805290859.54396.manningc2@actrix.gen.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi

I'm the author of YAFFS. This is not in the kernel tree, but is fairly easy to 
integrate by just pulling a tarball and running  patch-in script. 

I am curious as to whether people consider the current mechanism "good enough" 
or whether it is worth the effort trying to get YAFFS into the kernel tree.

Pros I can see:
* In tree means better testing (maybe).
* Keeping current with kernel API changes.

Cons:
* More effort for YAFFS maintainers (me mostly).
* Effort getting code into kernel coding style (unless I can get a waiver on 
this).

Thoughts??

-- CHarles
--
To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
