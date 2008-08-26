From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: [RFC] Remove more code when IP_MULTICAST=n
Date: Tue, 26 Aug 2008 09:44:31 -0700
Message-ID: <48B432EF.1010403@am.sony.com>
References: <20080819150047.38f09acf@surf> <Pine.LNX.4.64.0808191618190.25348@vixen.sonytel.be> <20080825084826.19923151@surf> <20080826033345.GA30587@linux-sh.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080826033345.GA30587@linux-sh.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Mundt <lethal@linux-sh.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, linux-embedded@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>

Paul Mundt wrote:
> On Mon, Aug 25, 2008 at 08:48:25AM +0200, Thomas Petazzoni wrote:
>> Le Tue, 19 Aug 2008 16:18:38 +0200 (CEST),
>> Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com> a ??crit :
>>
>>> On Tue, 19 Aug 2008, Thomas Petazzoni wrote:
>>>> [RFC] Remove more code when IP_MULTICAST=n
>>> Probably you wanted to cc netdev@vger.kernel.org?
>> Not necessarly at the beginning: I first wanted to get the feedback of
>> embedded-concerned developers, who might have a better understanding
>> than me of the networking stack. Last time I submitted a size-reduction
>> patch to Dave Miller concerning IGMP, the answer was:
>>
>> ??
>> I'm not applying this.
>>
>> This removes core parts of the BSD socket API from applications.
>> Like TCP and UDP, multicast capabilities are something applications
>> can always depend upon being available.
>>
>> If you want a broken networking implementation, you have the source
>> code, so you can do it in your own tree.
>> ??
>>
>> So, I'd prefer to send a good patch from the beginning.
>>
> Out of that bit of criticism, it's the validity of the approach in
> particular that's being called in to question, rather than the patch
> itself. How to clean up the patch itself is irrelevant if the idea itself
> is being shot down by the folks that will merge it. This is something
> that needs to be resolved first, and lists outside of the scope of netdev
> are really the wrong place to do this.
> 
> This is generally the way a lot of the size reduction work seems to be
> going these days. Now that most of the low-hanging fruit is out of the
> way, it's mostly down to micro-optimizations aimed at things perceived to
> be core functionality by others. Expect to continue running in to these
> sorts of problems if you choose to continue down this path.

This is a good observation.

I agree that we will continue to face opposition like this.  However,
IIRC, near the end of this thread David Miller did say that if the
patch got cleaned up he would take another look.

With regard to things perceived to be core functionality by others, this
is exactly correct.  In this case, David Miller asserts that without IGMP
functionality, the network stack is incorrect (and that "people" expect
and depend on a fully functional stack.)  He doesn't acknowledge (and
some other kernel developer don't either) that there might be developers
willing to forego stack features in the interest of other aims.  This
is something that will require ongoing education with kernel developers
about.

There are two sides to this battle:  1) convincing people that size matters
(AND that small increments can have a cumulative impact that matters), and
2) that the kernel can function "correctly" with the affected feature removed.
It is quite common for kernel developers to raise use cases unrelated
to embedded, which is frustrating.  But the burden of proof is on us to
show that the slicing and dicing we're requesting doesn't fundamentally
break the remaining functionality in ways that will negatively impact the
maintainers of those function areas.

In this particular case, I think we need to show that
there are valid cases were an embedded product can use networking just
fine, without IGMP support but with support for multicast.  (I believe
that's  the slice that this particular patch makes).  IMHO, what's
needed is a test to show that this works.  This can then be presented
to the netdev guys, who are, after all much more experienced with the
networking stuff.  If they can show that multicast does indeed *need* IGMP
to work correctly, then we need to back off.  The last thing I want is
to find out in the field that some streaming feature I've built into a
Sony camera that relies on multicast won't work in lots of network
configurations.  If that's true, then David is doing me a favor by
saying No. (Note that I might still make the decision to forego
a feature for size reasons if the number of instances of non-workingness
was small.)

IMHO, we need to acknowledge that the network guys can help us avoid
problems like the above.  Avoiding confrontation is good, but we should
still be ready to assert the value of our patches, when needed.
 -- Tim

P.S.  We should also be careful about taking claims of incorrectness
at face value.  In this particular thread, David asserted that NTP breaks
with this patch applied, but that turned out not to be the case.

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================
