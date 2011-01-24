From: Jiri Olsa <jolsa@redhat.com>
Subject: [RFC] gelf - user space probe debugger
Date: Mon, 24 Jan 2011 17:11:09 +0100
Message-ID: <20110124161109.GD3694@jolsa.brq.redhat.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org
Cc: jolsa@redhat.com

hi,

I started a debugger project.  It's based on the user space backport
of optimized kprobes (djprobes) and RSP stub implementation.

The debugger is implemented as a preloaded shared library,
which handles all the debugger work, hence no kernel ptrace
is needed.

It just reached the state where it can handle simple gdb session
of setting/reaching a breakpoint and continue the execution.

Details can be found on http://people.redhat.com/jolsa/gelf/

I'd like to ask for opinions if there'd be users for such thing,
and if it's worth to continue on this..

thanks for any ideas,
jirka


ps. I'm not subscribed to the list, so please include my email
in the answer
