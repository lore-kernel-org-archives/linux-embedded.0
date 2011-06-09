From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH] printk-formats.txt documentation update
Date: Thu, 9 Jun 2011 14:51:30 -0700
Message-ID: <20110609145130.7fda9bd1.rdunlap@xenotime.net>
References: <20110609124549.48117a75.rdunlap@xenotime.net>
	<1307654688-28015-1-git-send-email-amurray@mpcdata.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1307654688-28015-1-git-send-email-amurray@mpcdata.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Murray <amurray@mpcdata.com>
Cc: joe@perches.com, w.sang@pengutronix.de, geert@linux-m68k.org, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, trivial@kernel.org, udknight@gmail.com, namhyung@gmail.com, Andrew Murray <amurray@mpc-data.co.uk>

On Thu,  9 Jun 2011 22:24:48 +0100 Andrew Murray wrote:

> From: Andrew Murray <amurray@mpc-data.co.uk>
> 
> This patch updates the incomplete documentation concerning the printk
> extended format specifiers
> 
> Signed-off-by: Andrew Murray <amurray@mpc-data.co.uk>
> ---
>  Documentation/printk-formats.txt |  119 +++++++++++++++++++++++++++++++++++++-
>  1 files changed, 117 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/printk-formats.txt b/Documentation/printk-formats.txt
> index 1b5a5dd..6455e5b 100644
> --- a/Documentation/printk-formats.txt
> +++ b/Documentation/printk-formats.txt
> @@ -9,7 +9,121 @@ If variable is of Type,		use printk format specifier:

> +UUID/GUID addresses:
> +
> +	%pUb	00010203-0405-0607-0809-0a0b0c0d0e0f
> +	%pUB	00010203-0405-0607-0809-0A0B0C0D0E0F
> +	%pUl	03020100-0504-0706-0809-0a0b0c0e0e0f
> +	%pUL	03020100-0504-0706-0809-0A0B0C0E0E0F
> +
> +	For printing-16 byte UUID/GUIDs addresses. The additional 'l', 'L',

	For printing 16-byte

You want to resend or shall I just fix it?

> +	'b' and 'B' specifiers are used to specify a little endian order in
> +	lower ('l') or upper case ('L') hex characters - and big endian order
> +	in lower ('b') or upper case ('B') hex characters.
> +
> +	Where no additional specifiers are used the default little endian
> +	order with lower case hex characters will be printed.


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
