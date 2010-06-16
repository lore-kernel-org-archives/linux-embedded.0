From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: Information on XIP
Date: Wed, 16 Jun 2010 18:23:44 -0400
Message-ID: <AANLkTinhDRRh0FhREV_YDPiPxPhGxfpo6ckRRag4vwQk@mail.gmail.com>
References: <4C194DF0.60307@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=eHlWMQ27uN/a8RNc90TDfNMaS4ygHtQVIINXqMhsjqc=;
        b=YY4rIU/PZQZxeLoLE597cz9l1dwQsFhTA1u6BY1ju8XUspT+jOPGUfNhtkc/1L2VJJ
         PVq04JUmuRa/7deSxfMenlu3N728yG2Lzm2cIMUL2lWhHZB5+eZC2ukPMfxweYqkcAu7
         YENg2qBb6uEa1F0O1ZQb9RtQLjo1gTPwmC5c4=
In-Reply-To: <4C194DF0.60307@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tim Bird <tim.bird@am.sony.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

On Wed, Jun 16, 2010 at 18:19, Tim Bird wrote:
> I'd like to start collecting information about XIP on the
> eLinux wiki. =C2=A0If you've done XIP for the kernel or for
> user-space (application XIP), or know a good source of
> information about this, please let me know.

Blackfin linux + userspace XIP:
http://docs.blackfin.uclinux.org/doku.php?id=3Dlinux-kernel:xip

> I'm interested in putting together a basic tutorial about
> XIP, and doing some benchmarking on an ARM platform.

i believe the denk guys have done some benchmarking on ppc, so you
might want to poke them if they arent on this list
-mike
