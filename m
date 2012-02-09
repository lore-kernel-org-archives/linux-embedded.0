From: Dima Zavin <dima@android.com>
Subject: Re: [PATCH 5/5] logger: clarify non-update of w_off in do_write_log_from_user
Date: Wed, 8 Feb 2012 22:10:54 -0800
Message-ID: <CAPz4a6CrJ2VS8-igOz5aRFAL32-xUi5a6cHa6rEqtK3B5689Og@mail.gmail.com>
References: <4F31DC31.6040303@am.sony.com>
	<4F31DF34.8000205@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=gamma;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding:x-system-of-record;
        bh=R4dALi/4m1Vpse90XMYOC6WEC9EpnQ9Kp8ZA2YGiB7Y=;
        b=Z+wPCwF5beR8nq5Z1VeVxpuywT/GiKOpt7tF6UZhnT97M8nHMlaNH5+6d+oBRHFugK
         iBb829kBjBEtsrgFyI8d0vgNN0ak/FwE7O1kw4dijULz+1TwEqLG2frrO3RjKGEISKCH
         A1nzVMmRnlqdH5kV0XhGvGUdA6kzGz2JjiN/A=
In-Reply-To: <4F31DF34.8000205@am.sony.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Brian Swetland <swetland@google.com>, Andrew Morton <akpm@osdl.org>

On Tue, Feb 7, 2012 at 6:34 PM, Tim Bird <tim.bird@am.sony.com> wrote:
> Add comment to explain when w_off is not updated in case of failed se=
cond
> fragment copy to buffer.
>
> Signed-off-by: Tim Bird <tim.bird@am.sony.com>

Acked-by: Dima Zavin <dima@android.com>

> ---
> =A0drivers/staging/android/logger.c | =A0 =A06 ++++++
> =A01 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/staging/android/logger.c b/drivers/staging/andro=
id/logger.c
> index 8d9d4f1..115d8ed 100644
> --- a/drivers/staging/android/logger.c
> +++ b/drivers/staging/android/logger.c
> @@ -330,6 +330,12 @@ static ssize_t do_write_log_from_user(struct log=
ger_log *log,
>
> =A0 =A0 =A0 =A0if (count !=3D len)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (copy_from_user(log->buffer, buf + =
len, count - len))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Note that by not u=
pdating w_off, this abandons the
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* portion of the new=
 entry that *was* successfully
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* copied, just above=
=2E =A0This is intentional to avoid
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* message corruption=
 from missing fragments.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EFAULT;
>
> =A0 =A0 =A0 =A0log->w_off =3D logger_offset(log, log->w_off + count);
> --
> 1.7.2.3
>
