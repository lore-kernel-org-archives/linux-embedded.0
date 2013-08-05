From: Guenter Ebermann <guenter.ebermann@googlemail.com>
Subject: Re: AMP on an SMP system
Date: Mon, 5 Aug 2013 11:06:46 +0200
Message-ID: <CAJJW4y5tjinOxxCeovQFDf+E7w4Nadkv38iWxCKXzTbOTuJvVg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=x5CSbv45MIeW7u+NmNDO+Y0S5uUNyyoSRo6laIdzT94=;
        b=hUfE1kQRv/KQydTenptgoR0d0yoizGfap67VaXBRsKI1CckrhcO8jm7asQdA+zD/dC
         t4X97NBMHR+ufARFFl5kC4bE2ZW+jsELAnmd+BEIscEk3sGpIu1efzLUJfVDxLVzZqR3
         ljAgy4nR9otlJWbTajWKDItD7Pd9KxkJs4rWaNcTOnXyZCkfh/D++X4yxBT1RlKW/dNP
         /A1OAclSWMfKa3T4HybthLzZmzXgQIBQqyoHfAtj762UwtcxG3woPYKvQWICfDNAHh3q
         yh5fDwWikQrtG7zornEOvzQRMYeNdMpVt1scjhbNfA7Lrf1kA11eolkG3uXQ4TZtClS0
         AmXA==
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michael Schnell <mschnell@lumino.de>
Cc: linux-embedded@vger.kernel.org

Hi,

I am using vanilla linux in an AMP setup on freescale P1022
successfully. The needed
linux bootargs are:
maxcpus=3D1 mem=3D448M memmap=3D64M$0x1C000000

Then there is a linux userspace program and a kernel module (using kern=
el
function mpic_reset_core) to start an application (another OS) on the
second core.

=46or communication with the seconds core I use a non-blocking FIFO
in a shared RAM section.

Best regards,
G=FCnter
