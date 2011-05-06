From: Tony Lindgren <tony@atomide.com>
Subject: Re: [RFC PATCH] arm: drop Execute-In-Place
Date: Fri, 6 May 2011 09:07:36 +0300
Message-ID: <20110506060733.GP27860@atomide.com>
References: <1304607121-13612-1-git-send-email-plagnioj@jcrosoft.com>
	<4DC2E5AA.5010604@am.sony.com> <4DC2E669.2000101@am.sony.com>
	<1304620350.2398.29.camel@i7.infradead.org>
	<4DC2EF19.5010309@am.sony.com>
	<alpine.LFD.2.00.1105051453280.24613@xanadu.home>
	<BANLkTimfKJPcDN+L4+z1DnsMv_BMOHpyew@mail.gmail.com>
	<4DC2F6B0.80800@am.sony.com>
	<alpine.LFD.2.00.1105051518580.24613@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.1105051518580.24613@xanadu.home>
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
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Russell King <linux@arm.linux.org.uk>, linux-embedded <linux-embedded@vger.kernel.org>, Mike Frysinger <vapier.adi@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, Tim Bird <tim.bird@am.sony.com>, Eric Miao <eric.miao@canonical.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

* Nicolas Pitre <nicolas.pitre@linaro.org> [110505 22:23]:
> On Thu, 5 May 2011, Tim Bird wrote:
> > 
> > I should add that I tried to use XIP on omap (for research purposes),
> > but it was broken and I didn't have time to fix it.  My bad.
> 
> OMAP is doing pretty nasty things with their early serial port support.  
> This is most likely to screw up XIP.

Yes to debug it you'd have to hardcode the uart_phys and virt
in the debug-macro.S for DEBUG_LL and EARLY_PRINTK. But should
be easy enough to do for anybody using XIP.

Of course there may also be other issues too :)

Tony
