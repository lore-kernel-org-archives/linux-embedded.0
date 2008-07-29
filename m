From: Marco Stornelli <marco.stornelli@coritel.it>
Subject: Re: prevalence of C++ in embedded linux?
Date: Tue, 29 Jul 2008 10:35:02 +0200
Message-ID: <488ED636.7090109@coritel.it>
References: <alpine.LFD.1.10.0807281142430.4286@localhost.localdomain>	 <488EC964.2030400@coritel.it>  <200807290951.34563.neundorf@eit.uni-kl.de> <1217319612.24988.15.camel@spike.firmix.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1217319612.24988.15.camel@spike.firmix.at>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bernd Petrovitsch <bernd@firmix.at>
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Alexander Neundorf <neundorf@eit.uni-kl.de>

Bernd Petrovitsch ha scritto:
> On Tue, 2008-07-29 at 09:51 +0200, Alexander Neundorf wrote:
>> On Tuesday 29 July 2008 09:40:20 Marco Stornelli wrote:
>>> Robert P. J. Day ha scritto:
>>>>   just curious -- how many folks are working in C++ in their embedded
>>>> linux work?
> 
> Not if it's in anyway avoidable.
> 
> [....]
>>> Like Linus Torvals said "...C++ is an horrible language" :)
>> If you avoid RTTI and exceptions and if you are handle templates and multiple 
>> inheritance carefully I see nothing which speaks against using it for 
>> embedded and real-time software.
> 
> That's the main reason for *not* using C++ in the embedded world in the
> first place.
> Tell people that they may use C++ and see them happy.
> Then tell them that you better not use templates, RTTI, exceptions and
> multiple inheritance if you want to boot from small space.
> 
> Yes, one *can* use the above features and get small features. But most
> people simply can't - if only that they use some tool/lib written in C++
> (and coming from the "normal" world) which simply uses them without
> thinking about space and wonder why the device won't run with "only"
> 128MB flash and run in 16MB RAM.
> 
> BTW why should I use C++ if I don't use any "fancy features"?
> 
> 	Bernd
I quite agree with you

-- 
Marco Stornelli
Embedded Software Engineer
CoRiTeL - Consorzio di Ricerca sulle Telecomunicazioni
http://www.coritel.it

marco.stornelli@coritel.it
+39 06 72582838
