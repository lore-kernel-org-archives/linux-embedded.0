From: "Bill Traynor" <wmat@naoi.ca>
Subject: Re: Cross Compiler and loads of issues
Date: Fri, 13 Jun 2008 09:52:59 -0400 (EDT)
Message-ID: <57fed5a348825cf4adedcd7b4b543254.squirrel@www.geekisp.com>
References: <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com>
    <402b1f4b315f572ac6459f78fa8b5ee4.squirrel@www.geekisp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <402b1f4b315f572ac6459f78fa8b5ee4.squirrel@www.geekisp.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Traynor <wmat@naoi.ca>
Cc: Shaz <shazalive@gmail.com>, linux-embedded <linux-embedded@vger.kernel.org>

>> Hi,
>>
>> I have been following "Re: [PATCH 0/1] Embedded Maintainer(s)" and
>> felt like asking that is there one good way to get a cross compiler
>> work. I tried buildroot, scratchbox and even openMoko with
>> openEmbedded but all of them had lots of issues and don't know which
>> will be the best alternative.
>
> There is no "one good way".  I've had decent success building Dan Kegel's
> "crosstool" in the past: http://www.kegel.com/crosstool/
>>
>> I also went through the material provided freely by Free Electron but
>> still I am not successful to build a custom kernel. Next I am trying
>> MontaVista's kit. I just wish I don't get lost.
>
> I'd continue the search for prebuilt toolchains.  CodeSourcery has a Lite
> version of it's ARM, Coldfire, MIPS, and Power toolchains.

I should have pointed this out before, but there is a useful Toolchains
wiki page here:  http://elinux.org/Toolchains

Feel free to contribute findings to that page.

>
>>
>> Anyways, I liked the idea of Qemu based cross compiler. Is it possible
>> for the inexperienced to get it working and emulate the exact model
>> and devices.
>>
>> --
>>
>> Shaz
>> --
>> To unsubscribe from this list: send the line "unsubscribe
>> linux-embedded"
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

