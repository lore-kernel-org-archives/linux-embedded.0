From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: [PATCH] [RFC] emit-crash-char: Allow diversion of printk	output
 for crash logging
Date: Wed, 13 Aug 2008 12:02:28 -0700
Message-ID: <48A32FC4.7060006@am.sony.com>
References: <489BAD5C.2080009@cisco.com> <1218210904.19162.144.camel@localhost.localdomain> <48A0CC8D.3050302@cisco.com> <fa686aa40808121539pc02a645n908500844c698bca@mail.gmail.com> <48A2394E.8030500@cisco.com> <20080813021212.GA17587@secretlab.ca> <48A32068.3010000@cisco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48A32068.3010000@cisco.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David VomLehn <dvomlehn@cisco.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Daniel Walker <dwalker@mvista.com>, linux-embedded@vger.kernel.org

David VomLehn wrote:
> Our use case is:
> 1. We register a panic handler
> 2. The kernel panics and calls our panic handler
> 3. We register a function to log printk output
> 4. We print registers, stack, memory, and various other pieces of
>    information using standard kernel functions, which all use printk
> 5. As printk output is generated, we store it in memory
> 6. We unregister the printk logging function
> 7. The panic handler exits
> 8. The kernel does the rest of its usual panic handling
> 
> I'm not proposing storing the data in a specific place; that will be up
> to the platform. We will be storing in a piece of memory set aside for
> this purpose, but storing it in NOR flash makes a lot of sense, too, or
> using NAND flash or possibly even disk. All I'm proposing is a small
> framework that will allow plugging in a logging function when needed and
> removing it when done. I'll do the common piece that looks like a fake
> console and we, and other people, can use the simpler interface it
> provides.

I'm not sure exactly what triggers the transition from step 5 to 6 in
your steps above.  That is, how do you know when to unregister the
printk logging function?

But, taking a step back, instead of storing the information somewhere
else, why not just use the log buffer as the storage medium, and transfer
that all-at-once when you've collected the information you want?  That is,
change your steps to:

1. Register a panic handler
2. The kernel panics and calls our panic handler
3. Record the current position of the log buffer insertion point
4. Print registers, stack, memory, and various other pieces of
    information using standard kernel functions, which all use printk
5. As printk output is generated - it is stored by the kernel
 in the log buffer (no change to printk code is needed).
** (not sure what the trigger is to stop, here) **
6. Record the current position of the log buffer, and transfer
data logged between steps 3 and 6 to wherever you like.  That
is, copy it directly from the log buffer.
7. The panic handler exits
8. The kernel does the rest of its usual panic handling

This reduces your intrusion to just your trigger points, and
grabbing the log buffer position.  (Side Note - the way the log
buffer position is stored is a bit funky.  It is an absolute
value that monotonically increases, and is masked when used
to refer to the buffer.  This is why the log buffer size
is constrained to a power of two).
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================
