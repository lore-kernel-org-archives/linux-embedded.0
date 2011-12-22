From: Kay Sievers <kay.sievers@vrfy.org>
Subject: Re: RFC: android logger feedback request
Date: Thu, 22 Dec 2011 16:13:37 +0100
Message-ID: <CAPXgP12jQg+n=-=R+K8J+5Np97QesoKRApxaRtYvd1Jf-LnhzA@mail.gmail.com>
References: <4EF264C3.6000104@am.sony.com> <4EF27B85.9080801@am.sony.com>
 <20111222122026.3a0fae36@notabene.brown> <201112221459.04701.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrfy.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=WdgaDaI2TF+d0/L8moD28Yd3SuV1do/3zCS9GYgj8xA=;
        b=UVlhI2BOuwXePk2+wCgqmtlG4oZpWERKuxgLI1opNKfWMF9FUAeelKid8r1lJJGYvK
         +ooEoC8IJ3OrEN3qBBSAw1Y/Bhm0cQ/F9qJan3RvSloNtoaYkApvY85+X4iHxLppxJrr
         4b9ca8WrBEihfSdQB2gpk7gp+lrc4XhkNC/fk=
In-Reply-To: <201112221459.04701.arnd@arndb.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Arnd Bergmann <arnd@arndb.de>
Cc: NeilBrown <neilb@suse.de>, Tim Bird <tim.bird@am.sony.com>, Greg KH <gregkh@suse.de>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, john stultz <johnstul@us.ibm.com>, Brian Swetland <swetland@google.com>, Lennart Poettering <lennart@poettering.net>

On Thu, Dec 22, 2011 at 15:59, Arnd Bergmann <arnd@arndb.de> wrote:

> * Remove all kernel code for this and use a user space library togeth=
er
> =C2=A0with tmpfs
> * prepopulate the tmpfs at boot time with all the log buffers in the =
right
> =C2=A0size, and set the maximum file system size so that they cannot =
grow further.
> * Have minimal formatting in the log buffer: A few bytes header (ring=
 buffer
> =C2=A0start and end)
> * Mandate that user space must use mmap and atomic operations to rese=
rve space
> =C2=A0in the log and write to the files.
> * Provide a tool to get the log data out of the buffer again in a rac=
e-free way.
>
> Since any program that is allowed to write to the buffer can overwrit=
e all
> existing information in it anyway, I think we don't actually need any=
 kernel
> help in maintaining consistency of the contents either -- the reader =
will
> simply discard any data. The main thing we would not be able to guara=
ntee
> without kernel help is proving the origin of individual messages, but=
 I'm
> not sure if that is a design goal.

I'm very sure you want rate limiting, global sequence numbers and
trusted properties added to the log.

I can imagine that the kernel provides a single character device,
instantiates a tmpfs mountpoint and splits all stuff that travels into
that device into several files (ring buffers) in the tmpfs filesystem.
The files are probably just split by the uid of the incoming message
sender, which maps to an app at Android.

Only the character device would be able to write to the file, but the
user with the matching uid can read its own file back directly from
tmpfs.

I'm very convinced that we should not design a logging system today,
where we give the ownership of the data to the actual untrusted
process that logs.

The current kmsg buffer could just be one additional file in this tmpfs=
 mount.

Kay
