From: Wolfgang Grandegger <wg@grandegger.com>
Subject: Re: UIO - interrupt performance
Date: Tue, 21 Oct 2008 08:57:41 +0200
Message-ID: <48FD7D65.1070409@grandegger.com>
References: <5958B8D7916AB84781FE0E7B57C218CB75AB98@306900ANEX2.global.avaya.com>	 <1224498501.3954.50.camel@moss.renham>	 <Pine.LNX.4.58.0810200258210.2562@vlab.hofr.at> <1224540757.3954.59.camel@moss.renham>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1224540757.3954.59.camel@moss.renham>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ben Nizette <bn@niasdigital.com>
Cc: Nicholas Mc Guire <hofrat@hofr.at>, linux-embedded <linux-embedded@vger.kernel.org>

Ben Nizette wrote:
> On Mon, 2008-10-20 at 03:06 -0800, Nicholas Mc Guire wrote:
>>> On Mon, 2008-10-20 at 10:55 +0100, Douglas, Jim (Jim) wrote:
>>>> We are contemplating porting a large number of device drivers to Linux.
>>>> The pragmatic solution is to keep them in user mode (using the UIO
>>>> framework) where possible ... they are written in C++ for a start.
>>>>
>>>> The obvious disadvantages of user mode device drivers are security /
>>>> isolation.  The main benefit is ease of development.
>>>>
>>>> Do you know what the *technical* disadvantages of this approach might
>>>> be? I am most concerned about possible impact on interrupt handling.
>>>>
>>>> For example, I assume the context switching overhead is higher, and that
>>>> interrupt latency is more difficult to predict?
>>> Userspace drivers certainly aren't first class citizens; uio and kernel
>>> mode drivers generally aren't really interchangeable.
>>>
>>> The technical disadvantages of userspace drivers are that you don't have
>>> access to kernel subsystems, you can't run any userspace content in irq
>>> context so everything needs to be scheduled before it can be dealt with.
>>> A UIO driver still needs a kernel component to do acknowledge the
>>> interrupt.  As such when you say "interrupt latency" you need to define
>>> the end point.  A UIO driver will have it's in-kernel handler called
>>> just as quickly as any other driver but the userspace app will need to
>>> be scheduled before it receives notification that the IRQ has fired.
>>>
>>> The technical advantage of a UIO driver is that devices which only need
>>> to shift data don't have to double-handle it.  e.g. an ADC card doesn't
>>> need to move ADC results from hardware to kernel, kernel to userspace,
>>> it's just one fluid movement.
>>>
>>> What kind of device drivers are you talking about?  They have to be of a
>>> fairly specific flavour to fit in to a UIO model.  Linux isn't a
>>> microkernel, userspace drivers are quite restricted in their power.
>>>
>> are these claims based on benchmarks of a specific driver ? I only know
>> of a singe UIO driver for a Hilscher CIF card and one for a SMX
>> Cryptengine (I guess thats yours any way) but none for a AD/DIO card - if
>> you know of such a driver I would be interested in seeing its performance.
> 
> When UIO was being discussed for inclusion, the example case being
> thrown around was for such an ADC card.  They claimed to have seen
> significant improvements in speed by avoiding the double-handling of
> data.  Come to think of it, I can't see that this specific driver has
> shown up...
> 
> But what kind of benchmarks do you want?  When I say "restricted in
> their power" I mean more in a feature-set kind of way than a raw speed
> way.  Userspace drivers can't plug in to kernel subsystems so can't, for
> example, be SPI hosts or terminal devices or network hardware or
> anything else which sits in the middle of a standard stack.  All they
> can do is be notified of an interrupt and have direct access to a lump
> of memory.
> 
> As I asked before, what's your use-case?  It tends to be fairly obvious
> whether the hardware is suitable for a UIO-based driver or whether it's
> going to have to live in kernel.
> 
>> Also if you know of any simple UIO sample drivers that would also help.
> 
> As in examples of the userspace half?  Unfortunately uio-smx isn't ready
> to fly thanks to some significant production delays but the userspace
> half of the Hilscher CIF driver can be found at
> http://www.osadl.org/projects/downloads/UIO/user/

As I see it, mainly the license conditions attract people to use UIO.
Performance is not that important.

Wolfgang.
