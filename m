From: =?UTF-8?Q?Am=C3=A9rico_Wang?= <xiyou.wangcong@gmail.com>
Subject: Re: [PATCH, RFC] panic-note: Annotation from user space for panics
Date: Wed, 18 Nov 2009 17:01:26 +0800
Message-ID: <2375c9f90911180101i32113c7ev85f4bbeba965fab5@mail.gmail.com>
References: <1258463404.27437.103.camel@localhost>
	 <m1pr7hf93s.fsf@fess.ebiederm.org>
	 <20091117235627.GA13469@dvomlehn-lnx2.corp.sa.net>
	 <m1iqd8ptg9.fsf@fess.ebiederm.org>
	 <20091118005337.GA19374@dvomlehn-lnx2.corp.sa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755144AbZKRJBW@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=9D6v38rhsxxFx2lz+soFWUWCrkSu6ZFLHx7zBOUN8+c=;
        b=pbgOb0BhJXKVuk6Ifq/puNMwO/JRKG5MHALt2Nk/u+yB4qHSTbgLCg2XyTuNVxdifH
         evik6r5TilBlC3nRmob5rlIzs/ptw5HUjdJErrtkWFQDzqXkZUeSqK9S+40EDB/Llfmr
         zLgeK0h2+prHl2ca8ZmRk2TWk9TAx6aCC4wck=
In-Reply-To: <20091118005337.GA19374@dvomlehn-lnx2.corp.sa.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David VomLehn <dvomlehn@cisco.com>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, dedekind1@gmail.com, Marco Stornelli <marco.stornelli@gmail.com>, Simon Kagstrom <simon.kagstrom@netinsight.net>, linux-embedded@vger.kernel.org, akpm@linux-foundation.org, dwm2@infradead.org, linux-kernel@vger.kernel.org, mpm@selenic.com, paul.gortmaker@windriver.com

On Wed, Nov 18, 2009 at 8:53 AM, David VomLehn <dvomlehn@cisco.com> wro=
te:
> On Tue, Nov 17, 2009 at 04:28:22PM -0800, Eric W. Biederman wrote:
>> David VomLehn <dvomlehn@cisco.com> writes:
>>
>> > On Tue, Nov 17, 2009 at 10:45:43AM -0500, Eric W. Biederman wrote:
>> > ...
>> >> Why not use the kdump hook? =C2=A0If you handle a kernel panic th=
at way
>> >> you get enhanced reliability and full user space support. =C2=A0A=
ll in a hook
>> >> that is already present and already works.
> ...
>> > 1. In what ways would this be better than, say, a panic_notifier?
>>
>> A couple of ways.
>>
>> - You are doing the work in a known good kernel instead of the kerne=
l
>> =C2=A0 that just paniced for some unknown reason.
>> - All of the control logic is in user space (not the kernel) so you =
can
>> =C2=A0 potentially do something as simple as "date >> logfile" to ge=
t the
>> =C2=A0 date.
>
> I think I see better what you're suggesting--passing the info to a kd=
ump
> kernel and having it do whatever it wants. I don't think I want to do=
 this,
> but I haven't used any of the kexec() stuff, so I may be missing the =
point.
> Some more context:
>
> My application is an embedded one, and one of the big things I need t=
o do
> after a failure is to bring up a fully functional kernel ASAP. Once I=
 have
> that kernel, I process all of the crash data in user space concurrent=
ly with
> running my main application. Because I'm embedded, I'm very limited i=
n how
> much crash data I can save over a reboot, how much I can store, and h=
ow
> much I can send to a central collection point. This is good, since it=
 doesn't
> take up a lot of resources, but core dumps are out of the question.


I think the problem of kdump is that it uses much memory to hold
the core, i.e. /proc/vmcore, and no way to free it unless using another
reboot. This is why Fedora only does some data-collection in the second
reboot after crash, and then reboots.

I got an idea many days ago, that is providing a way to "delete" /proc/=
vmcore
in the second reboot, so that we can have enough memory to continue wit=
hout
another reboot. I am not sure if Eric likes this? Eric?

>
> As I understand kdump, I would also need to have a second kernel in m=
emory
> to do the kdump work. It wouldn't need to be as big is the kernel tha=
t
> failed, but it would still require a significant amount of memory. On=
 an
> embedded system, the idle memory may be a luxury we can't afford.


You can use only one kernel, as long as it is relocatable.

>
> I think this makes a kdump-based solution difficult, but if it can me=
et
> my requirements, I'd much rather use it (I've been following kdump si=
nce
> it's inception quite a few years ago, but it hasn't seemed a good mat=
ch
> for embedded Linux). Does this still sound like a good match?

What do you think about my idea above? If we had that, would kdump
meet your requirements?


>
>> > 2. Where would you suggest tying in? (Particularly since not all a=
rchitectures
>> > =C2=A0 =C2=A0currently support kdump)
>>
>> No changes are needed kernel side. =C2=A0You just need an appropriat=
e kernel and
>> initrd for your purpose.
>
> I think I must still be missing something. I have dynamic data that I=
 want
> to preserve as I reboot from a failed kernel to a fresh new kernel. B=
y
> the time the fresh kernel starts init, the dynamic data (IP addresses=
, MAC
> addresses) has been re-written with new values. This is why I'm tryin=
g to
> preserve, but I may be running without disk or flash. This patch does=
n't
> preserve the data, but it gets it into the kernel so that it can be
> preserved. At present, I'm preserving the data in a panic_notifier fu=
nction,
> but I am not wedded to that. At present, the data will be copied to a
> section of memory retained across boots, but I know others will want =
to
> write to flash.
>


I believe you can get everything from /proc/vmcore, if you use kexec,
after crash, with some tools like 'crash'.

>> All of the interesting architectures support kexec, and if an
>> architecture doesn't it isn't hard to add. =C2=A0The architecture sp=
ecific
>> part is very simple. =C2=A0A pain to debug initially but very simple=
=2E
>
> I use MIPS processors, and it looks like it is supported. So long as =
it's
> stable, I'm happy to use it.

MIPS seems to have some kexec() support, but after looking at
arch/mips/kernel/machine_kexec.c, maybe the support is still
broken? But anyway, you are welcome to work on it. :)
