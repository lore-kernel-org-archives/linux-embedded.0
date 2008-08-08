From: Behan Webster <behanw@websterwood.com>
Subject: Re: embedded rootfs utility
Date: Fri, 08 Aug 2008 13:03:37 -0400
Message-ID: <489C7C69.5060209@websterwood.com>
References: <488FCF7D.5010005@websterwood.com> <Pine.LNX.4.64.0808061345080.28556@vixen.sonytel.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0808061345080.28556@vixen.sonytel.be>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: linux-embedded@vger.kernel.org

Geert Uytterhoeven wrote:
> Thanks for this useful tool!
> I'm used to plain debootstrap, but decided to give your elbs-rootfs a try for
> creating up a mipsel and a powerpc NFS root file system. It worked fine,
> except for one minor nit. As an NFS root file system is mounted read-only by
> default, I had to manually do
>
> | mount -n proc /proc -t proc       
> | mount -n -o remount -w /
>
> before running finish.sh. Perhaps this can be added to the top of finish.sh?
>   
Odd.  I never had this issue.  It has always just worked for me.

None the less, I will add checks for this to the script.

> Add the end of its execution, finish.sh says:
>
> | Feel free to delete /debootstrap and the downloaded packages
> |   # rm -rf /debootstrap
> |   # apt-get clean
> | Please reboot now
> |   # shutdown -r now
>
> Shouldn't it suggest to delete /finish.sh, too?
>   
Ah.  finish.sh used to delete itself when finished.  I removed that
while testing, and forgot to put it back in.

Indeed you are correct.

> Anyway, thanks for this tool!
>   
I'm glad you are finding it useful.

-- 
Behan Webster
behanw@websterwood.com
