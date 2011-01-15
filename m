From: Dirk Behme <dirk.behme@googlemail.com>
Subject: Boot time: Kernel start parallelization issue?
Date: Sat, 15 Jan 2011 09:40:38 +0100
Message-ID: <4D315D86.40401@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:content-type:content-transfer-encoding;
        bh=icHROXbvByJlDcQq/iM4IgillHjoX+/7nyI+ngmQhKc=;
        b=E+VJgDRpmlkOWD8s67mis9K4k0icvYCZ9Fg5R1dKzzpniTKO+tCBZwpTl2SH2ZJIwj
         vM+LFgz/ATvPj7Km6uTvcqOSTpgTeSwZUF/oQCXdUNTldQbvbcXK708Jg1Oa82Xfagtw
         0qiMiiV6bndMO8unp/N0DcXGpC1aGZtZtRIY8=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-embedded@vger.kernel.org
Cc: Arjan van de Ven <arjan@linux.intel.com>, Greg KH <gregkh@suse.de>, Martin Mueller <martin@pfump.org>


There are some reports [1] [2] looking at the boot time of embedded 
(ARM?) systems using initcall debug [3]. Both reports seem to show 
that they have issues with the start up sequence of the kernel being 
completely single-threaded. In [2] Greg mentions that on a x86 box 
multi-threads are happening and that there he doesn't see this issue. 
On the other hand, both reports mention Arjan's async initcall patches 
[4] to help against the issue. I.e. introducing some parallelization 
(on ARM) does help, too.

With this, I wonder

- if anybody faces similar issues with single-threaded only kernel 
start on embedded (ARM?) systems? Or if this is known? Or if there are 
fixes for this?

- if we somehow should try to 're-activate' Arjan's async initcall 
patches?

Any ideas?

Many thanks and best regards

Dirk

P.S.: I couldn't find a mail address of Alex Gonzalez, the author of 
[1], to put him into CC. If anybody knows him, please feel free to add 
him to this thread. Thanks!

[1] 
http://www.lindusembedded.com/blog/2010/06/02/measuring-the-boot-time-of-an-embedded-linux-device/

[2] http://thread.gmane.org/gmane.linux.usb.general/41181 (mainly the 
last mail of this thread: 
http://article.gmane.org/gmane.linux.usb.general/41619)

[3] http://www.elinux.org/Initcall_Debug

[4] http://lwn.net/Articles/299591/
