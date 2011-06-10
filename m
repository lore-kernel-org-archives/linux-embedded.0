From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: [PATCH] Bootgraph.pl bug fix
Date: Fri, 10 Jun 2011 15:00:38 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1106101459570.22872@pobox.suse.cz>
References: <1307655610-28446-1-git-send-email-amurray@mpcdata.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1307655610-28446-1-git-send-email-amurray@mpcdata.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Murray <amurray@mpcdata.com>
Cc: linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Murray <amurray@mpc-data.co.uk>, Arjan van de Ven <arjan@infradead.org>

On Thu, 9 Jun 2011, Andrew Murray wrote:

> This patch removes the assumption of the bootgraph.pl script that the
> timing information reported by PRINTK_TIME will contain at least one
> entry with a time of less than 100 seconds.
> 
> Not all boards correctly reset the system timer and in many cases the
> inital times reported by PRINTK_TIME is high. When this occurs the
> bootchart.pl script fails to give any useful output.
> 
> This patch sets the $firsttime variable to the largest value expected
> by PRINTK_TIME
> 
> Signed-off-by: Andrew Murray <amurray@mpc-data.co.uk>
> ---
>  scripts/bootgraph.pl |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/scripts/bootgraph.pl b/scripts/bootgraph.pl
> index 12caa82..b78fca9 100644
> --- a/scripts/bootgraph.pl
> +++ b/scripts/bootgraph.pl
> @@ -44,7 +44,7 @@ my %end;
>  my %type;
>  my $done = 0;
>  my $maxtime = 0;
> -my $firsttime = 100;
> +my $firsttime = 99999;
>  my $count = 0;
>  my %pids;
>  my %pidctr;

Adding Arjan to CC. Arjan, if you are OK with the patch, I can take it 
through my tree with your Ack.

Thanks,

-- 
Jiri Kosina
SUSE Labs
