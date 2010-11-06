From: James Hogan <james@albanarts.com>
Subject: Re: [PATCH 02/16 v2] pramfs: super block operations
Date: Sat, 6 Nov 2010 13:12:58 +0000
Message-ID: <20101106131257.GB13522@gandalf.local>
References: <4CD51847.20306@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4CD51847.20306@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Andrew Morton <akpm@linux-foundation.org>

Hi,

On Sat, Nov 06, 2010 at 09:56:39AM +0100, Marco Stornelli wrote:
> From: Marco Stornelli <marco.stornelli@gmail.com>
>=20
> Super block operations.
>=20
> Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
> ---
> diff -Nurp linux-2.6.36-orig/fs/pramfs/super.c linux-2.6.36/fs/pramfs=
/super.c
> --- linux-2.6.36-orig/fs/pramfs/super.c	1970-01-01 01:00:00.000000000=
 +0100
> +++ linux-2.6.36/fs/pramfs/super.c	2010-09-25 14:09:47.000000000 +020=
0
<snip>
> +	pram_dbg("max name length %d\n", PRAM_NAME_LEN);

I get a warning on this line that could be avoided:

fs/pramfs/super.c: In function =E2=80=98pram_init=E2=80=99:
fs/pramfs/super.c:308: warning: format =E2=80=98%d=E2=80=99 expects typ=
e =E2=80=98int=E2=80=99, but
argument 2 has type =E2=80=98long unsigned int=E2=80=99

Cheers
James
