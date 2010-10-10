From: Wolfgang Denk <wd@denx.de>
Subject: Re: logfs segfaults at umount time
Date: Sun, 10 Oct 2010 19:16:33 +0200
Message-ID: <20101010171633.5E90C14F310@gemini.denx.de>
References: <4CB1E5B3.1090300@free-electrons.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: <4CB1E5B3.1090300@free-electrons.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Opdenacker <michael.opdenacker@free-electrons.com>
Cc: joern@logfs.org, logfs@logfs.org, linux-embedded mailing list <linux-embedded@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>

Dear Michael,

In message <4CB1E5B3.1090300@free-electrons.com> you wrote:
> 
> I'm running some flash filesystem benchmarks for CELF, and I'm facing
> kernel segfaults when I try to umount my logfs filesystem.
...
> root@calao:~# mount -t logfs /dev/mtdblock0 /mnt/flash/
> root@calao:~# cp -rf /fs/8m/* /mnt/flash/
> eth0: TX underrun, resetting buffers
> eth0: TX underrun, resetting buffers

Seems you have some problems here already?

> root@calao:~# umount /mnt/flash/
> kernel BUG at fs/logfs/segment.c:858!
> Unable to handle kernel NULL pointer dereference at virtual address 00000000
> pgd = c14a4000
> [00000000] *pgd=23a3c031, *pte=00000000, *ppte=00000000
> Internal error: Oops: 817 [#1]
...

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
We have phasers, I vote we blast 'em!
	-- Bailey, "The Corbomite Maneuver", stardate 1514.2
