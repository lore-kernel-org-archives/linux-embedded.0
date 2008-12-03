From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Subject: Re: LZMA inclusion
Date: Wed, 3 Dec 2008 22:28:12 +0100
Message-ID: <20081203212812.GG8563@mx.loc>
References: <492BA3FA.9010204@openwrt.org> <4936DFCD.2010204@am.sony.com> <20081203195852.GB8563@mx.loc> <20081203202009.GA6790@uranus.ravnborg.org> <20081203204540.GD8563@mx.loc> <20081203211617.GB7255@uranus.ravnborg.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=XYnpP2stLypDXGQ7/NsWEuCYitTYMAUOpBo0mLRihyI=;
        b=UjR8v+c8kDFudplnTwoCfui1kMHkCkW2J3aQIznheqBdbGOvGEEnbeYV78cbCpsx69
         QDn/NuINhRZFbVjghU0oDuWmrzk3NzN16k/MWOB5ul8NwScnUzCvdyDVB9JSX9KSp3KD
         MBX+RlgK6r/Ua3BMalvistM1qqDEP1mX1QC+o=
Content-Disposition: inline
In-Reply-To: <20081203211617.GB7255@uranus.ravnborg.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Tim Bird <tim.bird@am.sony.com>, lasse.collin@tukaani.org, glp@openwrt.org, linux-embedded@vger.kernel.org

On Wed, Dec 03, 2008 at 10:16:17PM +0100, Sam Ravnborg wrote:
>> 
>> PS: Not sure if you, Sam, are the right person who cares for it, but
>> i think that the help-text and actual accepted arguments of
>> scripts/kconfig/lxdialog/check-lxdialog.sh are out of sync.
>I queued up the following:

Thanks alot.
>
>> PPS: I did not verify if this is still the case, but I have this
>> comment as a reminder for a small issue with "archprepare" versus
>> headers_install, fwiw. It would be very handy if i could fuse those
>> two into a simple "make ... archprepare headers_install":
>
>Which architectures needs this archprepare?

At least cris tripped this IIRC, at least before or around the time
when cris's subarch handling was fixed (the asm-cris/arch-v10 vs.
arch-v32 linking issue).

>It would be good to get rid of the dependency.

nod

>PS. I consider archprepare an internal target.
>If some preparation is needed the recommended target is 'prepare'.
>The day no targets has any special things they need to do archprepare will die.

The proper solution would perhaps be to do have prepare or archprepare
as a prerequisite of headers_install as long as those are needed, i guess.

I as a user don't want to be bothered with this mere implementation detail
in the first place, yes.
