From: "Bart Van Assche" <bart.vanassche@gmail.com>
Subject: Re: prevalence of C++ in embedded linux?
Date: Wed, 30 Jul 2008 13:04:10 +0200
Message-ID: <e2e108260807300404r65bfb2b2xfb07687601dc59da@mail.gmail.com>
References: <alpine.LFD.1.10.0807281142430.4286@localhost.localdomain>
	 <200807290951.34563.neundorf@eit.uni-kl.de>
	 <1217319612.24988.15.camel@spike.firmix.at>
	 <200807291058.06240.neundorf@eit.uni-kl.de>
	 <1217324838.24988.41.camel@spike.firmix.at>
	 <556445368AFA1C438794ABDA8901891C092D3CF7@USA0300MS03.na.xerox.net>
	 <e2e108260807292146n581b655an3119be9e33af871c@mail.gmail.com>
	 <20080730102523.GB8992@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=CkQIFH9RdYADYHpTVM34qjp0oUHK4AwmAsMZqgBQQAo=;
        b=AZFDHoIbWLcJArqjTr6hl/ZziiR5UcyDdoSb1HP1yPurTK+sGww00xpFFGrE8VB4ow
         NiOvQgTtXsyi2EKArOAHMPF0uquHuWq6IDEjiqDe+DNyZCTo4kNbE25hguvf6iSgov62
         Op5nqWp5MYPg42e4apffbUql5fsfATKwsHKnE=
In-Reply-To: <20080730102523.GB8992@shareable.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: "Leisner, Martin" <Martin.Leisner@xerox.com>, Bernd Petrovitsch <bernd@firmix.at>, Alexander Neundorf <neundorf@eit.uni-kl.de>, linux-embedded@vger.kernel.org

On Wed, Jul 30, 2008 at 12:25 PM, Jamie Lokier <jamie@shareable.org> wrote:
> Bart Van Assche wrote:
>> On Tue, Jul 29, 2008 at 10:08 PM, Leisner, Martin
>> <Martin.Leisner@xerox.com> wrote:
>> > If you're embedded device has a window system, than a language like C++
>> > is fine...But...
>>
>> C++ is suited for much more than just windowing systems. A good
>> example is the GOLD project, a linker for ELF files. GOLD is a rewrite
>> of the GNU linker (ld). See also
>> http://google-opensource.blogspot.com/2008/04/gold-google-releases-new-and-improved.html.
>
> Is C++ intrinsic to GOLD's linking superiority over ld?  Or was it
> chosen because the author fancied using it?  (I don't know).

I don't know whether C++ is intrinsic to GOLD's linking superiority.
The reason I cited the GOLD project is because of the programming
style of the GOLD source code. A quote from
http://lwn.net/Articles/274859/, about the GOLD source code:

I looked through the gold sources a bit. I wish everything in the GNU
toolchain were written this way. It is very clean code, nicely
commented, and easy to follow. It shows pretty clearly, I think, the
ways in which C++ can be better than C when it is used well.

Bart.
