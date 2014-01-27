From: Arnaud Patard (Rtp) <arnaud.patard@rtp-net.org>
Subject: Re: GPIO triggers kernel reboot
Date: Mon, 27 Jan 2014 09:08:49 +0100
Message-ID: <8761p5hmni.fsf@lebrac.rtp-net.org>
References: <52E3E031.6040709@denx.de>
 <CALLGbRKK_ZcOB6nAiV67njrphXMQXN7Y2s81n5k3PWoSVrsrUw@mail.gmail.com>
 <52E5FB1A.2020205@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <52E5FB1A.2020205@denx.de> (Heiko Schocher's message of "Mon, 27
 Jan 2014 07:22:18 +0100")
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: hs@denx.de
Cc: Steve deRosier <derosier@gmail.com>, linux-embedded@vger.kernel.org, Wolfgang Denk <wd@denx.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Heiko Schocher <hs@denx.de> writes:

> Hello Steve,
>
> Thanks for your answer!
>
> Am 25.01.2014 20:39, schrieb Steve deRosier:
>> Hi Heiko,
>>
>> It's certainly possible, and it's also easily done from user-space.
>>   Something like this is more policy than function.  It's also a potential
>> security issue.  As such I'd expect it highly unlikely that the kernel
>> maintainers would allow it to go upstream. Give it a try though.
>
> Ok, thats what I also think ...
>
>> I'd approach this from user-space.  Add in the gpio-keys driver and use the
>> input-event-daemon to trigger a reboot.  Super easy.
>
> Yes, that was also my suggestion, but is there a way to do this without
> user space usage in a generic way?

I think that you can register an input handler for that. iirc, there was
a driver doing something similar for apm.

Arnaud
