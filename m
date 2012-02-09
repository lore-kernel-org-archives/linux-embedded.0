From: Dima Zavin <dima@android.com>
Subject: Re: [PATCH 2/5 v2] logger: simplify and optimize get_entry_len
Date: Wed, 8 Feb 2012 21:15:26 -0800
Message-ID: <CAPz4a6CFd_L=hDw9uG56ZnhiqqnsPCLTR_3G=Zo5KDnTP=MwiA@mail.gmail.com>
References: <4F31DC31.6040303@am.sony.com>
	<4F31DDC7.1050107@am.sony.com>
	<4F32C105.4060700@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=gamma;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding:x-system-of-record;
        bh=gRZFhtc7/TiEViaM7l8EEiTvGhSzStPAsLid0GCZ9N0=;
        b=Oay+h9xy84s0vn0K9Mx08k+f8jDtcBBGOw3ESlSWYmt+nqXH7Bl0iMBtU0u64S6T+O
         3oFYhFSHBrTwF7yFJbPFcFnV+gjrwc/O8WamutlqdkJF/412oehJuDvxK0TfpedpZYIY
         owFXzh2o/fCFhUjHfipwKaKGROHoy5isxjxLY=
In-Reply-To: <4F32C105.4060700@am.sony.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Brian Swetland <swetland@google.com>, Andrew Morton <akpm@osdl.org>

On Wed, Feb 8, 2012 at 10:37 AM, Tim Bird <tim.bird@am.sony.com> wrote:
> Make this code slightly easier to read, and eliminate calls
> to sub-routines. =A0Some of these were previously optimized away
> by the compiler, but one memcpy was not.
>
> In my testing, this makes the code about 20% smaller, and
> has no sub-routine calls and no branches (on ARM).
>
> v2 of this patch is, IMHO, easier to read than v1. Compared to
> that patch it uses __u8 instead of unsigned char, for
> consistency with the __u16 val data type, simplifies the
> conditional expression, adds a another comment, and
> moves a common statement out of the if.
>
> Signed-off-by: Tim Bird <tim.bird@am.sony.com>
> ---
> =A0drivers/staging/android/logger.c | =A0 20 ++++++++++++--------
> =A01 files changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/staging/android/logger.c b/drivers/staging/andro=
id/logger.c
> index 92456d7..3475cb7 100644
> --- a/drivers/staging/android/logger.c
> +++ b/drivers/staging/android/logger.c
> @@ -93,20 +93,24 @@ static inline struct logger_log *file_get_log(str=
uct file *file)
> =A0* get_entry_len - Grabs the length of the payload of the next entr=
y starting
> =A0* from 'off'.
> =A0*
> + * An entry length is 2 bytes (16 bits) in host endian order.
> + * In the log, the length does not include the size of the log entry=
 structure.
> + * This function returns the size including the log entry structure.
> + *
> =A0* Caller needs to hold log->mutex.
> =A0*/
> =A0static __u32 get_entry_len(struct logger_log *log, size_t off)
> =A0{
> =A0 =A0 =A0 =A0__u16 val;

Could using a union here make things look a little cleaner in the meat
of the function? Something like

union {
    __u16 s;
    __u8 b[2];
} val;

>
> - =A0 =A0 =A0 switch (log->size - off) {
> - =A0 =A0 =A0 case 1:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 memcpy(&val, log->buffer + off, 1);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 memcpy(((char *) &val) + 1, log->buffer=
, 1);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> - =A0 =A0 =A0 default:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 memcpy(&val, log->buffer + off, 2);
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 /* copy 2 bytes from buffer, in memcpy order, */
> + =A0 =A0 =A0 /* handling possible wrap at end of buffer */
> +
> + =A0 =A0 =A0 ((__u8 *)&val)[0] =3D log->buffer[off];
> + =A0 =A0 =A0 if (likely(off+1 < log->size))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((__u8 *)&val)[1] =3D log->buffer[off+1=
];

spaces around the + in 'off+1' in the above two lines.

> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((__u8 *)&val)[1] =3D log->buffer[0];
>
> =A0 =A0 =A0 =A0return sizeof(struct logger_entry) + val;
> =A0}
> --
> 1.7.2.3
>
