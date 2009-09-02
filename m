From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: [PATCH 7/7] printk: provide a filtering macro for printk
Date: Wed, 2 Sep 2009 10:05:13 -0700
Message-ID: <4A9EA5C9.3010900@am.sony.com>
References: <1251844269-12394-1-git-send-email-mat@brain-dump.org> <1251844269-12394-8-git-send-email-mat@brain-dump.org> <4A9DAD2B.3080909@am.sony.com> <BD79186B4FD85F4B8E60E381CAEE190901C55CD3@mi8nycmail19.Mi8.com> <20090902130943.GE2736@debbook.brain-dump.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090902130943.GE2736@debbook.brain-dump.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marc Andre Tanner <mat@brain-dump.org>
Cc: H Hartley Sweeten <hartleys@visionengravers.com>, linux-embedded@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, linux kernel <linux-kernel@vger.kernel.org>

Marc Andre Tanner wrote:
> On Tue, Sep 01, 2009 at 07:32:25PM -0400, H Hartley Sweeten wrote:
>> On Tuesday, September 01, 2009 4:24 PM, Tim Bird wrote:
>>> Some places in the kernel break the message into pieces, like so:
>>>
>>> printk(KERN_ERR, "Error: first part ");
>>> ...
>>> printk(" more info for error.\n");
>> Technically, shouldn't the second part of the message actually be:
>>
>> printk(KERN_CONT " more info for error.\n");
>>
>> Maybe some mechanism could be created to handle the continued message
>> if they have the KERN_CONT?
> 
> Yes it's true that KERN_CONT isn't handled correctly, but I don't see a way
> to change that.
> 
>>> These parts would not be handled consistently under certain
>>> conditions.
>>>
>>> It would be confusing to see only part of the message,
>>> but I don't know how often this construct is used.  
> 
> $ grep -R KERN_CONT linux-2.6 | wc -l
> 373
> 
>>> Maybe
>>> another mechanism is needed to ensure that continuation
>>> printk lines have the same log level as their start strings.
> 
> I currently don't see a way to achieve this with the CPP.

If it's that few, then maybe it's OK to actually change
the code for those printk statements. (Heck, these locations
were all changed in the last 2 years anyway.)

I'm just brainstorming here, but how about changing them from:
  printk(KERN_INFO "foo");
  printk(KERN_CONT "bar\n");
to:
  printk(KERN_INFO "foo");
  printk_cont(KERN_INFO "bar\n");

This way the continuation line has the log level, and can
be conditionally compiled based on the VERBOSITY level.  A little
magic would be needed to strip the first 3 chars of the fmt
string in printk_cont().

I think this makes the printk messages a bit more consistent anyway,
and still marks lines that are continuation lines.

>>> But, overall, very slick!  It's nice to see a solution that doesn't
>>> require changing all printks statements in the kernel.
> 
> Yes that's what I thought too. Thanks to the comments so far the next 
> version of the patch will contain even less changes to the rest of the 
> kernel.
>  
>> I haven't looked over this patch series yet but does it work with the
>> pr_<level> macros (pr_info, pr_err, etc.)?
> 
> It should work, yes.

 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================
