From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 5/5] Add support for LZO-compressed kernels on x86
Date: Fri, 31 Jul 2009 11:31:07 +0200
Message-ID: <20090731093107.GA29704@merkur.ravnborg.org>
References: <1248271279-9920-1-git-send-email-albin.tonnerre@free-electrons.com> <1248271279-9920-2-git-send-email-albin.tonnerre@free-electrons.com> <1248271279-9920-3-git-send-email-albin.tonnerre@free-electrons.com> <1248271279-9920-4-git-send-email-albin.tonnerre@free-electrons.com> <1248271279-9920-5-git-send-email-albin.tonnerre@free-electrons.com> <4A70AA64.4020301@zytor.com> <20090729210257.GA22975@merkur.ravnborg.org> <20090731075119.GB7139@pc-ras4041.res.insa>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751856AbZGaJbL@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090731075119.GB7139@pc-ras4041.res.insa>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Albin Tonnerre <albin.tonnerre@free-electrons.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, linux@arm.linux.org.uk, alain@knaff.lu, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Fri, Jul 31, 2009 at 09:51:19AM +0200, Albin Tonnerre wrote:
> On Wed, Jul 29, 2009 at 11:02:58PM +0200, Sam Ravnborg wrote :
> > On Wed, Jul 29, 2009 at 01:00:36PM -0700, H. Peter Anvin wrote:
> > > On 07/22/2009 07:01 AM, Albin Tonnerre wrote:
> > > > This is the third and last part of the patch, which contains the
> > > > necessary changes to the x86 Kconfig and boot/compressed to allow the
> > > > use of this new compression method
> > > > 
> > > > Signed-off-by: Albin Tonnerre <albin.tonnerre@free-electrons.com>
> > > 
> > > Acked-by: H. Peter Anvin <hpa@zytor.com>
> > > 
> > > Since the patchset otherwise isn't really x86-related it probably makes
> > > more sense to pass this through the kbuild tree, or perhaps via akpm,
> > > rather than -tip?
> > 
> > I can take it via kbuild if I get a fewsh patch-set with proper
> > ack's added.
> > I've long lost the original patch-set.
> 
> Only the x86-specific part of the patch has been acked so far, and it relies on
> 3 other patches which have not been acked. If there's anything I can do to get
> feedback on the remaining patches, please let me know.

Please resend the full serie then I may take a short look at it.

	Sam
