From: Raffaele Recalcati <lamiaposta71@gmail.com>
Subject: CELF Project Proposal - Feasibility analisys of Android introduction 
	in a completely tested industrial device
Date: Fri, 18 Dec 2009 17:14:25 +0100
Message-ID: <ade1bdc0912180814m7fd3c02cp7d99a1943c2da37e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=GdOVIy78CfPP6mxJZCpqCnvtYQPDL1gBfD0sn8OfM/s=;
        b=UwDkfC9i74vIat+wnIb0I+RQRN9o5ftjKN5qy9Rr2wcRx3BsWQeBfOTEPrd9I7q5Yg
         eKaO3H8UGaPHJuTobPt7ZQX323ajKUeAHR/IIUBDq53zoNpMsrSO0deXl+X2V2t1POCM
         t5fwMOI5Ov5PUms/v2InvJ3gWSNHAOLx/ZZxs=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: CE Linux Developers List <celinux-dev@tree.celinuxforum.org>, linux-embedded <linux-embedded@vger.kernel.org>, elc10@tree.celinuxforum.org

Summary: Feasibility analisys of Android introduction in a completely
tested industrial device.

Description: By now Android has been ported to 600Mhz Cortex A8 cpu or similar.
The declared Android requirements are instead lower, about 200Mhz Arm9
cpu with 100Mhz Ram bus.
So I think the growing interest in this O.S. lacks some porting to
less powerful cpus.
The reasons to do this porting are commercial because of Google market
power, but are also technnical, because Android debugging environment
is very nice for not embedded developers.
This could help the diffusion of opensource embedded Linux.

The porting will be maybe against the 2.6.31 kernel for pxa270.
The idea is to preserve industrial tested development but adding
Android graphical interface.

The cpu dependency of the porting will be as small as possible.

Related work:
 * Android Porting - http://www.kandroid.org/<wbr></wbr>android_pdk/
 * Android Pxa270 - http://android-pxa270.sourceforge.net/

Scope:
This should take more than 1 month for feasibility analysis.


-- 
www.opensurf.it
