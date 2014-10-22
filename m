From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: Why is the deferred initcall patch not mainline?
Date: Wed, 22 Oct 2014 02:49:23 -0700
Message-ID: <54477DA3.3040605@gmail.com>
References: <5441F592.6090807@gmail.com> <nngd3gtlr4ltyk2mo7p2sn30.1413619885726@email.android.com> <CACxGe6s7rdYn+7HgWC1SkZ26v97YhmO04pv3SZJk00BtehAPqQ@mail.gmail.com>,<alpine.LFD.2.11.1410211230500.6969@knanqh.ubzr> <F5184659D418E34EA12B1903EE5EF5FD01BCD433E681@seldmbx02.corpusers.net>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=7iPkviT6oxD+Ql4Dxcg+yTFLkGb/Ib30kGqsG407ElQ=;
        b=c9R6mHGoY+qNAbavZfKVb2KqZxd9rU5BGDeJ8rZkhnwQUtuqACENfUZMGdcx5Nu+by
         us8BFbmSkwjlKGgiNFGfWUynJSOwTG5p/Vb+6BewGWHEhpax9789ARs5xSD5658mdhZG
         cpIxK5LkrKGqriHMFRFF51pB0rxX78DBj67LdTCoYYwYC0DhxnvkUOEaKY7xTG5WKzmP
         fWNED5UivBMcuXIh69CyCnvPAl3tkx3Ui2nY8WcdmTMRYEFb9qkaGb4+WcQzebRtrjsU
         EJmbf3f3vFkuBsldCMmWpjpwKWw3OotIlyFkiJfrjNpxHcELEdXVqOL2k8FmSTRzmgJe
         h3ew==
In-Reply-To: <F5184659D418E34EA12B1903EE5EF5FD01BCD433E681@seldmbx02.corpusers.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Bird, Tim" <Tim.Bird@sonymobile.com>
Cc: Nicolas Pitre <nico@fluxnic.net>, Grant Likely <grant.likely@secretlab.ca>, Borislav Petkov <bp@alien8.de>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dirk Behme <dirk.behme@gmail.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, "tim.bird@am.sony.com" <tim.bird@am.sony.com>

On 10/21/2014 12:37 PM, Bird, Tim wrote:

< snip >

> With regards to doing it dynamically, I'd have to think about how
> to do that.  Having text-based lists of things to do at runtime seems
> to fit with how we're using device tree these days, but I'm not sure
> how that would work.

Initcall function names are not available without KALLSYMS.  That
dependency would increase kernel size.  So "text based" does not
seem too good.

Of course, if you are creating a "text based list" at compile time,
a macro could easily convert an init function text name to the
function pointer that is used in do_initcall_level().  Thus you
would have a not so large list of function pointers.

< snip >

-Frank
