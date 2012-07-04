From: Vineeth <vneethv@gmail.com>
Subject: rionet driver with MMIO DMA capability
Date: Wed, 4 Jul 2012 11:45:56 +0530
Message-ID: <CAFbQSaDWXTg429q-tTRvcgAEsA1OmHzFVhPNOmSRnWjMpSZfpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2727243577129492468=="
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to:cc:content-type;
 bh=aBNpoL0zF7Fcv5VWU7X3dJ3CM4XggdiZMjZ6vhjIDSw=;
 b=RCzRkU4N43aPjpfOWIbcDZSzG+hetERBYLrJSgaxOK2NwsnHNyYPI1xUvVDFZd1Le5
 drLZsWNRUdk6fbjPAtMzeoQjuGq7tIj5sJxuG7ZPGLN4t6oDcgNG+aEZRmu5ljgsFteZ
 ZDo1Mntwonkh9xVB9J09W/1vLjwswCg2jl/BgT91K4e09HkVjpkHgK1HmMIoSHuHPlHH
 MRMxkv9m+MHafJBNhwPOqYjgVjyeRsG35xXdh/iA+91LUVTmwsVAc65JoAaSYMqqSah6
 /vLFHOHBjmX9IQ0ivwDtK+TEupxH47VTHMUGGoifRHVKAExd4ntRkTsrgozMtCiBXLph
 Ob2Q==
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: linux-embedded@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linuxppc-embedded@ozlabs.org, Scott Wood <scottwood@freescale.com>, mporter@kernel.crashing.org
Cc: ranenikhil19@gmail.com

--===============2727243577129492468==
Content-Type: multipart/alternative; boundary=0015175cb67a03096004c3faf89b

--0015175cb67a03096004c3faf89b
Content-Type: text/plain; charset=ISO-8859-1

Hi,

With kernel mainstream version 3.5.rc-5 there's SRIO low level driver with
DMA support for MMIO. But the rionet driver in the same kernel version
doesnt support MMIO.

We are trying to find the maximum bandwidth that we can achieve using our
custom board's(quad MPC8641 )  4-lane SRIO.
Now we are worried how to use this SRIO low level driver effectively ?

The RIOnet driver (with 3.5.-rc5) uses message based communication. This
doesnt use the DMA capability of low level driver. with this we are getting
a bandwidth of nearly 900Mbps, which is very less.

Is there any example code or modified middle ware driver for rionet/ or any
code which uses the low level driver apis with MMIO DMA??


Thanks
Vineeth

--0015175cb67a03096004c3faf89b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br>Hi,<br><br>With kernel mainstream version 3.5.rc-5 there&#39;s SRIO low=
 level driver with DMA support for MMIO. But the rionet driver in the same =
kernel version doesnt support MMIO. <br><br>We are trying to find the maxim=
um bandwidth that we can achieve using our custom board&#39;s(quad MPC8641 =
)=A0 4-lane SRIO. <br>

Now we are worried how to use this SRIO low level driver effectively ? <br>=
<br>The RIOnet driver (with 3.5.-rc5) uses message based communication. Thi=
s doesnt use the DMA capability of low level driver. with this we are getti=
ng a bandwidth of nearly 900Mbps, which is very less.<br>

<br>Is there any example code or modified middle ware driver for rionet/ or=
 any code which uses the low level driver apis with MMIO DMA??<br><br><br>T=
hanks<br>Vineeth<br>

--0015175cb67a03096004c3faf89b--

--===============2727243577129492468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linuxppc-dev mailing list
Linuxppc-dev@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/linuxppc-dev
--===============2727243577129492468==--
