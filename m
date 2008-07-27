From: Sebastien Fauris <titelive72@gmail.com>
Subject: testing ethernet device with external loopback
Date: Sun, 27 Jul 2008 10:47:04 +0200
Message-ID: <488C3608.3000104@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=KM80DjFI2c7mHcB68hcps2ZXU/Eg/Fbr+COw7rAf23k=;
        b=vahXeLyYqMmBnmL2xY6enWKeAv5s4jinnueF3oi71Kw4n8hMh5mjWQxUBOWHAO7yFp
         AkzC6Xle3VgrYNqbvOgtnsPm6+Z0ob1VyHLUVOcVxP9388DgRR+LOOIACqzWEi3J8wGV
         NkNFmvY3AxAWr03r62YJL1Pa8CZqMvxZ1KS0Y=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-embedded@vger.kernel.org

Hi,

for hardware testing purposes, I would like to perform an external 
loopback on my ethernet interface. For this, I wrote 2 little 
executables, one  sending a raw ethernet packet (using 'sendto') on a 
socket opened with the  parameters PF_PACKET, SOCK_RAW, 
htons(ETH_P_ALL), the other one doing a recvfrom from a raw socket.
The problem is that on the reception side, I always receive what I send, 
even when
 the external RJ45 stub is not plugged !
Is there a way to tell to the kernel on the reception side that I want 
to get only packets coming from the external world ?

Thanks,

Sebastien.
