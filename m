From: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: Adding a new platform
Date: Fri, 22 Aug 2008 09:25:52 +0200
Message-ID: <87y72p5x4v.fsf@macbook.be.48ers.dk>
References: <48AB0A7A.8040209@cisco.com>
	<7d1d9c250808192129j3fb7ef28p8f404c6affd82078@mail.gmail.com>
	<f608b67d0808192215q5b8ffbf0w70531c31cdd66bcd@mail.gmail.com>
	<200808211502.58206.manningc2@actrix.gen.nz>
	<Pine.LNX.4.64.0808211044590.20704@vixen.sonytel.be>
	<48AE4647.5060407@lougher.demon.co.uk>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:to:cc:subject
         :references:from:date:in-reply-to:message-id:user-agent:mime-version
         :content-type:sender;
        bh=UodB93Xz6iKg8K4DtTY3vVFDedg0hQm0CDIKWUnpW98=;
        b=preoJ8ylwZHpbgeOH7Dq1Jx+jRCQMl2MHE3bhVpDtEmhC2hz++j811JVgaWq/ErAGg
         hW3V4vgFBgBHIKWKn4L/NRWZjtsgpeWYPihbR59jwFEImiPHPkoUOZaNSG4VamtURUaQ
         N6KVnqLJ9LBDPSyFwxOkRgS2MQHqiS+7zcr0Y=
In-Reply-To: <48AE4647.5060407@lougher.demon.co.uk> (Phillip Lougher's message of "Fri\, 22 Aug 2008 05\:53\:27 +0100")
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, Charles Manning <manningc2@actrix.gen.nz>, vb <vb@vsbe.com>, Paul Gortmaker <paul.gortmaker@gmail.com>, Linux Embedded Maillist <linux-embedded@vger.kernel.org>, corbet@lwn.net

>>>>> "Phillip" == Phillip Lougher <phillip@lougher.demon.co.uk> writes:

Hi,

 Phillip> It only uses a relatively small subset of the VFS, and goes
 Phillip> nowhere near the MTD subsystem.  Recently dusting off an MTD
 Phillip> patch I wrote for Squashfs a couple of years ago, I found it
 Phillip> had to be completely rewritten for modern kernels.

Can I see it? I've recently pondered patching squashfs to talk
directly to MTD instead of through mtdblock as squashfs often is the
only thing using the block layer on embedded systems.

Compiling with CONFIG_BLOCK=n seems to save around 125kb here.

 Phillip> Having said that the bit of the VFS Squashfs is interested
 Phillip> in has changed in each of 2.6.23, 2.6.24, 2.6.25, 2.6.26 and
 Phillip> now 2.6.27, and so I wouldn't say it was immune anyway.

Yeah, but it has always been pretty easy to fixup.

-- 
Bye, Peter Korsgaard
