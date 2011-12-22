From: Kay Sievers <kay.sievers@vrfy.org>
Subject: Re: RFC: android logger feedback request
Date: Thu, 22 Dec 2011 05:36:02 +0100
Message-ID: <CAPXgP13T1vTJjQvzhPLt48_8P5LNKgyVSQxvFtjXmVPX0pH=yQ@mail.gmail.com>
References: <4EF264C3.6000104@am.sony.com> <20111221231956.GB23859@suse.de>
 <4EF27B85.9080801@am.sony.com> <20111222122026.3a0fae36@notabene.brown>
 <CANqkERC+mdSGxk4tiU7+dbauSXqqANN+Z+TTb_pVXoPq+k=rJg@mail.gmail.com> <20111222034953.GC14174@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrfy.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=bkIhDuLgUbgu4No+Ckc4tZP8V5Tw19ae6hfrshgqtHs=;
        b=PKWp2+j+Xy/n1dOuUn1xUJCoEZCiLF3lzmN9XorIrPB0UMwD4YSZpgX3+1W6N8xaE4
         YC26r00lb+2mN0alFA0dZTmY0uDZzvo/LmDf321sCwpZtCAaSHamV+F5AArpYV4RcyA9
         CMBiYK+z/xGetKP3ZU7GOxVKePg3KBgB7YfXw=
In-Reply-To: <20111222034953.GC14174@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Greg KH <gregkh@suse.de>
Cc: Brian Swetland <swetland@google.com>, NeilBrown <neilb@suse.de>, Tim Bird <tim.bird@am.sony.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, john stultz <johnstul@us.ibm.com>, Lennart Poettering <lennart@poettering.net>

On Thu, Dec 22, 2011 at 04:49, Greg KH <gregkh@suse.de> wrote:
> On Wed, Dec 21, 2011 at 06:34:08PM -0800, Brian Swetland wrote:
>> The goals behind the logger driver have been:
>> - keep userland and kernel logging separate (so that spammy userland
>> logging doesn't make us lose critical kernel logs or the other way
>> round)
>
> Wouldn't a simple userspace daemon solve this, writing the data to a
> ramfs file?

That's what the systemd journal does in /run when /var is not writable
or the /var/log/journal directory does not exist. All just lands on a
tmpfs until the next reboot. The journal database just acts as a
ringbuffer on a filesystem.

>> - make log writing very inexpensive -- avoid having to pass messages
>> between processes (more critical on ARM9 platforms where this implie=
d
>> extra cache flushing), avoid having to make several syscalls to writ=
e
>> a log message (getting time of day, etc), and so on
>
> ramfs?

The receiver gets almost all of this from the socket with
SCM_TIMESTAP, and SCM_CREDENTIALS. Needed stuff can be added in a
similar way. This is trusted, reliable and pretty cheap to retrieve
data.

>> - make log writing reliable -- don't trust userland to report its
>> timestamp, PID, or to correctly format the datagrams, etc
>
> existing userspace printk tty driver?

Sockets provide all that today already in a trusted way.

>> - allow a log watching process (logcat) to easily pull data from all
>> logs at once
>
> what do you mean by "at once"?

/proc/kmsg provides that today, which is basically just a file wrapper
around the kernel's (misleadingly named) syslog() call.

>> - avoid committing a vast amount of memory to logging
>
> memory where, in code or in the data being logged?
>
>> - try to prevent clients from spamming each other out of log space
>> (only successful on a coarse granularity right now with the
>> main/system/radio/events logs)
>> - ensure logs are not lost at the moment an app crashes
>
> Which logs?

Things need rate limits and quota based on the remaining buffer or
disk space. The systemd journal maintains a separate journal for every
login-uid, so every logged in user gets his own journal database,
which can not overflow the systems database or the databases of the
other users.

Every user can log to the journal, but only the journal daemon can
write to the databases. The user can directly read back its own
journal database, but not write it.

>> On one hand, having each app (per PID) be able to create their own
>> logs up to a specified size limit could be really useful and is
>> something we've kicked around -- for one it would allow us to avoid
>> the ever present request from userspace developers to increase the l=
og
>> size because of too much log spam ("reduce log spam" never seems to =
be
>> an answer that makes them happy) -- but we haven't come up with a
>> reasonable plan for dealing with "well if we allow 16KB of log per a=
pp
>> and the user installs 100 apps, they may be pinning up to 1.6MB of r=
am
>> worst case", and so on.
>
> I think the userspace printk and syslog might already handle most of
> this today. =C2=A0Tim, care to look into that and see if it does or n=
ot?

It's very simple what we have here in the kernel, and if syslog
facility prefixes are used, it can probably replace most of the
Android log solution just fine. We can not really protect one store to
flush the entire buffer though, that's what the 4 separated stores can
easily provide.

But as mentioned, I think we want the ability to work with structured
data, which both kernel tools are incapable of.

Kay
