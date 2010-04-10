From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: A better way to sequence driver initialization?
Date: Sat, 10 Apr 2010 08:56:17 -0500
Message-ID: <4BC08381.20805@billgatliff.com>
References: <4BBF7E9C.80604@billgatliff.com> <i2zfa686aa41004092229l97b83ebdqba6aece45419dc0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <i2zfa686aa41004092229l97b83ebdqba6aece45419dc0@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Linux/PPC Development <linuxppc-dev@ozlabs.org>, linux-embedded <linux-embedded@vger.kernel.org>

Grant Likely wrote:
> On Fri, Apr 9, 2010 at 1:23 PM, Bill Gatliff <bgat@billgatliff.com> wrote:
>   
>> Guys:
>>
>>
>> My recent post, "Requesting a GPIO that hasn't been registered yet", and
>> Anton's reply thereto (thanks, Anton!) on linuxppc-dev got me thinking
>> about the problem of dependencies between devices in different  classes,
>> and/or between drivers/devices in general.  I'd like to float an idea to
>> see if it's worth pursuing.
>>
>> Changing the link order to get drivers to initialize in the right order
>> will always be a problem for someone--- the order will be right for some
>> people, but exactly wrong for others.  And the problem is made worse for
>> Device Tree-based systems, where just about everything including IRQ
>> descriptors are created on a demand and/or as-available basis.  What if
>> we let the kernel sort those dependencies out for us, at runtime?  I
>> think it's possible, and I can't be the only one who would like to see
>> this happen.
>>
>> There are two parts to my idea for a solution.  First part is to modify
>> do_initcalls() so that it launches each initcall function in its own
>> kernel thread.  Wait, don't panic yet!
>>     
>
> Is initcall the right granularity?  Shouldn't it be that each .probe()
> hook gets its own thread?  Otherwise one device missing its resources
> could block another device using the same driver (whose resources are
> available) from probing.

Good point, one that I missed.  Yea, I guess I really want multithreaded
probing.

> Regardless, parallel probe has be attempted and failed before.  There are lots of fiddly bits to get right.
>   

Yep.  I wasnt aware of any specific attempts before, but I did suspect
that there were fiddly bits lurking about.  :)

> In fact, there *used* to be code in the kernel that does exactly that.
>  It was put in 2.6.20, but removed in 2.6.21-rc1.  Here's the relevant
> commits, and a very interesting thread discussing the issues:
>
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=21c7f30b1d3f8a3de3128478daca3ce203fc8733
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=5adc55da4a7758021bcc374904b0f8b076508a11
> http://lkml.indiana.edu/hypermail/linux/kernel/0705.1/0205.html
>
> It is pointed out in that thread that a big part of the problem is
> that a large number of drivers in the tree just aren't safe for
> multithreaded probing which is kind of a showstopper.  Now, maybe
> doing it at the initcall level makes it less scary and more sane, but
> I suspect that it will still expose a lot of broken code that assumes
> things are already set up because it has always been that way.
>   

Yep.

> Not quite the same model that you are talking about here, but it would
> solve the problem on a per-driver basis.
>   

Yea, but it's the per-driver part that I'm trying to avoid.


> Have you dug into the Arjan's asynchronous function call infrastructure?
>
> http://lwn.net/Articles/314808/
>   

No, but I think I will now.  :)


b.g.

-- 
Bill Gatliff
bgat@billgatliff.com
