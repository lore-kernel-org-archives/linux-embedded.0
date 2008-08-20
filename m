From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Subject: Re: Adding a new platform
Date: Wed, 20 Aug 2008 10:10:44 +0200
Message-ID: <20080820101044.5df8b7d8@hskinnemo-gx745.norway.atmel.com>
References: <48AB0A7A.8040209@cisco.com>
	<7d1d9c250808192019g6ec73ec7x53563b8ad2130df@mail.gmail.com>
	<f608b67d0808192057w29988500o2793dfb7f0c99314@mail.gmail.com>
	<7d1d9c250808192129j3fb7ef28p8f404c6affd82078@mail.gmail.com>
	<f608b67d0808192215q5b8ffbf0w70531c31cdd66bcd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <f608b67d0808192215q5b8ffbf0w70531c31cdd66bcd@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: vb <vb@vsbe.com>
Cc: Paul Gortmaker <paul.gortmaker@gmail.com>, Linux Embedded Maillist <linux-embedded@vger.kernel.org>, corbet@lwn.net

vb <vb@vsbe.com> wrote:
> Would such a driver be accepted? Wouldn't such a driver get stale
> after a few kernel releases?

Yes, the kernel contains tons of such platform-specific drivers. No, it
won't get stale as long as someone who has access to the hardware is
willing to test a -rc kernel every once in a while.

You can't really expect to get away with no maintenance at all, but in
my experience, it takes much less effort to maintain a driver in-tree
than out-of-tree. It's also much easier to get help if it's in-tree.

Haavard
