From: Chris <chris@2net.co.uk>
Subject: Re: File system robustness
Date: Tue, 18 Jul 2023 15:47:11 +0100
Message-ID: <D2686589-496B-4257-953A-4B19F2B70E0C@2net.co.uk>
References: <20230717075035.GA9549@tomerius.de>
 <CAG4Y6eTU=WsTaSowjkKT-snuvZwqWqnH3cdgGoCkToH02qEkgg@mail.gmail.com>
 <20230718053017.GB6042@tomerius.de>
 <CAEYzJUGC8Yj1dQGsLADT+pB-mkac0TAC-typAORtX7SQ1kVt+g@mail.gmail.com>
 <CAG4Y6eTN1XbZ_jAdX+t2mkEN=KoNOqprrCqtX0BVfaH6AxkdtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0783258445600451674=="
Return-path: <dm-devel-bounces@redhat.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689750200;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=RHKWDfwwf8NVZp5dEqppX2VQyLVrN/KCDm3OTwydBy4=;
	b=NH5v2tIRzo3NI0Ueq3N0AHyyo55EguJ5SX8QiHMUSEuqk6DGnrZcd7kn6FKkilBZsZpAci
	ftPWVHb2x+LGqDWxKsxz9DKK3wC4o7Ndk2jH/3XNaVhhdsAYzTkHYGL8KG8dTkxI42vZkx
	MZa1eeOtVXHWtITsifHM+AGvSk1LxuU=
In-Reply-To: <CAG4Y6eTN1XbZ_jAdX+t2mkEN=KoNOqprrCqtX0BVfaH6AxkdtQ@mail.gmail.com>
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
To: "Alan C. Assis" <acassis@gmail.com>, =?ISO-8859-1?Q?Bj=F8rn_Forsman?= <bjorn.forsman@gmail.com>
Cc: dm-devel@redhat.com, Ext4 Developers List <linux-ext4@vger.kernel.org>, linux-embedded@vger.kernel.org, Kai Tomerius <kai@tomerius.de>

--===============0783258445600451674==
Content-Type: multipart/alternative;
 boundary=----VHMVYPN98JDOVKGMDMX1TYSRUHLC71

------VHMVYPN98JDOVKGMDMX1TYSRUHLC71
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Bj=C3=B8rn,

If I may summarize, for Linux with raw NAND flash, your main option is UBIF=
S. You can also use UBI + squashfs if you really want to save space

For Linux with managed flash (e.g. eMMC or UFS), most people go with EXT4 o=
r F2FS

HTH,
Chris

On 18 July 2023 14:04:55 BST, "Alan C. Assis" <acassis@gmail.com> wrote:
>Hi Bj=C3=B8rn,
>
>On 7/18/23, Bj=C3=B8rn Forsman <bjorn.forsman@gmail.com> wrote:
>> On Tue, 18 Jul 2023 at 08:03, Kai Tomerius <kai@tomerius.de> wrote:
>>> I should have mentioned that I'll have a large NAND flash, so ext4
>>> might still be the file system of choice. The other ones you mentioned
>>> are interesting to consider, but seem to be more fitting for a smaller
>>> NOR flash.
>>
>> If you mean raw NAND flash I would think UBIFS is still the way to go?
>> (It's been several years since I was into embedded Linux systems.)
>>
>> https://elinux.org/images/0/02/Filesystem_Considerations_for_Embedded_De=
vices.pdf
>> is focused on eMMC/SD Cards, which have built-in controllers that
>> enable them to present a block device interface, which is very unlike
>> what raw NAND devices have.
>>
>> Please see https://www.kernel.org/doc/html/latest/filesystems/ubifs.html
>> for more info.
>>
>
>You are right, for NAND there is an old (but gold) presentation here:
>
>https://elinux.org/images/7/7e/ELC2009-FlashFS-Toshiba.pdf
>
>UBIFS and YAFFS2 are the way to go.
>
>But please note that YAFFS2 needs license payment for commercial
>application (something that I only discovered recently when Xiaomi
>integrated it into NuttX mainline, bad surprise).
>
>BR,
>
>Alan

------VHMVYPN98JDOVKGMDMX1TYSRUHLC71
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div dir=3D"auto">Hi Bj=C3=B8rn,<br><br>If I may s=
ummarize, for Linux with raw NAND flash, your main option is UBIFS. You can=
 also use UBI + squashfs if you really want to save space<br><br>For Linux =
with managed flash (e.g. eMMC or UFS), most people go with EXT4 or F2FS<br>=
<br>HTH,<br>Chris</div><br><br><div class=3D"gmail_quote"><div dir=3D"auto"=
>On 18 July 2023 14:04:55 BST, "Alan C. Assis" &lt;acassis@gmail.com&gt; wr=
ote:</div><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.=
8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<pre class=3D"k9mail"><div dir=3D"auto">Hi Bj=C3=B8rn,<br><br>On 7/18/23, B=
j=C3=B8rn Forsman &lt;bjorn.forsman@gmail.com&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0.8ex; border-left: 1=
px solid #729fcf; padding-left: 1ex;"><div dir=3D"auto">On Tue, 18 Jul 2023=
 at 08:03, Kai Tomerius &lt;kai@tomerius.de&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0.8ex; border-left: 1px=
 solid #ad7fa8; padding-left: 1ex;"><div dir=3D"auto">I should have mention=
ed that I'll have a large NAND flash, so ext4<br>might still be the file sy=
stem of choice. The other ones you mentioned<br>are interesting to consider=
, but seem to be more fitting for a smaller<br>NOR flash.<br></div></blockq=
uote><div dir=3D"auto"><br> If you mean raw NAND flash I would think UBIFS =
is still the way to go?<br> (It's been several years since I was into embed=
ded Linux systems.)<br><br> <a href=3D"https://elinux.org/images/0/02/Files=
ystem_Considerations_for_Embedded_Devices.pdf">https://elinux.org/images/0/=
02/Filesystem_Considerations_for_Embedded_Devices.pdf</a><br> is focused on=
 eMMC/SD Cards, which have built-in controllers that<br> enable them to pre=
sent a block device interface, which is very unlike<br> what raw NAND devic=
es have.<br><br> Please see <a href=3D"https://www.kernel.org/doc/html/late=
st/filesystems/ubifs.html">https://www.kernel.org/doc/html/latest/filesyste=
ms/ubifs.html</a><br> for more info.<br><br></div></blockquote><div dir=3D"=
auto"><br>You are right, for NAND there is an old (but gold) presentation h=
ere:<br><br><a href=3D"https://elinux.org/images/7/7e/ELC2009-FlashFS-Toshi=
ba.pdf">https://elinux.org/images/7/7e/ELC2009-FlashFS-Toshiba.pdf</a><br><=
br>UBIFS and YAFFS2 are the way to go.<br><br>But please note that YAFFS2 n=
eeds license payment for commercial<br>application (something that I only d=
iscovered recently when Xiaomi<br>integrated it into NuttX mainline, bad su=
rprise).<br><br>BR,<br><br>Alan<br></div></pre></blockquote></div></body></=
html>
------VHMVYPN98JDOVKGMDMX1TYSRUHLC71--

--===============0783258445600451674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============0783258445600451674==--
