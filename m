From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: [PATCH] add diffconfig utility
Date: Tue, 10 Jun 2008 15:33:06 -0700
Message-ID: <484F0122.6080700@am.sony.com>
References: <484ED902.9040000@am.sony.com> <1213135624.2534.99.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1213135624.2534.99.camel@shinybook.infradead.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

David Woodhouse wrote:
> On Tue, 2008-06-10 at 12:41 -0700, Tim Bird wrote:
>> +# Added and removed items are shown with a leading plus or minus,
>> +# respectively.  Changed items show the old and new values on a
>> +# single line.
> 
> It'd be really nice if it could give its output in the same form as
> the .config file itself -- so it'd look something like:
> 
> # CONFIG_FOO is not set
> CONFIG_BAR=y

Would an option for that style of output be OK?

The tool currently produces something similar
to a diff (but with changed lines compressed to
a single line for conciseness).  It should be easy
to produce something that can be used with another
tool to transform one config into another.

It's unclear what to do with variables that are
supposed to be removed from the config (as opposed
to be set to "CONFIG_FOO is not set"  Does merge.pl
handle this, or is this left to something like
'make oldconfig'?
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================

