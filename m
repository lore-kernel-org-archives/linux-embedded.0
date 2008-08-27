From: "Parag Warudkar" <parag.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c - bisected
Date: Tue, 26 Aug 2008 22:36:59 -0400
Message-ID: <f7848160808261936m18c69dc0r26f41850efae4b91@mail.gmail.com>
References: <mzBsPw3QUOF.A.87F.wZGsIB@albercik>
	 <alpine.LFD.1.10.0808261019450.3363@nehalem.linux-foundation.org>
	 <20080826183051.GB10925@cs181140183.pp.htv.fi>
	 <alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org>
	 <20080826205916.GB11734@cs181140183.pp.htv.fi>
	 <alpine.LFD.1.10.0808261403360.3363@nehalem.linux-foundation.org>
	 <f7848160808261554j2f4eaaa6i1ee8801ae75ca7bf@mail.gmail.com>
	 <alpine.LFD.1.10.0808261644260.3363@nehalem.linux-foundation.org>
	 <f7848160808261758q7b84aab1m188c1ebb59304818@mail.gmail.com>
	 <alpine.LFD.1.10.0808261837530.3363@nehalem.linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=sZkoO1up7EucoxfTnYcG5N4Mt5RUronR0KPw9SmeIwA=;
        b=JApIo0ftV81moMYj+3uyu9PJJ6xSuqnevjkhbEoBNZHeBpfqE+diC37aSNv7otx2I4
         JRdVF5xpKP3P5r4uyspdDUHAiczQfCmjsjWn6lTIrAp2V7n6uQy9RX3wRARg0/VkBGMf
         h1c9bHELDHwDxH9pMK2NuUf1MIUMybL3DGhfk=
In-Reply-To: <alpine.LFD.1.10.0808261837530.3363-nfNrOhbfy2R17+2ddN/4kux8cNe9sq/dYPYVAmT7z5s@public.gmane.org>
Content-Disposition: inline
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Adrian Bunk <bunk-HeJ8Db2Gnd6zQB+pC5nmwQ@public.gmane.org>, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, "Alan D. Brunelle" <Alan.Brunelle-VXdhtT5mjnY@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kernel Testers List <kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arjan van de Ven <arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, Aug 26, 2008 at 9:49 PM, Linus Torvalds
<torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org> wrote:
>
>
> On Tue, 26 Aug 2008, Parag Warudkar wrote:
>>
>> And although you said in your later reply that Linux x86 with 4K
>> stacks should be more than usable - my experiences running a untainted
>> desktop/file server with 4K stack have been always disastrous XFS or
>> not.  It _might_ work for some well defined workloads but you would
>> not want to risk 4K stacks otherwise.
>
> Umm. How long?
>

IIRC the last I tried 4K stacks with x86 was on 2.6.21 - Fedora 7
kernel, around June 07 time frame.
The oops included a ugly and long call trace that I still remember.

> And a lot of the cases of us
> having structures on the stack is actually not worth it, and tends to be
> about being lazy rather than anything else.

What about deep call chains? The problem with the uptake of 4K stacks
seems to be that is not reliably provable that it will work under all
circumstances.

Parag
