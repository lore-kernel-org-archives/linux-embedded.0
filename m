From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: [PATCH, RFC] panic-note: Annotation from user space for panics
Date: Tue, 17 Nov 2009 07:45:43 -0800
Message-ID: <m1pr7hf93s.fsf@fess.ebiederm.org>
References: <20091112021322.GA6166@dvomlehn-lnx2.corp.sa.net>
	<4AFC4D31.2000101@gmail.com>
	<20091112215649.GA28349@dvomlehn-lnx2.corp.sa.net>
	<20091113091031.3f6d4bba@marrow.netinsight.se>
	<1258112748.21596.1227.camel@localhost> <4AFE6A14.4010507@gmail.com>
	<1258447997.27437.76.camel@localhost>
	<2ea1731b0911170445x13225c19w797388d2211de2d9@mail.gmail.com>
	<1258463404.27437.103.camel@localhost>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755093AbZKQPpr@vger.kernel.org>
In-Reply-To: <1258463404.27437.103.camel@localhost> (Artem Bityutskiy's message of "Tue\, 17 Nov 2009 15\:10\:04 +0200")
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dedekind1@gmail.com
Cc: Marco Stornelli <marco.stornelli@gmail.com>, Simon Kagstrom <simon.kagstrom@netinsight.net>, David VomLehn <dvomlehn@cisco.com>, linux-embedded@vger.kernel.org, akpm@linux-foundation.org, dwm2@infradead.org, linux-kernel@vger.kernel.org, mpm@selenic.com, paul.gortmaker@windriver.com

Artem Bityutskiy <dedekind1@gmail.com> writes:

> On Tue, 2009-11-17 at 13:45 +0100, Marco Stornelli wrote:
>> 2009/11/17 Artem Bityutskiy <dedekind1@gmail.com>:
>> > Take a look at my mails where I describe different complications we have
>> > in our system. We really want to have an OOPS/panic + our environment
>> > stuff to go together, at once. This makes things so much simpler.
>> >
>> > Really, what is the problem providing this trivial panic-note
>> > capability, where user-space can give the kernel a small buffer, and ask
>> > the kernel to print this buffer at the oops/panic time. Very simple and
>> > elegant, and just solves the problem.
>> >
>> > Why perversions with time-stamps, separate storages are needed?
>> >
>> > IOW, you suggest a complicated approach, and demand explaining why we do
>> > not go for it. Simply because it is unnecessarily complex.
>> 
>> I don't think it's a complicated approach we are talking of a system
>> log like syslog with a temporal information, nothing more.
>
> We need to store this information of NAND flash. Implementing logs on
> NAND flash is about handling bad blocks, choosing format of records, and
> may be even handling wear-levelling. This is not that simple.
>
> And then I have match oops to the userspace environment prints, using I
> guess timestamps, which is also about complications in userspace.
>
>> > This patch solves the problem gracefully, and I'd rather demand you to point what
>> > is the technical problem with the patches.
>> >
>> 
>> Simply because I think that we should avoid to include in the kernel
>> things we can do in a simply way at user space level.
>
> If it is much easier to have in the kernel, then this argument does not
> work, IMHO.
>
>>  I think this
>> patch is well done but it's one of the patches that are solutions "for
>> embedded only", but it's only my opinion.
>
> Also IMHO, but having embedded-only things is not bad at all.

Why not use the kdump hook?  If you handle a kernel panic that way
you get enhanced reliability and full user space support.  All in a hook
that is already present and already works.

Eric
