From: Rob Landley <rob@landley.net>
Subject: Re: How to use DEBUG macros in compressed/head.S
Date: Wed, 16 Jan 2013 11:05:33 -0600
Message-ID: <1358355933.32505.38@driftwood>
References: <94B6F8A1EDC14A8CB9308D5F65F19892@VIU9IM6TKCWEEDX>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <94B6F8A1EDC14A8CB9308D5F65F19892@VIU9IM6TKCWEEDX> (from
	registcn@gmail.com on Wed Jan 16 02:17:39 2013)
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: zhaoyilong <registcn@gmail.com>
Cc: linux- embedded <linux-embedded@vger.kernel.org>

On 01/16/2013 02:17:39 AM, zhaoyilong wrote:
> When I open the macro DEBUG in the front of  file
> arch/arm/boot/decompressed/head.S,the kernel runs and stops  
> at"Uncompressing
> Linux... done, booting the kernel."

No, that's just the last thing it output.

I seldom find other people's debug code useful. I stick a printf()  
variant in the code at a place I want to see what it's doing, and then  
I know what the output means. I only enable their debug code if I'm  
sending the output to the person who wrote said debug code. (There are  
exceptions, but they're exceptions to a useful rule of thumb.)

At this level, you can do direct writes to the serial chip ala:

    
http://balau82.wordpress.com/2010/02/28/hello-world-for-bare-metal-arm-using-qemu/

Note that's for qemu, which pauses when it gets a port write. For real  
hardware you need to check the status bit before sending the next  
character, basically spinning on a port read until the relevant bit  
gets set/cleared to indicate the hardware's done with the last thing  
you sent it. I don't remember the check off the top of my head (last  
time I needed it I dug it out of the uboot source), but if you're just  
debugging you can do a delay loop between each write. (This is assuming  
your serial port is already set to the right speed, which it had to be  
to spit out the above message. Presumably the bootloader did it for  
you.)

(And this is assuming your board layout has an 8250/16550a UART variant  
mapped at a knowable address, which basically they all do because it's  
dirt simple and the patents expired years ago. They get weird and  
bespoke about setting buffer sizes but you don't really have to care at  
this level.)

Most likely you can find whatever spit out the text you _did_ see, and  
copy it to produce more text from places in the code you'd like  
visibility into.

Rob