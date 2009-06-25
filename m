From: Florian Fainelli <florian@openwrt.org>
Subject: Re: Status of bzip2 and lzma kernel compression for ARM?
Date: Thu, 25 Jun 2009 11:04:01 +0200
Message-ID: <200906251104.02830.florian@openwrt.org>
References: <4A428AFF.20307@free-electrons.com> <4A433BCD.2030506@compulab.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755058AbZFYJE3@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=LItnOcQmZ2eoQD85nl6xp+1dr5i/PfjH4VpiiGBlkO8=;
        b=mDfwBAW/J1iIr3RYOKeda8Xj7QP0Kzu6H8VaMEQN0l9Jb2ufW+fZtXf1Bp1NGQltfd
         4JmAJndMT3l3gDwe8uTXLfRf1PxwGiBCvmDfF4dOOwDLkOObh8tyPDpbkDvHCb0haNBn
         oUb6ZbaJ/GyhzgApKRfc9lF+7+evTglX8zndk=
In-Reply-To: <4A433BCD.2030506@compulab.co.il>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mike Rapoport <mike@compulab.co.il>
Cc: Michael Opdenacker <michael-lists@free-electrons.com>, Alain Knaff <alain@knaff.lu>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.arm.linux.org.uk, linux-embedded mailing list <linux-embedded@vger.kernel.org>

Hi Michael, Mike

Le Thursday 25 June 2009 10:56:45 Mike Rapoport, vous avez =E9crit=A0:
> Hi Michael,
>
> Michael Opdenacker wrote:
> > Hi Alain,
> >
> > I would like to test bzip2 and lzma compression on ARM.
> >
> > Would you mind telling me what the status of your patches on ARM is=
, now
> > that the x86  and architecture independent code has been merged? Ha=
ve
> > you or has anyone already updated them for 2.6.30, or shall I updat=
e
> > them by myself?
>
> I'm not sure what exactly do you mean by "test bzip2 and lzma compres=
sion
> on ARM", but if you refer to internal initramfs compression, I can te=
ll
> that I've used lzma compression on PXA270 and it works fine.

I think Michael refers to the lzma decompressor which allows you to use=
 a=20
lzma-compressed kernel as a (b)zImage with its architecture specific=20
decompressor piggy-backed in the (b)zImage.

Such thing would also be very useful on MIPS and PowerPC as well.
--=20
Best regards, Florian Fainelli
Email : florian@openwrt.org
http://openwrt.org
-------------------------------
