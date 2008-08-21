From: Carsten Otte <cotte@de.ibm.com>
Subject: Re: [PATCH 01/10] AXFS: exporting xip_file_fault() for use with AXFS
Date: Thu, 21 Aug 2008 09:42:50 +0200
Message-ID: <48AD1C7A.6020705@de.ibm.com>
References: <48AD00D5.5010904@gmail.com>
Reply-To: carsteno@de.ibm.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48AD00D5.5010904@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jaredeh@gmail.com
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@AM.SONY.COM, nickpiggin@yahoo.com.au

Jared Hulbert wrote:
> We'll need this for AXFS.  The equivalent function in filemap.c is exported.
> 
> Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
> ---
>  include/linux/mm.h |    4 ++++
>  mm/filemap_xip.c   |    3 ++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
Acked-by: Carsten Otte <cotte@de.ibm.com>
