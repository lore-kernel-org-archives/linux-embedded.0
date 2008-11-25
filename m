From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Subject: Re: [PATCH/RFC] Add Alternative Log Buffer Support for printk
 Messages
Date: Tue, 25 Nov 2008 13:55:19 -0500
Message-ID: <20081125135519.038abf23@zod.rchland.ibm.com>
References: <1227638045-12862-1-git-send-email-gerickson@nuovations.com>
	<b5e2fc790811251053w507792a1r3673ee2dc7581379@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <b5e2fc790811251053w507792a1r3673ee2dc7581379@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Sealey <matt@genesi-usa.com>
Cc: Grant Erickson <gerickson@nuovations.com>, linuxppc-dev@ozlabs.org, Stefan Roese <sr@denx.de>, Wolfgang Denx <wd@denx.de>, linux-embedded@vger.kernel.org

On Tue, 25 Nov 2008 12:53:12 -0600
"Matt Sealey" <matt@genesi-usa.com> wrote:

> Nitpick, really.. shouldn't the logbuffer location(s) be some device tree
> property(ies), perhaps something in the
> /chosen node that U-Boot etc. can then fill out?

I don't think that's a nitpick.  It's a fundamental change in how this
would all work.  However, I do think you're generally right.

Perhaps not /chosen, but maybe something like /rtas or /firmware, etc.

josh
