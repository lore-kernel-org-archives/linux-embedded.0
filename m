From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: Some embedded topics
Date: Fri, 30 May 2008 15:36:14 -0700
Message-ID: <4840815E.9020002@am.sony.com>
References: <483C83DE.3040604@cisco.com>	<20080527173118.12ec691b@vader.jdub.homelinux.org>	<f608b67d0805271537m1b07e08y5dd84f7bbd8918cf@mail.gmail.com> <20080527180200.56ffc588@vader.jdub.homelinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080527180200.56ffc588@vader.jdub.homelinux.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Josh Boyer <jwboyer@gmail.com>
Cc: vb <vb@vsbe.com>, David VomLehn <dvomlehn@cisco.com>, linux-embedded@vger.kernel.org

Josh Boyer wrote:
> lttng can trace quite a few events.  Interrupts, system calls, etc.
> Might be worth a look, and it's quite well maintained against various
> kernel versions.

It's pretty heavyweight, but you could use filters to cut down on
the events traced.  By default output goes to the file system, which
could be on pramfs.  (Or NFS - I'm sorry I lost track of the original
request - don't know if this is an option or not.)

I'm not sure, however, that the buffers are pushed to user-space,
through the daemon, and back to the file system in an expedient manner.
I agree it might be worth a look for this use case.  We use it at
Sony quite a bit and it's valuable.
  -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================

