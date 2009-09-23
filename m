From: Johnny Hung <johnny.hacking@gmail.com>
Subject: GPIO driver for MPC8313.
Date: Wed, 23 Sep 2009 11:55:36 +0800
Message-ID: <cb9ecdfa0909222055x1d691698sb516b5b8f5f81d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=LQVlgoMPP2FKTHYFoyW+boOeSznhoKTThPYXTunLu28=;
        b=Dt7vLWwHvdC3bkRlAGfS6SKoBGOk15ukYIxCM4WTc4Rp2cKPoXZtSaliwOeBMP4Hv5
         E2qLvhZ9m2XrhpjrAl8osi8BYjSB9bjJRmQ4DuHjT8ez9sEICDLV29+wZjxzlvCJmnVx
         wKjjsRKeBaz5Qd19l21WQu/LTFtNjd40AAYvg=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linuxppc-dev@lists.ozlabs.org, linux-embedded@vger.kernel.org

Hi All:
=A0 =A0Is there a alreday written GPIO dirver or example for
MPC8313/similar ppc platform. It looks like many people need GPIO
dirver to control LED, etc... I think is it possible to write a
general gpio driver for all ppc platform and only need to modify gpio
iomap information of dtb file. Please give me a advice. Thanks in
advanced.

BRs, H. Johnny
