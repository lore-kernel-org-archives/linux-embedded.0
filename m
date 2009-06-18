From: Daniel Ng <daniel.ng1234@gmail.com>
Subject: CDC ACM composite gadget serial not working between Linux and 
	Windows?
Date: Thu, 18 Jun 2009 12:09:24 +1000
Message-ID: <547eba1b0906171909y44fc89c8q2bc94edd1eff7411@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=uF58cqrCEtolUMe0SBaATBc7JFO1UfzpVj1d9jSIPZA=;
        b=M5zkgz8YlY0lsQdSXeGG8a16/WNrZdlEtM/xkznKYeYNimTI1654oPpx+GHX0RHjzF
         mcDctkGE8ajtJAC7eTu2r8fMEEcK29km/qr5mt3G+i3GSqMF+xixCw/kMl3tbtFulEpX
         ZhE6Lxhni4LMKsPtccqNffZ5cRzb5N2+EITVI=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Hi,

I've found this comment in f_acm.c, 2.6.27:

 * Note that even MS-Windows has some support for ACM.  However, that
 * support is somewhat broken because when you use ACM in a composite
 * device, having multiple interfaces confuses the poor OS.  It doesn't
 * seem to understand CDC Union descriptors.  The new "association"
 * descriptors (roughly equivalent to CDC Unions) may sometimes help.

Does this mean I will not be able to successfully connect a Linux box
to a Windows PC via the Linux box's CDC ACM composite gadget serial
driver?

Also, there are direct references to the composite driver in f_acm.c,
which tells me the following:

-In Linux (2.6.27), a CDC ACM gadget serial driver MUST be a composite
driver as well.

Is this true? If so why is such tight coupling required?

Please suggest an alternate list if this message is inappropriate for this list.

Cheers,
Daniel
