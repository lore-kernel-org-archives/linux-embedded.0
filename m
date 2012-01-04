From: Geunsik Lim <leemgs1@gmail.com>
Subject: Re: RFC: android logger feedback request
Date: Thu, 5 Jan 2012 00:34:27 +0900
Message-ID: <CABiHV1QUR6vc5fnm5+YVKiYVX2UF-VFS7ZKTa=7FAFtikbHKrg@mail.gmail.com>
References: <4EF264C3.6000104@am.sony.com>
	<20111228163925.6c37df26.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=e4uu4fCquWcMQwA8JqHfGdsaTEGyI8LrGMJExJvkamY=;
        b=aB4nb0we6T9Ut/C93aOIbTJ16/tJzWPfZIgxXSPANDiMBm8JOZ3iiS26/gNGhQYjOJ
         Z+5cFaGRzJ6rRUsTnpoDekbk/qeTSZHqQDB4t+Ed2PsMDfKTGlKt7+krj+MbbXzc58sG
         9bBE9ASt4cOlStRvfRPx1Uxcq5u73wRLZYm/s=
In-Reply-To: <20111228163925.6c37df26.akpm@linux-foundation.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Tim Bird <tim.bird@am.sony.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, john stultz <johnstul@us.ibm.com>, Greg KH <gregkh@suse.de>, Brian Swetland <swetland@google.com>

