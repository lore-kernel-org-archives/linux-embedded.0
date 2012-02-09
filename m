From: Dima Zavin <dima@android.com>
Subject: Re: [PATCH 4/5] logger: clarify code in clock_interval
Date: Wed, 8 Feb 2012 22:09:52 -0800
Message-ID: <CAPz4a6DpEUN_0wHdLdDT3fxmFr3j38sMn379+0hMFTdWRFDcFw@mail.gmail.com>
References: <4F31DC31.6040303@am.sony.com>
	<4F31DEA2.7000702@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=gamma;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding:x-system-of-record;
        bh=A6Iq41ch5+jJ/DPPQ7XX0/o3mLnfm8xA7q4UFFDX89w=;
        b=KA6XVB9kQJc6GYxZCNNp2tLYHS7DcvoH5CVGcJMRCNoZ0iZCFVFS/Vv+53yYtU+feu
         O+27iuQh2F55Eq9ej3VGM8eJf/tlo1pGN/uGQedNXLhFaw7+ihOSTRXWqqGNU7xTcBnR
         4H/KftmE3qku3SWlcq+nje8HMfu7cEpjLgnDE=
In-Reply-To: <4F31DEA2.7000702@am.sony.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Brian Swetland <swetland@google.com>, Andrew Morton <akpm@osdl.org>

To be honest, i don't find the new logic code much different or
cleaner than the old code. I think just documenting (as well as the
function rename) as you've done without inverting the logic would be
sufficient. The ascii art helps immensely.

--Dima

On Tue, Feb 7, 2012 at 6:32 PM, Tim Bird <tim.bird@am.sony.com> wrote:
> Add commentary, rename the function and make the code easier to read.
>
> Signed-off-by: Tim Bird <tim.bird@am.sony.com>
> ---
> =A0drivers/staging/android/logger.c | =A0 28 ++++++++++++++++++++----=
----
> =A01 files changed, 20 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/staging/android/logger.c b/drivers/staging/andro=
id/logger.c
> index 54b7cdf..8d9d4f1 100644
> --- a/drivers/staging/android/logger.c
> +++ b/drivers/staging/android/logger.c
> @@ -242,16 +242,28 @@ static size_t get_next_entry(struct logger_log =
*log, size_t off, size_t len)
> =A0}
>
> =A0/*
> - * clock_interval - is a < c < b in mod-space? Put another way, does=
 the line
> - * from a to b cross c?
> + * is_between - is a < c < b, accounting for wrapping of a, b, and c
> + * =A0 =A0positions in the buffer
> + *
> + * That is, if a<b, check for c between a and b
> + * and if a>b, check for c outside (not between) a and b
> + *
> + * |------- a xxxxxxxx b --------|
> + * =A0 =A0 =A0 =A0 =A0 =A0 =A0 c^
> + *
> + * |xxxxx b --------- a xxxxxxxxx|
> + * =A0 =A0c^
> + * =A0or =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0c^
> =A0*/
> -static inline int clock_interval(size_t a, size_t b, size_t c)
> +static inline int is_between(size_t a, size_t b, size_t c)
> =A0{
> - =A0 =A0 =A0 if (b < a) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (a < c || b >=3D c)
> + =A0 =A0 =A0 if (a < b) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* is c between a and b? */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (a < c && c <=3D b)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 1;
> =A0 =A0 =A0 =A0} else {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (a < c && b >=3D c)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* is c outside of b through a? */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (c <=3D b || a < c)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 1;
> =A0 =A0 =A0 =A0}
>
> @@ -272,11 +284,11 @@ static void fix_up_readers(struct logger_log *l=
og, size_t len)
> =A0 =A0 =A0 =A0size_t new =3D logger_offset(log, old + len);
> =A0 =A0 =A0 =A0struct logger_reader *reader;
>
> - =A0 =A0 =A0 if (clock_interval(old, new, log->head))
> + =A0 =A0 =A0 if (is_between(old, new, log->head))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0log->head =3D get_next_entry(log, log-=
>head, len);
>
> =A0 =A0 =A0 =A0list_for_each_entry(reader, &log->readers, list)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (clock_interval(old, new, reader->r_=
off))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (is_between(old, new, reader->r_off)=
)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reader->r_off =3D get_=
next_entry(log, reader->r_off, len);
> =A0}
>
> --
> 1.7.2.3
>
