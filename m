From: Dima Zavin <dima@android.com>
Subject: Re: [PATCH 3/5] logger: reorder prepare_to_wait and mutex_lock
Date: Wed, 8 Feb 2012 21:56:54 -0800
Message-ID: <CAPz4a6DiPaSAF3ZhmnTDnjwXHXv0at32QTMmRrgP8VyLOSG_Ug@mail.gmail.com>
References: <4F31DC31.6040303@am.sony.com>
	<4F31DE31.3040001@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=gamma;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding:x-system-of-record;
        bh=PXKIYwvf3kQDySscctvrDWd+thdPLzuT3AcjmOvC0IA=;
        b=VvdwkZLlUq5FPvUzOgNYcWzGyjckGK0vrtwJ4z/FnCFq3zxIQpMHlkHK9m8c8LldCA
         vyJ6srbiYB040yWgy1ddjcjhfcLc+shrPUn5a6uUdTn01Ma+dU/88M+RyqHoHNIGJhbv
         XbzJdu8vYFWlv1pede7mZ0/fg+xeqrWqTvcDY=
In-Reply-To: <4F31DE31.3040001@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Brian Swetland <swetland@google.com>, Andrew Morton <akpm@osdl.org>

On Tue, Feb 7, 2012 at 6:30 PM, Tim Bird <tim.bird@am.sony.com> wrote:
> If mutex_lock waits, it will return in state TASK_RUNNING,
> rubbing out the effect of prepare_to_wait().
>
> Signed-off-by: Tim Bird <tim.bird@am.sony.com>

Acked-by: Dima Zavin <dima@android.com>

> ---
> =A0drivers/staging/android/logger.c | =A0 =A03 ++-
> =A01 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/staging/android/logger.c b/drivers/staging/andro=
id/logger.c
> index 92cfd94..54b7cdf 100644
> --- a/drivers/staging/android/logger.c
> +++ b/drivers/staging/android/logger.c
> @@ -172,9 +172,10 @@ static ssize_t logger_read(struct file *file, ch=
ar __user *buf,
>
> =A0start:
> =A0 =A0 =A0 =A0while (1) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mutex_lock(&log->mutex);
> +
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0prepare_to_wait(&log->wq, &wait, TASK_=
INTERRUPTIBLE);
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 mutex_lock(&log->mutex);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D (log->w_off =3D=3D reader->r_o=
ff);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mutex_unlock(&log->mutex);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!ret)
> --
> 1.7.2.3
>
