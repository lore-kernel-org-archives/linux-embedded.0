From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: Adding a new platform
Date: Tue, 19 Aug 2008 19:22:22 +0100
Message-ID: <20080819182222.GB8215@linux-mips.org>
References: <48AB0A7A.8040209@cisco.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <48AB0A7A.8040209@cisco.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David VomLehn <dvomlehn@cisco.com>
Cc: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

On Tue, Aug 19, 2008 at 11:01:30AM -0700, David VomLehn wrote:

> I'm working to educate our management on the need to get our platform in 
> the kernel mainline. I expect I will be asked to tell them how much work 
> this is. What do we need to do to add a new MIPS platform?

Basically a patchset that adds support for the base platform and all
necessary drivers.  Send that to the respective mailing lists and
maintainers (see MAINTAINERS file) and wait for the feedback.  Expect to
polish your patchset a few times until everybody is happy.  That's the
basic receipe.  See also Documentation/SubmittingPatches,
Documentation/SubmittingDrivers and Documentation/SubmitChecklist.

  Ralf
