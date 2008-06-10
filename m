From: Arjan van de Ven <arjan@infradead.org>
Subject: Re: [PATCH] add diffconfig utility
Date: Tue, 10 Jun 2008 16:02:02 -0700
Message-ID: <20080610160202.3bb9d07f@infradead.org>
References: <484ED902.9040000@am.sony.com>
	<1213135624.2534.99.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1760251AbYFJXCW@vger.kernel.org>
In-Reply-To: <1213135624.2534.99.camel@shinybook.infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Woodhouse <dwmw2@infradead.org>
Cc: Tim Bird <tim.bird@am.sony.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

On Tue, 10 Jun 2008 23:07:04 +0100
David Woodhouse <dwmw2@infradead.org> wrote:

> On Tue, 2008-06-10 at 12:41 -0700, Tim Bird wrote:
> > +# Added and removed items are shown with a leading plus or minus,
> > +# respectively.  Changed items show the old and new values on a
> > +# single line.
> 
> It'd be really nice if it could give its output in the same form as
> the .config file itself -- so it'd look something like:
> 
> # CONFIG_FOO is not set
> CONFIG_BAR=y
> 
> That can be used with this kind of tool too...
> 

the person who wrote that tool also wrote a similar diff tool ;)
but it's horrible perl I suspect.



-- 
If you want to reach me at my work email, use arjan@linux.intel.com
For development, discussion and tips for power savings, 
visit http://www.lesswatts.org
