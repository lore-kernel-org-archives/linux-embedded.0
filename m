From: Dima Zavin <dima@android.com>
Subject: Re: [PATCH 1/5] logger: Change logger_offset() from macro to function
Date: Wed, 8 Feb 2012 20:54:33 -0800
Message-ID: <CAPz4a6Cragmh6meckzGKH3kQdgPKVE2DZFdV5Xj98JwQSzckwQ@mail.gmail.com>
References: <4F31DC31.6040303@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=gamma;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding:x-system-of-record;
        bh=7yzxt2Z4d/Hdw1FV1AKCvX+DY09QELy5cOt+VChhFyE=;
        b=n9oB4Suxczgy/TiL/ExrLaej9PV1pMI2J7Em2318q5CmrvbLpYUW0HXgcWNYAHV1Ry
         m83xuX5qX4hw0oOO0JX2CUpvcq6Z1hest6sDKZV99sfpu6cXOz2gQ0eO3KljyBhDrfZU
         oFDKpnuMQUmz9d95Xhwy08llkQcKeWIm2KnX8=
In-Reply-To: <4F31DC31.6040303@am.sony.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Greg KH <gregkh@suse.de>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Brian Swetland <swetland@google.com>, Andrew Morton <akpm@osdl.org>

small style nit otherwise looks ok.

On Tue, Feb 7, 2012 at 6:21 PM, Tim Bird <tim.bird@am.sony.com> wrote:
> Convert to function and add log as a parameter, rather than relying
> on log in the context of the macro.
>
> Signed-off-by: Tim Bird <tim.bird@am.sony.com>
> ---
> =A0drivers/staging/android/logger.c | =A0 16 ++++++++++------
> =A01 files changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/staging/android/logger.c b/drivers/staging/andro=
id/logger.c
> index ffc2d04..92456d7 100644
> --- a/drivers/staging/android/logger.c
> +++ b/drivers/staging/android/logger.c
> @@ -60,7 +60,11 @@ struct logger_reader {
> =A0};
>
> =A0/* logger_offset - returns index 'n' into the log via (optimized) =
modulus */
> -#define logger_offset(n) =A0 =A0 =A0 ((n) & (log->size - 1))
> +size_t logger_offset(struct logger_log *log, size_t n)
> +{
> + =A0 =A0 =A0 return n & (log->size-1);

spaces around -

> +}
> +
>
> =A0/*
> =A0* file_get_log - Given a file structure, return the associated log
> @@ -137,7 +141,7 @@ static ssize_t do_read_log_to_user(struct logger_=
log *log,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (copy_to_user(buf + len, log->buffe=
r, count - len))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EFAULT;
>
> - =A0 =A0 =A0 reader->r_off =3D logger_offset(reader->r_off + count);
> + =A0 =A0 =A0 reader->r_off =3D logger_offset(log, reader->r_off + co=
unt);
>
> =A0 =A0 =A0 =A0return count;
> =A0}
> @@ -225,7 +229,7 @@ static size_t get_next_entry(struct logger_log *l=
og, size_t off, size_t len)
>
> =A0 =A0 =A0 =A0do {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0size_t nr =3D get_entry_len(log, off);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 off =3D logger_offset(off + nr);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 off =3D logger_offset(log, off + nr);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0count +=3D nr;
> =A0 =A0 =A0 =A0} while (count < len);
>
> @@ -260,7 +264,7 @@ static inline int clock_interval(size_t a, size_t=
 b, size_t c)
> =A0static void fix_up_readers(struct logger_log *log, size_t len)
> =A0{
> =A0 =A0 =A0 =A0size_t old =3D log->w_off;
> - =A0 =A0 =A0 size_t new =3D logger_offset(old + len);
> + =A0 =A0 =A0 size_t new =3D logger_offset(log, old + len);
> =A0 =A0 =A0 =A0struct logger_reader *reader;
>
> =A0 =A0 =A0 =A0if (clock_interval(old, new, log->head))
> @@ -286,7 +290,7 @@ static void do_write_log(struct logger_log *log, =
const void *buf, size_t count)
> =A0 =A0 =A0 =A0if (count !=3D len)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0memcpy(log->buffer, buf + len, count -=
 len);
>
> - =A0 =A0 =A0 log->w_off =3D logger_offset(log->w_off + count);
> + =A0 =A0 =A0 log->w_off =3D logger_offset(log, log->w_off + count);
>
> =A0}
>
> @@ -311,7 +315,7 @@ static ssize_t do_write_log_from_user(struct logg=
er_log *log,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (copy_from_user(log->buffer, buf + =
len, count - len))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EFAULT;
>
> - =A0 =A0 =A0 log->w_off =3D logger_offset(log->w_off + count);
> + =A0 =A0 =A0 log->w_off =3D logger_offset(log, log->w_off + count);
>
> =A0 =A0 =A0 =A0return count;
> =A0}
> --
> 1.7.2.3
>
