From: Rajkumar M <rajkumarm2@gmail.com>
Subject: Re: Freescale MPC8313 TSEC SGMII problem.
Date: Mon, 8 Feb 2010 04:58:36 +0000 (UTC)
Message-ID: <loom.20100208T055813-443@post.gmane.org>
References: <cb9ecdfa1001282229n21a11aa9sf15ebf279990862a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Johnny Hung <johnny.hacking <at> gmail.com> writes:

> 
> Hi All,
> 
> I have a Freescale MPC8313 customized board and want to confiugre
> TSEC1 to SGMII. Would you please help me for this question,
> 
> 1). Is it possible for MPC8313 TSEC1 connect to Ethernet Switch by
> SGMII (without phy), like below diagram.
> 
> [MPC8313 TSEC1]  <====SGMII====> [Ethernet Switch]
> 

This is not possible. The MAC signals have to travel through SERDES, PCS layer
and the rate adaptation blocks of the PHY. For instance, in the transmit
direction, the differential pair transmit and transmit-clock signals are
de-serialised and passed through PCS to recover the SGMII signals. This then
passes through the rate adaptation block to output the data at the Ethernet port
speed.


> 2). If yes in 1), how to configure it in MPC8313, as I know it can set
> TSEC1 to SGMII in LTIB uboot setting. How about in Linux Kernel driver
> ? Is it need extra setting or patch?
> 
> BRs, H. Johnny
> 



