From: Marco Stornelli <marco.stornelli@coritel.it>
Subject: Re: Dump Management
Date: Tue, 01 Jul 2008 16:49:51 +0200
Message-ID: <486A440F.5000709@coritel.it>
References: <4869DEF0.5060109@coritel.it> <486A39AE.4040308@codefidence.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <486A39AE.4040308@codefidence.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gilad Ben-Yossef <gilad@codefidence.com>
Cc: Linux-Embedded <linux-embedded@vger.kernel.org>

Gilad Ben-Yossef ha scritto:
> hI,
> 
> 
> Marco Stornelli wrote:
> 
>> what's the standard way to manage the core dump and therefore the 
>> post-mortem debug? 
> For most embedded systems I know, core dumps are useful on the developer 
> desk and in the testing lab. For analyzing field post-mortem (where it 
> is feasible), use a custom fault signal hander in your app to catch the 
> relevant information and save it.
> 
> If you're interested in a tutorial in doing this, I'm giving one at this 
> year OLS. Or you can just check out the slides and example code here:
> 
> http://tuxology.net/lectures/crash-and-burn-writing-linux-application-fault-handlers/ 
> 
>> For my experience it could be useful to have a mechanism to have 
>> little dump image (only some information) to store it in flash and 
>> maybe to have an hook (or something like this) for each application to 
>> customize the dump information. What do you think about it?
>>
> That's exactly what a custom fault signal handler does :-)
> 
> Cheers,
> Gilad
> 

Very interesting....Thanks.

-- 
Marco Stornelli
Embedded Software Engineer
CoRiTeL - Consorzio di Ricerca sulle Telecomunicazioni
http://www.coritel.it

marco.stornelli@coritel.it
+39 06 72582838
