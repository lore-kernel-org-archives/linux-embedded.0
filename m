From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: File system robustness
Date: Mon, 17 Jul 2023 11:08:45 +0200
Message-ID: <CAMuHMdWA+2froa9Z=GHrd5Ub-dr=o-ErNsgjS7TJnXbHYggMdQ@mail.gmail.com>
References: <20230717075035.GA9549@tomerius.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-ext4-owner@vger.kernel.org>
In-Reply-To: <20230717075035.GA9549@tomerius.de>
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Kai Tomerius <kai@tomerius.de>
Cc: linux-embedded@vger.kernel.org, Ext4 Developers List <linux-ext4@vger.kernel.org>, dm-devel@redhat.com

CC linux-ext4, dm-devel

On Mon, Jul 17, 2023 at 10:13=E2=80=AFAM Kai Tomerius <kai@tomerius.de> wro=
te:
>
> Hi,
>
> let's suppose an embedded system with a read-only squashfs root file
> system, and a writable ext4 data partition with data=3Djournal.
> Furthermore, the data partition shall be protected with dm-integrity.
>
> Normally, I'd umount the data partition while shutting down the
> system. There might be cases though where power is cut. In such a
> case, there'll be ext4 recoveries, which is ok.
>
> How robust would such a setup be? Are there chances that the ext4
> requires a fsck? What might happen if fsck is not run, ever? Is there
> a chance that the data partition can't be mounted at all? How often
> might that happen?
>
> Thx
> regards
> Kai