On Thu, Dec 29, 2011 at 9:39 AM, Andrew Morton
<akpm@linux-foundation.org> wrote:
> On Wed, 21 Dec 2011 14:59:15 -0800
> Tim Bird <tim.bird@am.sony.com> wrote:
>
>> Hi all,
>>
>> I'm looking for feedback on the Android logger code,
>
> The code looks nice.
>
>>
>> ...
>>
>> +/* logger_offset - returns index 'n' into the log via (optimized) m=
odulus */
>> +#define logger_offset(n) =C2=A0 =C2=A0 ((n) & (log->size - 1))
>> +
>
> This macro depends upon the presence of a local variable called "log"
> and is therefore all stinky. =C2=A0Pass "log" in as an arg and conver=
t it to
> a regular C function.
>
>>
>> ...
>>
>> +/*
>> + * get_entry_len - Grabs the length of the payload of the next entr=
y starting
>> + * from 'off'.
>> + *
>> + * Caller needs to hold log->mutex.
>> + */
>> +static __u32 get_entry_len(struct logger_log *log, size_t off)
>> +{
>> + =C2=A0 =C2=A0 __u16 val;
>> +
>> + =C2=A0 =C2=A0 switch (log->size - off) {
>> + =C2=A0 =C2=A0 case 1:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(&val, log->buffer=
 + off, 1);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(((char *) &val) +=
 1, log->buffer, 1);
>
> So numbers in the buffer are in host endian order. =C2=A0That's worth
> capturing in a comment somewhere.
>
> There must be a way of doing the above more neatly, using
> log->buffer[off] and log->buffer[0]. =C2=A0Perhaps using
> include/linux/unaligned/packed_struct.h.
>
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>> + =C2=A0 =C2=A0 default:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(&val, log->buffer=
 + off, 2);
>
> get_unaligned()
>
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 return sizeof(struct logger_entry) + val;
>> +}
>> +
>>
>> ...
>>
>> +static ssize_t logger_read(struct file *file, char __user *buf,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0size_t count, loff_t *pos)
>> +{
>> + =C2=A0 =C2=A0 struct logger_reader *reader =3D file->private_data;
>> + =C2=A0 =C2=A0 struct logger_log *log =3D reader->log;
>> + =C2=A0 =C2=A0 ssize_t ret;
>> + =C2=A0 =C2=A0 DEFINE_WAIT(wait);
>> +
>> +start:
>> + =C2=A0 =C2=A0 while (1) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prepare_to_wait(&log->wq=
, &wait, TASK_INTERRUPTIBLE);
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_lock(&log->mutex);
>
> If mutex_lock() had to wait for the mutex, it will return in state
> TASK_RUNNING, thus rubbing out the effects of prepare_to_wait(). =C2=A0=
We'll
> just loop again so this is a benign buglet.
>
> Could we lose a wakeup by running prepaer_to_wait() outside the lock?
> I don't think so, but I stopped thinking about it when I saw the abov=
e
> bug. =C2=A0These two lines should be switched around.
>
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D (log->w_off =3D=3D=
 reader->r_off);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&log->mutex=
);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ret)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (file->f_flags & O_NO=
NBLOCK) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D -EAGAIN;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (signal_pending(curre=
nt)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D -EINTR;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 schedule();
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 finish_wait(&log->wq, &wait);
>> + =C2=A0 =C2=A0 if (ret)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;
>> +
>> + =C2=A0 =C2=A0 mutex_lock(&log->mutex);
>> +
>> + =C2=A0 =C2=A0 /* is there still something to read or did we race? =
*/
>> + =C2=A0 =C2=A0 if (unlikely(log->w_off =3D=3D reader->r_off)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&log->mutex=
);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto start;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 /* get the size of the next entry */
>> + =C2=A0 =C2=A0 ret =3D get_entry_len(log, reader->r_off);
>> + =C2=A0 =C2=A0 if (count < ret) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EINVAL;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 /* get exactly one entry from the log */
>> + =C2=A0 =C2=A0 ret =3D do_read_log_to_user(log, reader, buf, ret);
>> +
>> +out:
>> + =C2=A0 =C2=A0 mutex_unlock(&log->mutex);
>> +
>> + =C2=A0 =C2=A0 return ret;
>> +}
>> +
>>
>> ...
>>
>> +/*
>> + * clock_interval - is a < c < b in mod-space? Put another way, doe=
s the line
>> + * from a to b cross c?
>> + */
>
> This is where my little brain started to hurt. =C2=A0I assume it's co=
rrect ;)
>
>> +static inline int clock_interval(size_t a, size_t b, size_t c)
>> +{
>> + =C2=A0 =C2=A0 if (b < a) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (a < c || b >=3D c)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return 1;
>> + =C2=A0 =C2=A0 } else {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (a < c && b >=3D c)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return 1;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 return 0;
>> +}
>
> The explicit inline(s) are increaseingly old-fashioned. =C2=A0gcc is =
good
> about this now.
>
>>
>> ...
>>
>> +static ssize_t do_write_log_from_user(struct logger_log *log,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const void __user =
*buf, size_t count)
>> +{
>> + =C2=A0 =C2=A0 size_t len;
>> +
>> + =C2=A0 =C2=A0 len =3D min(count, log->size - log->w_off);
>> + =C2=A0 =C2=A0 if (len && copy_from_user(log->buffer + log->w_off, =
buf, len))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EFAULT;
>> +
>> + =C2=A0 =C2=A0 if (count !=3D len)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (copy_from_user(log->=
buffer, buf + len, count - len))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return -EFAULT;
>
> Is it correct to simply return here without updating ->w_off?
> We've just copied "len" bytes in from userspace.
>
>> + =C2=A0 =C2=A0 log->w_off =3D logger_offset(log->w_off + count);
>> +
>> + =C2=A0 =C2=A0 return count;
>> +}
>> +
>> +/*
>> + * logger_aio_write - our write method, implementing support for wr=
ite(),
>> + * writev(), and aio_write(). Writes are our fast path, and we try =
to optimize
>> + * them above all else.
>> + */
>> +ssize_t logger_aio_write(struct kiocb *iocb, const struct iovec *io=
v,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long nr_segs, loff_t ppos)
>> +{
>> + =C2=A0 =C2=A0 struct logger_log *log =3D file_get_log(iocb->ki_fil=
p);
>> + =C2=A0 =C2=A0 size_t orig =3D log->w_off;
>> + =C2=A0 =C2=A0 struct logger_entry header;
>> + =C2=A0 =C2=A0 struct timespec now;
>> + =C2=A0 =C2=A0 ssize_t ret =3D 0;
>> +
>> + =C2=A0 =C2=A0 now =3D current_kernel_time();
>> +
>> + =C2=A0 =C2=A0 header.pid =3D current->tgid;
>> + =C2=A0 =C2=A0 header.tid =3D current->pid;
>
> hm, I thought task_struct.pid was the pid.
It's right.
>
> Also, pids are not unique system-wide. =C2=A0If the user is using PID
I think that this code is  correct because  current->tgid means
process id of user-space
and current->pid means thread id of user-space actually.  Is it not mak=
e sense?

> namespaces then the logs will contain what may be fatally confusing d=
uplicates.
> This needs to be fixed, I expect.
header.tid as a thread id of user-space is unique system-wide at least
although header.pid is not unqueue system-wide.
Why should we think/understand  that the logs contain duplicated
information to users
who run logcat command for collecting and viewing system debug output?
Thanks.
>
> There are broader namespace issues which should be thought about. =C2=
=A0Does
> it make sense for readers in one container to be returned logs from a
> different container? =C2=A0Perhaps the do-it-via-a-filesystem proposa=
ls can
> address this.
>
>> + =C2=A0 =C2=A0 header.sec =3D now.tv_sec;
>> + =C2=A0 =C2=A0 header.nsec =3D now.tv_nsec;
>> + =C2=A0 =C2=A0 header.len =3D min_t(size_t, iocb->ki_left, LOGGER_E=
NTRY_MAX_PAYLOAD);
>> +
>> + =C2=A0 =C2=A0 /* null writes succeed, return zero */
>> + =C2=A0 =C2=A0 if (unlikely(!header.len))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>> +
>> + =C2=A0 =C2=A0 mutex_lock(&log->mutex);
>> +
>> + =C2=A0 =C2=A0 /*
>> + =C2=A0 =C2=A0 =C2=A0* Fix up any readers, pulling them forward to =
the first readable
>> + =C2=A0 =C2=A0 =C2=A0* entry after (what will be) the new write off=
set. We do this now
>> + =C2=A0 =C2=A0 =C2=A0* because if we partially fail, we can end up =
with clobbered log
>> + =C2=A0 =C2=A0 =C2=A0* entries that encroach on readable buffer.
>> + =C2=A0 =C2=A0 =C2=A0*/
>> + =C2=A0 =C2=A0 fix_up_readers(log, sizeof(struct logger_entry) + he=
ader.len);
>> +
>> + =C2=A0 =C2=A0 do_write_log(log, &header, sizeof(struct logger_entr=
y));
>> +
>> + =C2=A0 =C2=A0 while (nr_segs-- > 0) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssize_t nr;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* figure out how much o=
f this vector we can keep */
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D min_t(size_t, io=
v->iov_len, header.len - ret);
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* write out this segmen=
t's payload */
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nr =3D do_write_log_from=
_user(log, iov->iov_base, len);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlikely(nr < 0)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 log->w_off =3D orig;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 mutex_unlock(&log->mutex);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return nr;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iov++;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D nr;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 mutex_unlock(&log->mutex);
>> +
>> + =C2=A0 =C2=A0 /* wake up any blocked readers */
>> + =C2=A0 =C2=A0 wake_up_interruptible(&log->wq);
>> +
>> + =C2=A0 =C2=A0 return ret;
>> +}
>> +
>>
>> ...
>>
>> +static int logger_release(struct inode *ignored, struct file *file)
>> +{
>> + =C2=A0 =C2=A0 if (file->f_mode & FMODE_READ) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct logger_reader *re=
ader =3D file->private_data;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 list_del(&reader->list);
>
> locking for reader->list?
>
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(reader);
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 return 0;
>> +}
>>
>> ...
>>
>> +static long logger_ioctl(struct file *file, unsigned int cmd, unsig=
ned long arg)
>
> ew...
>
>> +static struct logger_log *get_log_from_minor(int minor)
>> +{
>> + =C2=A0 =C2=A0 if (log_main.misc.minor =3D=3D minor)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &log_main;
>> + =C2=A0 =C2=A0 if (log_events.misc.minor =3D=3D minor)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &log_events;
>> + =C2=A0 =C2=A0 if (log_radio.misc.minor =3D=3D minor)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &log_radio;
>> + =C2=A0 =C2=A0 if (log_system.misc.minor =3D=3D minor)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &log_system;
>> + =C2=A0 =C2=A0 return NULL;
>> +}
>
> ew...
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
> Please read the FAQ at =C2=A0http://www.tux.org/lkml/



--=20
Best regards,
Geunsik Lim, Samsung Electronics
Homepage: http://leemgs.fedorapeople.org
-----------------------------------------------------------------------
To unsubscribe from this list: send the line "unsubscribe linux-kernel"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at=C2=A0 http://vger.kernel.org/majordomo-info.html
Please read the FAQ at=C2=A0 http://www.tux.org/lkml/
-----------------------------------------------------------------------
