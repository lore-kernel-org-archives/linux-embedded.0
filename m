From: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: cross-compiling alternatives
Date: Mon, 16 Jun 2008 09:31:14 +0200
Message-ID: <87zlplj0ot.fsf@macbook.be.48ers.dk>
References: <1209577322.25560.402.camel@pmac.infradead.org>
	<200806130843.05704.neundorf@eit.uni-kl.de>
	<1213346316.17853.28.camel@tara.firmix.at>
	<200806131106.18487.neundorf@eit.uni-kl.de>
	<1213351433.17853.61.camel@tara.firmix.at>
	<20080613151634.GJ11760@nibiru.local>
	<1213382709.17853.79.camel@tara.firmix.at>
	<20080616040854.GG12962@nibiru.local>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:to:cc:subject
         :references:from:date:in-reply-to:message-id:user-agent:mime-version
         :content-type:sender;
        bh=EutCtyXtxyDVRov+UDsNKlmdFpddPShoyGmPh2MBX9M=;
        b=jHjVrvsXa2GBjeOak8iw/GUKa+dhQW4aoJpE+jw1xqf23zj1B6ev89USHxWdovmnnG
         1NWpew2ro7vUui1dU+Vuoho2t0ZCCsfkZiiL4RV1h6oZhHkqdRZYZTPtSjGk+/7+lSA3
         dDQlMlu/xVaT3Ejj3Kzbbg+rUzmGwfxr7vuec=
In-Reply-To: <20080616040854.GG12962@nibiru.local> (Enrico Weigelt's message of "Mon\, 16 Jun 2008 06\:08\:54 +0200")
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weigelt@metux.de
Cc: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

>>>>> "Enrico" == Enrico Weigelt <weigelt@metux.de> writes:

Hi,

 Enrico> * Bernd Petrovitsch <bernd@firmix.at> schrieb:
 >> > Recent pkg-config supports sysroot.
 >> 
 >> FC-6 has "only" 0.21.

Notice that sysroot is broken in 0.23 (it removes everything else than
-I / -L words). Patches have been posted to the pkgconfig list several
times.

 >> > So you simply build your .pc files as usual (w/o sysroot prefix) and
 >> > set the sysroot prefix via env on the pkg-config call.
 >> 
 >> From a quick glance over the man page of 0.23, yes.

 Enrico> Yep, it doesn't take $SYSROOT (as my original patch did), but with 
 Enrico> some prefix ...

PKG_CONFIG_SYSROOT_DIR

-- 
Bye, Peter Korsgaard
