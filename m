From: Linux Rules <linuzoo@gmail.com>
Subject: Re: Help needed with porting 32-bit user ioctl to run on a 64-bit kernel
Date: Wed, 30 Nov 2011 14:11:52 -0800
Message-ID: <CA+ib0qHSPqjnxp5E5CxLxKuQoHUCRvKm-dG0qUwvPWVob6GwLA@mail.gmail.com>
References: <CA+ib0qH_8Ex10sjYH7abbFgaQaRRwKq73exn3jehjpts+Hx=aQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=IldnjYzH2Icgk/HHc+9CSsluaLuMtIKFkfMRBJS8iWc=;
        b=wsSKct8E6vPcuRnLf1QReqIAesPt403boR6bhg4vbyFMCihFR428VQzk+71Up8Wwi1
         4x5LiVS8vRSA/aPANQ4XoWB/XA2vMjHplOqdTlvPn+trH30TcaDHWoiUFxdQ5s21Svtb
         b1SWN7B3PQAbU19EFPX3ExEqs0dQXCZHIzUR0=
In-Reply-To: <CA+ib0qH_8Ex10sjYH7abbFgaQaRRwKq73exn3jehjpts+Hx=aQ@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-embedded@vger.kernel.org

I did some more digging and found that there is a file compat_ioctl.c
which has this function (below) which is creating a local ifreq buffer
copy of the incoming 32-bit buffer and passing to ioctl in kernel, but
does not copy_to_user the data back for default switch case, could
this be the problem?
fs/compat_ioctl.cstatic int dev_ifsioc(unsigned int fd, unsigned int
cmd, unsigned long arg)=A0504{=A0505 =A0 =A0 =A0 =A0struct ifreq ifr;=A0=
506
struct ifreq32 __user *uifr32;=A0507 =A0 =A0 =A0 =A0struct ifmap32 __us=
er
*uifmap32;=A0508 =A0 =A0 =A0 =A0mm_segment_t old_fs;=A0509 =A0 =A0 =A0 =
=A0int err;=A0510
=A0 =A0=A0511 =A0 =A0 =A0 =A0uifr32 =3D compat_ptr(arg);=A0512 =A0 =A0 =
=A0 =A0uifmap32 =3D
&uifr32->ifr_ifru.ifru_map;=A0513 =A0 =A0 =A0 =A0switch (cmd) {=A0514 =A0=
 =A0 =A0 =A0case
SIOCSIFMAP:=A0515 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err =3D copy_from_user=
(&ifr, uifr32,
sizeof(ifr.ifr_name));=A0516 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err |=3D
__get_user(ifr.ifr_map.mem_start, &uifmap32->mem_start);=A0517
=A0 =A0 =A0err |=3D __get_user(ifr.ifr_map.mem_end, &uifmap32->mem_end)=
;=A0518
=A0 =A0 =A0 =A0 =A0 =A0 =A0err |=3D __get_user(ifr.ifr_map.base_addr,
&uifmap32->base_addr);=A0519 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err |=3D
__get_user(ifr.ifr_map.irq, &uifmap32->irq);=A0520 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0err |=3D
__get_user(ifr.ifr_map.dma, &uifmap32->dma);=A0521 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0err |=3D
__get_user(ifr.ifr_map.port, &uifmap32->port);=A0522 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0if
(err)=A0523 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EFAU=
LT;=A0524
break;=A0525 =A0 =A0 =A0 =A0default:=A0526 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0if (copy_from_user(&ifr,
uifr32, sizeof(*uifr32)))=A0527 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0return -EFAULT;
528 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;=A0529 =A0 =A0 =A0 =A0}=A0530 =
=A0 =A0 =A0 =A0old_fs =3D get_fs();
531 =A0 =A0 =A0 =A0set_fs (KERNEL_DS);=A0532 =A0 =A0 =A0 =A0err =3D sys=
_ioctl (fd, cmd,
(unsigned long)&ifr);=A0533 =A0 =A0 =A0 =A0set_fs (old_fs);=A0534 =A0 =A0=
 =A0 =A0if (!err)
{=A0535 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0switch (cmd) {=A0536 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0/* TUNSETIFF is
defined as _IOW, it should be _IORW=A0537 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 * as the data
is copied back to user space, but that=A0538 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 * cannot be
fixed without breaking all existing apps.=A0539 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 */=A0540
=A0 =A0 =A0 =A0 =A0 =A0 =A0case TUNSETIFF:=A0541 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0case SIOCGIFFLAGS:=A0542
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case SIOCGIFMETRIC:=A0543 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0case SIOCGIFMTU:
544 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case SIOCGIFMEM:=A0545 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0case
SIOCGIFHWADDR:=A0546 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case SIOCGIFINDEX:=A0=
547
=A0case SIOCGIFADDR:=A0548 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case SIOCGIFB=
RDADDR:=A0549
=A0 =A0 =A0 =A0case SIOCGIFDSTADDR:=A0550 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
case SIOCGIFNETMASK:
551 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case SIOCGIFTXQLEN:=A0552 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if
(copy_to_user(uifr32, &ifr, sizeof(*uifr32)))=A0553
 =A0 =A0 =A0 =A0 =A0return -EFAULT;=A0554 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0break;=A0555
 =A0 =A0 =A0 =A0case SIOCGIFMAP:=A0556 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0err =3D
copy_to_user(uifr32, &ifr, sizeof(ifr.ifr_name));=A0557
 =A0 =A0 =A0err |=3D __put_user(ifr.ifr_map.mem_start, &uifmap32->mem_s=
tart);
558 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err |=3D __put_user(=
ifr.ifr_map.mem_end,
&uifmap32->mem_end);=A0559 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0err |=3D
__put_user(ifr.ifr_map.base_addr, &uifmap32->base_addr);=A0560
=A0 =A0 =A0 =A0 =A0 =A0 =A0err |=3D __put_user(ifr.ifr_map.irq, &uifmap=
32->irq);=A0561
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err |=3D __put_user(ifr.ifr_=
map.dma,
&uifmap32->dma);=A0562 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0e=
rr |=3D
__put_user(ifr.ifr_map.port, &uifmap32->port);=A0563
=A0 =A0if (err)=A0564 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0err =3D -EFAULT;=A0565
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;=A0566 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0}=A0567 =A0 =A0 =A0 =A0}=A0568
return err;=A0569}=A0570
On Wed, Nov 30, 2011 at 11:42 AM, Linux Rules <linuzoo@gmail.com> wrote=
:
> All,
>
> I am working on porting 32-bit application code to run over a 64-bit =
kernel.
>
> The 32 bit code calls socket ioctl to programs some registers in the
> driver (e1000) and then opens a raw socket.
>
> The struct ifreq is used to construct the command as expected.
>
> The problem i am facing is that, the data which is copied back into
> the ioctl buffer is not visible in the user space at all.
>
> [32-bit user space if req with command] =3D=3D> [IOCTL] =3D=3D> [64-b=
it
> KERNEL] =3D=3D> [reads register copies result into ifreq->ifr_data in
> kernel] =3D=3D> [The copied data is not visible in the user code].
>
> Since the data i require is having a length of only 4 bytes, =A0i use=
d
> the ifr_data field itself as a buffer instead of using it as a pointe=
r
> to a buffer because i see that the ifreq structure is of 32 bytes
> length and ifr_name is part of a union which has a size of 16 bytes.
>
> I tried to do some debugging on this issue and found these:
>
> the struct ifreq is 32 byte in 32-bit user space but is 40 bytes in
> kernel space, this is probably because of the size of sockaddr inside
> ifreq which is different for 64-bit, also copy_from/to_user is not
> required because do_ioctl is already working on a copy of the ifreq
> buffer.
>
> I did some googling and found suggestions to use compat_ioctl to do
> the porting, but that is pertaining to using the file_operations
> structure, netdevice does not have a compat_ioctl, does it?
>
> Any help is appreciated in this regard.
>
> kind regards,
> mz.
