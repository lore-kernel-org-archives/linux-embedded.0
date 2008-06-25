From: Adrian Bunk <bunk@kernel.org>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Wed, 25 Jun 2008 18:41:38 +0300
Message-ID: <20080625154138.GA10285@cs181140183.pp.htv.fi>
References: <1209577322.25560.402.camel@pmac.infradead.org> <1209636171.25560.508.camel@pmac.infradead.org> <20080501104158.GM20451@one.firstfloor.org> <200806231928.09458.vda.linux@googlemail.com> <20080623174537.GB4756@cs181140183.pp.htv.fi> <486214F3.4070505@katalix.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <486214F3.4070505@katalix.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Chapman <jchapman@katalix.com>
Cc: Denys Vlasenko <vda.linux@googlemail.com>, Andi Kleen <andi@firstfloor.org>, David Woodhouse <dwmw2@infradead.org>, Tim Bird <tim.bird@am.sony.com>, torvalds@linux-foundation.org, akpm@linux-foundation.org, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 25, 2008 at 10:50:43AM +0100, James Chapman wrote:
> Adrian Bunk wrote:
>> On Mon, Jun 23, 2008 at 07:28:09PM +0200, Denys Vlasenko wrote:
>>> On Thursday 01 May 2008 12:41, Andi Kleen wrote:
>>>>> To a large extent, I agree. I certainly don't want to focus solely on
>>>>> code size; there's a lot more to embedded Linux than that. But it _is_
>>>> Not only code size, far more important is dynamic memory consumption.
>>>> [admittedly we right now lack a good instrumentation framework for this]
>>>>
>>>>> There are some cases where we really _do_ want to have CONFIG options,
>>>>> but I agree that we should keep them to a minimum. And when we _do_ have
>>>>> CONFIG options, they don't have to litter the actual code with ifdefs.
>>>> The problem I see is more that really nobody can even compile not  
>>>> alone test all these combinations anymore. Hidding the problem in 
>>>> inlines
>>>> does not solve that. And no randconfig is not the solution either.
>>> Because we allowed kernel to be developed without the requirement that
>>> random config should be buildable for release kernels.
>>>
>>> Had it been a requirement, keeping it in shape wouldn't be
>>> too difficult.
>>>
>>> Sure enough, _now_ fixing kernel to pass such a test on i386
>>> would take several weeks of work at least. But it is doable.
>>> ...
>>
>> On i386 it might even already work today.
>>
>> But guess how much time it costs to get at least all defconfigs  
>> compiling on the other 22 architectures.
>>
>> Even getting allmodconfig/allyesconfig compiling isn't trivial for all  
>> architectures, and random configurations are _far_ from compiling.
> >
> > And we are not talking about something to be done once, as soon as you
> > leave x86 there are tons of regular breakages.
>
> Could automated builds and build error reporting be used to help resolve  
> these problems?
> 
> The good people at Simtec have an automated build report available as an  
> e-mail digest. I use it to watch for architecture build breakages in  
> subsystems or drivers that I use or touch. It covers defconfigs of ARM  
> and MIPS architectures and reports compile errors/warnings, module size,  
> kernel size etc. If this approach were extended/distributed to cover  
> more architectures

Jan Dittmer has a great page showing the build status and kernel size of 
the defconfigs of all architectures that is running since 2004 or 2005:
  http://l4x.org/k/

> and random config builds, developers could with  
> little effort spot problems and fix them. Hell, it might also encourage  
> new developers to get involved and contribute.

Perhaps in an ideal world...

In reality, I'd claim I'm one out of only two people who regularly fix 
architecture-specific build problems for all architectures.

> James Chapman

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
