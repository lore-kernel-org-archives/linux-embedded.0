From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: Why is the deferred initcall patch not mainline?
Date: Tue, 21 Oct 2014 13:53:56 +0100
Message-ID: <CACxGe6vCvPcQb4xapFnFt4pQwi=Rw=fHO=59L2qS1tHwi3b4Bg@mail.gmail.com>
References: <5441F592.6090807@gmail.com> <nngd3gtlr4ltyk2mo7p2sn30.1413619885726@email.android.com>
 <CACxGe6s7rdYn+7HgWC1SkZ26v97YhmO04pv3SZJk00BtehAPqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <CACxGe6s7rdYn+7HgWC1SkZ26v97YhmO04pv3SZJk00BtehAPqQ@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Bird, Tim" <Tim.Bird@sonymobile.com>
Cc: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dirk Behme <dirk.behme@gmail.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, "tim.bird@am.sony.com" <tim.bird@am.sony.com>

On Tue, Oct 21, 2014 at 1:52 PM, Grant Likely <grant.likely@secretlab.ca> wrote:
> On Sat, Oct 18, 2014 at 9:11 AM, Bird, Tim <Tim.Bird@sonymobile.com> wrote:
>> The answer is pretty easy, I think.  I tried to mainline it once but failed, and didn't really try again. If it is being found useful,  we should try to mainline it again,  this time with more persistence.  The reason it got rejected before IIRC was that you can accomplish a similar thing with modules, with no changes to the kernel. But that doesn't cover the case where the loadable modules feature of the kernel is turned off, which is common in very small systems.
>
> It is a rather clumsy approach though since it requires changes to
> modules and it makes the configuration static per build. Could it
> instead be done by the kernel accepting a list of initcalls that
> should be deferred? It would depend I suppose on the cost of finding
> the initcalls to defer at boot time.

An, yes, I'm aware of the irony in calling this clumsy when I was the
one to introduce deferred probe.

g.
