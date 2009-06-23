From: Marco <marco.stornelli@gmail.com>
Subject: Re: [PATCH 06/14] Pramfs: Include files
Date: Tue, 23 Jun 2009 19:38:33 +0200
Message-ID: <4A411319.4020108@gmail.com>
References: <4A33A7EC.6070008@gmail.com> <200906221317.04166.arnd@arndb.de> <4A3FC7F1.5050108@gmail.com> <200906222033.20883.arnd@arndb.de> <4A3FDBFE.8050509@2net.co.uk> <20090622203034.GA12587@uranus.ravnborg.org> <4A3FFF17.9020701@am.sony.com> <20090623042106.GA17159@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=zym7fOKuH5YGeGIf+TnLcQKA6cFWRF/vx20W0bcFFPA=;
        b=T8DMM+O+UyHKNRo8MRdn8teJOQsW3dx2kRykdYUdxHqZeJWy13I3lkm2Xrml6+7UxV
         Yl4I2ipoW+3h8moZebcoEB2T1zJFP070Bf0/1i2zBLMm2CgqSA6RH7or5IBThAfjCNjS
         KMVRgMpdOgt5Gw2UEkRD6JQSojfYum1UbbVQc=
In-Reply-To: <20090623042106.GA17159@uranus.ravnborg.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Tim Bird <tim.bird@am.sony.com>, Chris Simmonds <chris@2net.co.uk>, Arnd Bergmann <arnd@arndb.de>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Sam Ravnborg wrote:
>>> It should be possible to read a file-system on your x86 64bit
>>> box that you wrote with your small powerpc target.
>> For a (NV)RAM-based filesystem??  WTH???
> 
> dd the full image - dig into it.
> Usefull is you have post-mortem info there.
> 
> 	Sam
> 

dd? You haven't got any device file to have a dump. I think we're going
a bit out of scope. I had some doubt to support rootfs in pram and after
some feedback and the comments of this review I think I'll remove it
from the next release (to understand some aspects of this fs with the
kernel community was my main goal for this review). I agree to use the
native endian. As I said the important thing is that if an user want to
use it in a 64bit environment then the fs must work well and then it
must be designed to support even this situation, I think it's obvious.

Marco

