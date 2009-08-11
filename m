From: Necati Demir <ndemir@demir.web.tr>
Subject: conntrack disables network
Date: Tue, 11 Aug 2009 15:23:27 +0300
Message-ID: <cf1f4db60908110523s6614591dj69e37140a8c85c59@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:from:date
         :x-google-sender-auth:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=uBEdJfit6Xm65iOqswThDCmDIApLYo3Gvrmxh9RfEmc=;
        b=ZwmuCfVfTstdKpeRLVu5v1T+Myx4TUGEWA+iZBdfyELam/acNeRLqHZTRvvOBuEqyZ
         ZG4Y1+uYu0gxVcdpw3ZnKSdvSuMYS573jmZr+6rxTtLJX3+7wzFqIWcwdRQUxBvIYycV
         YjMiHsAyslZUGQ/jvrwncmb84yX3tVLv0eeMY=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Hi,

I am using 2300SX (http://www.compactpc.com.tw/ebox-2300SX.htm).

When i enable conntrack in kernel configuration for NAT operations,
ethernet card does not work. This is really strange. I mean, i can see
eth0 in ifconfig output, but when i run "udhcpc -i eth0" it does not
get IP. I tried giving IP manually and i did. But it still does not
ping network.

When i disable conntrack, everything is fine again.

Any suggestion?

--
Necati Demir
http://demir.web.tr
http://blog.demir.web.tr
ndemir [~] demir.web.tr
necati83 [~] gmail.com
--------------------------------------
