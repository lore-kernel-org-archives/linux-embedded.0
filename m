From: Ryan Mallon <ryan@bluewatersys.com>
Subject: Re: [PATCH 08/16 v2] pramfs: headers
Date: Thu, 11 Nov 2010 08:09:01 +1300
Message-ID: <4CDAEDCD.5050603@bluewatersys.com>
References: <4CD518C5.6000509@gmail.com>	<4CD7076D.80507@bluewatersys.com>	<AANLkTinJJG0K=BPS0CPzDWcgpRn_yPxZ819N408SwD6d@mail.gmail.com>	<4CD85489.8000503@bluewatersys.com>	<AANLkTim8rAQnVYpZdykd2VuL1N9CvkGj88Kf5qpSuJsC@mail.gmail.com>	<4CD9B09F.5090707@bluewatersys.com>	<AANLkTiky0LLnipJN3tCwcW6F2LEK-REEd=Ovo0ewMubR@mail.gmail.com> <AANLkTik+Vx8W1qXEZ=AqedRSj_D4-k70Xa4h-bnW2MRH@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTik+Vx8W1qXEZ=AqedRSj_D4-k70Xa4h-bnW2MRH@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Andrew Morton <akpm@linux-foundation.org>

On 11/10/2010 09:15 PM, Marco Stornelli wrote:
> 2010/11/9 Geert Uytterhoeven <geert@linux-m68k.org>:
>> On Tue, Nov 9, 2010 at 21:35, Ryan Mallon <ryan@bluewatersys.com> wrote:
>>> You can still do all of those things without having a fixed endianess.
>>> You just have to have one extra step of telling the external tools what
>>> the endianess is. IMHO, it is better to have the overhead of the endian
>>> conversion in the tools since it is less costly there than an the
>>> embedded system.
>>>
>>> I'm just trying to understand why the fixed endianess rule cannot be
>>> bent for such a specialised filesystem.
>>
>> When it was decided that filesystems should be fixed-endian and support for
>> big-endian ext2 was dropped, the overhead of doing the fixed conversions was
>> deetermined negligible due to compiler optimization.
>> That was ages ago, and current embedded systems run circles around the
>> machines of those days.
>>
>> Note that this is about metadata only. Actual file contents are always just
>> byte streams.
>>
> 
> I can add that the penalties in this case are  negligible due to the
> compensation of the very fast access of the media. In addition, from
> performance point of view I'm pretty happy (you can see the some
> benchmark on the project web site).

Thanks for the explanation guys.

~Ryan

-- 
Bluewater Systems Ltd - ARM Technology Solution Centre

Ryan Mallon         		5 Amuri Park, 404 Barbadoes St
ryan@bluewatersys.com         	PO Box 13 889, Christchurch 8013
http://www.bluewatersys.com	New Zealand
Phone: +64 3 3779127		Freecall: Australia 1800 148 751
Fax:   +64 3 3779135			  USA 1800 261 2934
