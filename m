From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [RFC PATCH] arm: drop Execute-In-Place
Date: Fri, 6 May 2011 07:17:17 +0200
Message-ID: <20110506051717.GG11267@game.jcrosoft.org>
References: <4DC2E5AA.5010604@am.sony.com> <4DC2E669.2000101@am.sony.com>
	<1304620350.2398.29.camel@i7.infradead.org>
	<4DC2EF19.5010309@am.sony.com>
	<alpine.LFD.2.00.1105051453280.24613@xanadu.home>
	<BANLkTimfKJPcDN+L4+z1DnsMv_BMOHpyew@mail.gmail.com>
	<4DC2F6B0.80800@am.sony.com>
	<BANLkTincnFhwXAyvua5mtZDHqXs5Vts--Q@mail.gmail.com>
	<4DC307D0.3090704@am.sony.com>
	<BANLkTi=qiX9oG=ZMx0nZXrG811L7OZg4ww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <BANLkTi=qiX9oG=ZMx0nZXrG811L7OZg4ww@mail.gmail.com>
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Russell King <linux@arm.linux.org.uk>, linux-embedded <linux-embedded@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Tim Bird <tim.bird@am.sony.com>, Eric Miao <eric.miao@canonical.com>, David Woodhouse <dwmw2@infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 16:31 Thu 05 May     , Mike Frysinger wrote:
> On Thu, May 5, 2011 at 16:25, Tim Bird wrote:
> > On 05/05/2011 12:27 PM, Mike Frysinger wrote:
> >> On Thu, May 5, 2011 at 15:12, Tim Bird wrote:
> >>> As for in-tree-ness - I thought the most recent message was to stay
> >>> out of tree until the refactoring was over. ;-)
> >>
> >> to be fair, does this have any relevance whatsoever to NEC parts ?
> >> istm that the hindrance here is NEC doing any actual work for
> >> mainline. =A0even if there was no refactoring, i find it hard to belie=
ve
> >> that an NEC port would be posted. =A0if it were actually something that
> >> could happen, then they should already be posting patches for *basic*
> >> review to get the pieces unrelated to the refactoring worked out.
> >> there's no reason this has to be done serially.
> >
> > Well, OK. =A0I just don't want to lob bombs at NEC and then
> > have some poor soul over there get immediately rebuffed, due to
> > basic ARM churn. =A0Maybe not having naviengine support upstream
> > is my fault, but Sony doesn't make the CPU, so it doesn't seem
> > like it should be my job to mainline the chip support. =A0About
> > the only thing I have at my disposal is pressure not to buy
> > the chip (but this is harder to exercise than one might think.)
> =

> i dont have any vested interest either way wrt NEC or ARM/XIP.  i was
> just trying to highlight what i saw as a red herring.
> =

> i think the axiom "post early & post often" holds just as true here.
I've the same felling as Mike or David

Out of tree does not exist

Specially when they do effort to come mainline

Best Regards,
J.
