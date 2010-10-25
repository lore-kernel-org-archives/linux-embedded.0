From: Pawel Suchanecki <subdcc@gmail.com>
Subject: Re: How to spin down the SATA hard drive on ARM target (Open-RD)?
Date: Mon, 25 Oct 2010 18:24:03 +0200
Message-ID: <AANLkTinzVGgsCRuqdShJbCLO-CGFGd_Pt-jeYMZV1+sh@mail.gmail.com>
References: <AANLkTim6xmfWSF92GzenqfYOgzjj73TF6wS7QM06T=Ps@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type;
        bh=XDPBwHZce+Yx/qKCjn3roPf21O34zn1XULigOAiwACs=;
        b=mnFeYYKUfOaiLmFfudTdS16VTbo6T0RNnTNaetqvN9ZScOz0ufnUid0kbH4ZZ3+dbb
         mWR4zQQ054DW33q/g9tr/L+0fYTmtEqrl8px2G2OaWOOIjaA32DltqQ7uUKhRzFeIlPq
         sBlLSOmv7Vj5Etnn/8I0ghxkzMOpjiS84ALPg=
In-Reply-To: <AANLkTim6xmfWSF92GzenqfYOgzjj73TF6wS7QM06T=Ps@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

Hello again,

I post an update below the original.

2010/10/25 Pawel Suchanecki <subdcc@gmail.com>:
> Dear list,
>
> I am trying to achieve the HDD _simple_ power saving function on
> Open-RD Client device, running Linux 2.6.22 / 2.6.36.
>
> The simplification is that I just need to spin the disk down and then
> sit quietly waiting for IC2 port expander's IRQ (button press) to
> reboot the system.
>
> Is the `sg_stat --stop' command from sg3_utils package capable of
> performing the disk spin down for SATA device (WD) on this armish
> platform?
> If not, please direct me to proper solution.
>
> Is it feasible running full power saving mode (i.e. using spindown
> daemon [1]) to be able to wake the hard disk and resume normal system
> operation?

I forgot to mention that the standard approach (i.e. hdparm -y / -Y )
does not work for me:

root@XXXX:~# df -h | grep -E "Filesystem|sda"
Filesystem           Size           Used           Avail
Use%           Mounted on
/dev/sda1             344G            26G          305G
8%           /mnt/disk


root@XXXX:~# hdparm -y /dev/sda1

/dev/sda1:
 issuing standby command
 HDIO_DRIVE_CMD(standby) failed: Input/Output error


root@XXXX:~# hdparm -Y /dev/sda1

/dev/sda1:
 issuing sleep command
 HDIO_DRIVE_CMD(sleep) failed: Input/Output error


root@XXXX:~# hdparm -I /dev/sda1

/dev/sda:
 HDIO_DRIVE_CMD(indentify) failed: Input/Output error


Using sdparm I get the device model instead of the command executed as
in this request:

root@XXXX:~# sdparm -C stop /dev/sg0
     /dev/sg0: WDC           WD3000BLFS-01YBU 04.0


Also as you already may noticed, the hard drive itself is WDC VelociRaptor.

Is it possible that the VelociRaptor  -- due to being targeted at the
enterprise market -- does not support power saving functions?

How can this happen that hdparm replies with IO error when the device
is there (and serving a working filesystem) ?

Thanks,
Pawel.
