From: Belisko Marek <marek.belisko@gmail.com>
Subject: Re: Flash filesystems benchmarks
Date: Thu, 28 Jul 2011 21:14:58 +0200
Message-ID: <CAAfyv35zgDLpf6Hs0G0wESh0-BjoiWMH+4wA7+anSwR0rREtbA@mail.gmail.com>
References: <4E3131AE.7010408@free-electrons.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=7x+w4YdiWkTGOepaJzNpRYlnzoRMSVly6wkwB7O2T80=;
        b=kQdUi25L7+dVbVFI5P5gh4AjsroJJ2jAa4i4WYYeXBu2RasaIctKvE9Y4CAwLM2cft
         frsODYBp5wby0zMmUFXXWVvs55xowxyb0XA7uAgS1VkQ5Ig016vr64KK+4VUvWuKwB/o
         4B7pMXc1GA9zyHZPagOcO71TCGbFmB3kvmIiE=
In-Reply-To: <4E3131AE.7010408@free-electrons.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David Wagner <david.wagner@free-electrons.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Linux Embedded <linux-embedded@vger.kernel.org>, tim.bird@am.sony.com

Hi,

On Thu, Jul 28, 2011 at 11:53 AM, David Wagner
<david.wagner@free-electrons.com> wrote:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Hello,
>
> As a contract with the CELF, we (Free Electrons) developed a flash
> filesystem benchmarking suite ; it tests ubifs, jffs2, yaffs2 and
> squashfs(over UBI+two different block transition layers). It has been
> run on a Calao USB-9263 board and a IGEPv2 board and on 2.6.38, .39 a=
nd
> 3.0 kernels.
>
> The results are shown as histograms and two different reportings exis=
ts:
> =C2=A0* filesystem comparison for a given board/kernel couple
> =C2=A0* kernel comparison for a given board/filesystem couple
>
> All the details are to be found at:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0http://elinux.org/Flash_Filesystem_Benchma=
rks
> Direct link to the test protocol:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0http://elinux.org/Flash_Filesystem_Benchma=
rks_Protocol
> Link to the gitorious page:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0https://gitorious.org/ffs-benchmarks/ffs-b=
enchmarks
>
> Reviews of the test protocol, pointers to incoherent results or any
> other comment is welcome.
> We will keep posting more results.
Great job ;). Maybe small README how to use scripts. I try to run
=2E/performance-test.py but got en error because test.cfg doesn't exist=
=2E
Shouldn't there be input argument for specific board something like:
diff --git a/performance-tests.py b/performance-tests.py
index 78c83f0..33a4292 100755
--- a/performance-tests.py
+++ b/performance-tests.py
@@ -168,7 +168,12 @@ def main():
        global cur

        cfg =3D ConfigParser.ConfigParser()
-       cfg.read('test.cfg')
+
+       if (len(sys.argv) < 2):
+           print "board configuration parameter missing!!!"
+           return
+
+       cfg.read(sys.argv[1])

        board_name =3D cfg.defaults()['board_name']
        version =3D cfg.defaults()['version']


>
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0David Wagner
>
> --
> David Wagner, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embed=
ded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>

thanks,

marek

--=20
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
=46reelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
icq: 290551086
web: http://open-nandra.com
