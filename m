From: Josh Boyer <jwboyer@gmail.com>
Subject: Re: Some embedded topics
Date: Fri, 30 May 2008 19:04:23 -0500
Message-ID: <20080530190423.67ac3139@vader.jdub.homelinux.org>
References: <483C83DE.3040604@cisco.com>
	<20080527173118.12ec691b@vader.jdub.homelinux.org>
	<f608b67d0805271537m1b07e08y5dd84f7bbd8918cf@mail.gmail.com>
	<20080527180200.56ffc588@vader.jdub.homelinux.org>
	<4840815E.9020002@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject:message-id:in-reply-to:references:x-mailer:mime-version:content-type:content-transfer-encoding;
        bh=HFc2PDyW0DgYFhKR5Ba6NyGd5WlwZ8dhlTy5eFqf2pY=;
        b=lS4Y5jIQSMH4Xb3ubDuh4vYgBdo1f4+EMhPvHdI6wH9Ib3mj9bnqPnrL7KdqWpXmUu738It3DY3R0+gaDSoblGxfuCfIqasAs1ccRa62R+VOF9Et3kkWq/HEdMOpqhE3obgvGZqYr3sSnwiCQ/COpwGzVtxnAejR0/rWI/Wl5rE=
In-Reply-To: <4840815E.9020002@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Bird <tim.bird@am.sony.com>
Cc: vb <vb@vsbe.com>, David VomLehn <dvomlehn@cisco.com>, linux-embedded@vger.kernel.org

On Fri, 30 May 2008 15:36:14 -0700
Tim Bird <tim.bird@am.sony.com> wrote:

> Josh Boyer wrote:
> > lttng can trace quite a few events.  Interrupts, system calls, etc.
> > Might be worth a look, and it's quite well maintained against various
> > kernel versions.
> 
> It's pretty heavyweight, but you could use filters to cut down on
> the events traced.  By default output goes to the file system, which
> could be on pramfs.  (Or NFS - I'm sorry I lost track of the original
> request - don't know if this is an option or not.)

Indeed, it is fairly heavy in what it traces.  I was just suggesting it
as a starting point.

> I'm not sure, however, that the buffers are pushed to user-space,
> through the daemon, and back to the file system in an expedient manner.
> I agree it might be worth a look for this use case.  We use it at
> Sony quite a bit and it's valuable.

With a little bit of work, you could have it trace into a circular
buffer in DRAM.  Then you can preserve that via mem= reservations,
etc.

josh
