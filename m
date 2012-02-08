From: Frank Rowand <frank.rowand@am.sony.com>
Subject: Re: [PATCH 1/5] logger: Change logger_offset() from macro to function
Date: Tue, 7 Feb 2012 19:22:37 -0800
Message-ID: <4F31EA7D.2010706@am.sony.com>
References: <4F31DC31.6040303@am.sony.com>
Reply-To: <frank.rowand@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4F31DC31.6040303@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Greg KH <gregkh@suse.de>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Brian Swetland <swetland@google.com>, Dima Zavin <dima@android.com>, Andrew Morton <akpm@osdl.org>

On 02/07/12 18:21, Tim Bird wrote:
> Convert to function and add log as a parameter, rather than relying
> on log in the context of the macro.
> 
> Signed-off-by: Tim Bird <tim.bird@am.sony.com>
> ---
>  drivers/staging/android/logger.c |   16 ++++++++++------
>  1 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/android/logger.c b/drivers/staging/android/logger.c
> index ffc2d04..92456d7 100644
> --- a/drivers/staging/android/logger.c
> +++ b/drivers/staging/android/logger.c
> @@ -60,7 +60,11 @@ struct logger_reader {
>  };
> 
>  /* logger_offset - returns index 'n' into the log via (optimized) modulus */
> -#define logger_offset(n)	((n) & (log->size - 1))
> +size_t logger_offset(struct logger_log *log, size_t n)
> +{
> +	return n & (log->size-1);

        return n & (log->size - 1);
> +}
> +

Reviewed-by: Frank Rowand <frank.rowand@am.sony.com>
