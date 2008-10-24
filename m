From: "Fredrik Johansson" <frejo242@gmail.com>
Subject: USB, Host and Device on the same machine
Date: Fri, 24 Oct 2008 09:18:48 +0200
Message-ID: <53e45cc30810240018w1c3c73c2nf9a9b606e0e7dea4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=+RzbM4kyc09sdtx6tuJQQYMlx07ZYInUm+ibT5+D7v8=;
        b=tcth4dtIZH3xvXs7anGmu5HK5+NTuyxpNYyEGFA9dGPUoYS+PVsrpCMT0Hb1Wi+0US
         VtjzL/FCkfQ0kRXPOQ4bd3gGM5AYrgiTdiBWeiWVUUkjWWYfVkI5vzLTiOGNSJnFuFrt
         R19R3vyc3SEAcYBykwsU9UNw6/NgAIwVroyoY=
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Hello

I am working on an embedded machine that has two USB controllers, one
is a OTG and the other is a pure host.

I have succesfully used g_serial driver on the OTG controller in
device mode and talked to my pc using the cdc-acm driver.
With the g_serial unloaded I have also enabled the ehci-hcd and
cdc-acm drivers and connected the host port to another serial device.

The problem I have now is that I want to be able to have my embedded
machine work as a device on the OTG port and a host on the host port,
but if I load the ehci-hcd driver with g_serial already loaded it
screws everything up since ehci-hcd driver attaches to both the OTG
and the host controller, how can i prevent it from using the OTG
controller?

Best regards
Fredrik Johansson
