From: Pekka Enberg <penberg@kernel.org>
Subject: Re: RFC: [Restatement] KBUS messaging subsystem
Date: Mon, 15 Aug 2011 14:46:46 +0300
Message-ID: <CAOJsxLEg-9hAQG99TkM+tqdTjZkpZwubOu1qM-6m7B5apZmh_w@mail.gmail.com>
References: <cover.1300450604.git.tibs@tonyibbs.co.uk>
	<201105171050.38903.florian@openwrt.org>
	<37F5AF18-99E5-4516-B31F-00F7BD348ADE@tonyibbs.co.uk>
	<201107061815.36294.florian@openwrt.org>
	<5F531701-B760-45F0-989D-669013409FE8@tonyibbs.co.uk>
	<CAOJsxLFSdPO2ebjM9W9JaNcX80COzn=Y3hFukXZjn+1yY4ivZQ@mail.gmail.com>
	<63D130AC-E6DF-4A61-BB69-30212D238F37@tonyibbs.co.uk>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=fneoGXY8cvOB2ceWQAqT0VWiGt/2qfPDnQx0KWLXD/g=;
        b=s72J9WfPw/QCYprZvQ7P2pJgKyvoHrUAmvKgZQH8lbTUAqDxm+XfPGxO3hP9L3O4lP
         MKTcIKoALz1o4jNrcXmO0ulRbfiDtzBLoBxOde0mZCIZX+A/T6FEGGaSCDzS6CtWBCCj
         /7mntE6NnYCIyaHiH66t3yFs/0rvYxHU8mEVU=
In-Reply-To: <63D130AC-E6DF-4A61-BB69-30212D238F37@tonyibbs.co.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tony Ibbs <tibs@tonyibbs.co.uk>
Cc: lkml <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, Florian Fainelli <florian@openwrt.org>, Grant Likely <grant.likely@secretlab.ca>, Linux-embedded <linux-embedded@vger.kernel.org>, Tibs at Kynesim <tibs@kynesim.co.uk>, Richard Watts <rrw@kynesim.co.uk>

Hi Tony,

On Sun, Aug 7, 2011 at 11:24 PM, Tony Ibbs <tibs@tonyibbs.co.uk> wrote:
> Real examples of usage that aren't the STB are a bit difficult to give
> because they belong to customer projects that we're not allowed to
> talk about.

That's part of the problem, I suppose. We usually don't merge new
kernel facilities unless we're able to understand (and see) real
applications that need them.

On Sun, Aug 7, 2011 at 11:24 PM, Tony Ibbs <tibs@tonyibbs.co.uk> wrote:
> I assume the real point of your post is that I wrote about the reasons
> why we made KBUS a kernel module, but did not really address the
> reasons why KBUS might want to be a kernel module in general usage.

I simply don't see a convincing argument why existing IPC and other
kernel mechanisms are not sufficient to implement what you need. I'm
sure there is one but it's not apparent from your emails.

The whole thing feels more like "lets put a message broker into the
kernel" rather than set of kernel APIs that make sense. I suppose the
rather extensive ioctl() ABI is partly to blame here.

I'm not saying you need to implement everything in userspace but I'm
also not convinced we want _all of this_ in the kernel.

                          Pekka
