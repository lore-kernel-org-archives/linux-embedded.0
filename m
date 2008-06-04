From: Bernhard Fischer <rep.dot.nop@gmail.com>
Subject: Re: [PATCH] console - Add configurable support for console charset
	translation
Date: Wed, 4 Jun 2008 21:42:30 +0200
Message-ID: <20080604194230.GE27768@mx.loc>
References: <48447615.5050806@am.sony.com> <20080604103353.GC27335@cs181133002.pp.htv.fi> <4846E44A.1010601@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=t83a8+iZOiWPcV/QR8VBLk0Q73qKE0Xro8fDpOav0q0=;
        b=jgT8NtyusOavlgKBYiziAzMvhqnFUbNkennLa/K5ce4gTUhMyKcvaMzs3JdTUUiv4A
         +SJZBwjziK10TAfcGpQmmJyFFkcaudwOEq41AJaE52b5KIMsWUMct4X79jgRFCaX7QeW
         KWtHx+6zEORtXeIkYRM/7nk7nVkRH0l5dYoho=
Content-Disposition: inline
In-Reply-To: <4846E44A.1010601@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Adrian Bunk <adrian.bunk@movial.fi>, linux-tiny <Linux-tiny@selenic.com>, linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>

On Wed, Jun 04, 2008 at 11:51:54AM -0700, Tim Bird wrote:

>There are diminishing returns here, and at some point it doesn't make
>sense to continue.  I have a nagging feeling, though, that there
>are a few more things where the bloat is pronounced (glances at
>procfs and sysfs).

A decision on what to favour would certainly help: sysfs or ioctl or
something else.

While i have missed that in this particular case=B9) you apparently sha=
ll
read via sysfs and write via ioctl -- i thought that most could already
be written via sysfs which doesn't seem to be true -- it would be nice
to get rid of the devilish ioctl mid-term iff there is consensus about
it. The bridge is admittedly a vicarious corner case and probably
seldomly used anyway.

=B9)
https://lists.linux-foundation.org/pipermail/bridge/2008-May/005839.htm=
l
--
To unsubscribe from this list: send the line "unsubscribe linux-embedde=
d" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
