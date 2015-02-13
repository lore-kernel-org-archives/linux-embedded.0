From: Rob Landley <rob@landley.net>
Subject: Re: embedding dtb file into kernel
Date: Fri, 13 Feb 2015 00:10:56 -0600
Message-ID: <54DD9570.1080901@landley.net>
References: <54DD0018.7010409@graphitesystems.com> <54DD22BF.4040607@sonymobile.com> <54DD296E.7080901@graphitesystems.com> <54DD4BAF.9040206@sonymobile.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <54DD4BAF.9040206@sonymobile.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Bird <tim.bird@sonymobile.com>, K Richard Pixley <rpixley@graphitesystems.com>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

On 02/12/2015 06:56 PM, Tim Bird wrote:
> 
> 
> On 02/12/2015 02:30 PM, K Richard Pixley wrote:
>> On 2/12/15 14:01 , Tim Bird wrote:
>>> On 02/12/2015 11:33 AM, K Richard Pixley wrote:
>>>> I'm having trouble figuring out how to embed a dtb file into my kernel.
>>>> I'm thinking that there should be a standard, architecture independent
>>>> facility for this akin to initramfs, yes?
>>>>
>>>> Could someone please either point me to the standard facility, relevant
>>>> doc, a currently building board that uses the standard facility, or
>>>> outline what needs to be done to do this with a new board?
>>>>
>>>> If it matters, (I can't think why it would), I'm working with powerpc on
>>>> a 3.10 kernel.  But if there are better facilities in other versions I'd
>>>> appreciate hearing about that too.
>>> The normal method is just to cat the two files together, like so:
>>>   $ cat zImage <filename>.dtb > zImage_w_dtb
>>>
>>> See https://community.freescale.com/thread/315543 for one example, on ARM.
>>> I'm not sure what the status is for appended DTBs on powerpc, but it's
>>> easy enough you can just try it and see what happens.
>>>   -- Tim
>>
>> Thanks!
>>
>> How do I tell the kernel where to find that dtb?  Is there a relevant 
>> config option?
> 
> Usually you make the dtb from sources in the kernel.
> I don't know how it works on powerpc, but on arm, the .dts
> files are located in arch/arm/boot/dts, and you would make
> the dtb for the corresponding "foo.dts" source
> by typing:
> $ make foo.dtb

It's probably somewhere in:

https://www.kernel.org/doc/Documentation/devicetree/booting-without-of.txt

Rob
