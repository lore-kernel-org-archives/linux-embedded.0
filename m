From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Sun, 4 Jan 2009 01:37:12 +0100
Message-ID: <c384c5ea0901031637k3b571313m934c8881dce1c81@mail.gmail.com>
References: <200901020207.30359.rob@landley.net>
	 <c384c5ea0901031454n451bc899w166bb146c96f6164@mail.gmail.com>
	 <495FEEAF.5020005@zytor.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=18I0Ufs8caDYhddqb9E4rzn02FfUf9ILqARZZufE6oU=;
        b=X7ZkzDfo5svuIig4jXn8Mn7oNZoVVk1IxUDGvcjILfG9vLo+KhSaxnjjvWN8OvF8w5
         /yNi3ZlQa1allMzCqFrAhrJd/tIxL82Exig19RATfluIgOCDeNU3FPwMeNm+KnH9ff+9
         MGSW5omQwkbtyqTngU4qxQo4r5yyven0yJi9o=
In-Reply-To: <495FEEAF.5020005@zytor.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Rob Landley <rob@landley.net>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>

Hello,

On Sun, Jan 4, 2009 at 12:03 AM, H. Peter Anvin <hpa@zytor.com> wrote:
>> Dependencies very quickly become dependency hell. If A requires B,
>> then A also inherits all (future) requirements of B, etc. etc.
>>
>> In my daily software development work with Linux and GNU software in
>> general, 10% of it is spent fighting/removing these extremely "thin"
>> or false depencies, so that it is usuable in embedded devices.
>>
>
> First of all, I largely consider this a joke.  All real-life embedded
> kernel builds take place on hosted platforms; anything else seems to be
> done "just because it can be done", as a kind of show-off art project.
> Cute, but hardly worth impeding the rest of the kernel community for.
>
Let me explain why it is not a joke for me, although yes I agree it's
a funny way of how software engineering works.

My argument on thin dependencies indeed mostly holds for run-time
dependencies (to reduce size) but also for build dependency (to reduce
complexity)*.

In general the right version of the right tool is not available on the
build host.

If I cross-build 30 packages all of which need a build-host-native
perl during their build, consider the chance of these packages
building with the one version of perl that lives on the system. It's
near 0% for the average mix of packages.

Yes, the host is fat enough so that we can build (say three) different
versions of perl to accomodate the build.

The truth often is, of the 30 build dependencies 25 of them are thin
(build) dependencies.

So yes, the say extra 10% of build tool dependency needed to make 0.5%
of the build system work, can be solved on the fat build platform, but
I do not always consider it a well engineered solution.

For a (dangerous) metaphor: In mechanical engineering, if there are 30
joints using nuts and bolts, and a 31st is designed in, it is strongly
prefered to make it a nut and bolt as well, even if using a screw
would work equally well or even better. The overall costs (over
complexity, tool dependency, maintainability) would be lower.

Regards,
-- 
Leon

* Since Intel, since recently, pays another team of excellent people
maintaining a system dealing with the (cross) build tool dependency
hell, I rest my case. :-)
