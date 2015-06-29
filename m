From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/3] printk: implement support for extended console drivers
Date: Mon, 29 Jun 2015 11:20:41 +0200
Message-ID: <CAMuHMdWwH-3kx1ma5KE=fP94by8boxM_QYqPKpU=YJw8t3hYeg@mail.gmail.com>
References: <1430318704-32374-1-git-send-email-tj@kernel.org>
	<1430318704-32374-4-git-send-email-tj@kernel.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=dRD6RWrybbVu+X4uuVS0nJzrA7nPEWRRz1da7nIfPbM=;
        b=MIZ0SETwZ8Lyx2/9RdcHDS4ZphRs6VOJwioOkU7pgVE5xFjU9dJiNaK6FFxbBFc61y
         9753hY25XALj10nlFwTEIGnp2Z2VUlGi3NtgIm6dcuwdhjz7vzHdZlVgmJO8ihPZENB/
         9qRrrZRYh4mvIhSRPbff0L882JsSxu+PM8qMIiZFUwRnzvcxpAlq8cYrrh7QnoDoP5Ds
         fkxkBRnd1KlGSutKi27KdR7W68gVOBl+k9TxZaMc7ow3QAb19dQkCv3uOU9ECRSwUB0P
         ZyuWqySehmOYqy6KCc/r42xoYMF2mVUlyoJotZ20LS3RtHY+M/ovJgYEwiSWhuzXtcYK
         eHog==
In-Reply-To: <1430318704-32374-4-git-send-email-tj@kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tejun Heo <tj@kernel.org>
Cc: pmladek@suse.cz, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Kay Sievers <kay@vrfy.org>, Josh Triplett <josh@joshtriplett.org>, Linux Embedded <linux-embedded@vger.kernel.org>

Hi Tejun,

On Wed, Apr 29, 2015 at 4:45 PM, Tejun Heo <tj@kernel.org> wrote:
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c

> @@ -2196,6 +2227,7 @@ out:
>   */
>  void console_unlock(void)
>  {
> +       static char ext_text[CONSOLE_EXT_LOG_MAX];

Can you please
  a) make this feature optional,
  b) (de)allocate this buffer dynamically when the first/last console with
      CON_EXTENDED set is (un)registered?

Your patch is at the top of the bloat-o-meter output (against v4.1):

add/remove: 388/154 grow/shrink: 1309/269 up/down: 92366/-44878 (47488)
function                                     old     new   delta
ext_text                                       -    8192   +8192
do_con_trol                                    -    4824   +4824
path_openat                                 1416    4224   +2808
tvec_bases                                     4    2080   +2076
ip_do_fragment                                 -    1824   +1824
unix_stream_read_generic                       -    1452   +1452
ext4_ext_shift_extents                         -    1350   +1350
ext4_insert_range                              -    1174   +1174
bpf_prepare_filter                           264    1430   +1166
proc_pid_cmdline_read                          -    1020   +1020

and unlike the others, this one is not that difficult to fix.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
