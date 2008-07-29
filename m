From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Subject: Re: prevalence of C++ in embedded linux?
Date: Tue, 29 Jul 2008 07:42:18 +0200
Message-ID: <e4c675870807282242y112a3477nab5ff520637f0485@mail.gmail.com>
References: <alpine.LFD.1.10.0807281142430.4286@localhost.localdomain>
	 <1217281654.3546.16.camel@moss.renham>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=hozUUfObg2yXLCk7m8DgYaWgLrIJZ6nOQ3jY0b9wb6Q=;
        b=AF3hfAeIPZMtj/d3aBqhu13OyRzFQDIsenHnbShDwWUwEuWeOWjR/ameTei//ooJGh
         5RwdA1XGerFQ6ByoMpINy3+g8fSbnXrLLgzYIRx/iTED0hzegX434v6VCl0TzqIlkLOR
         nmlpWo3RCVx5BuUdjbuW/4NsM+T+28c/N4RXM=
In-Reply-To: <1217281654.3546.16.camel@moss.renham>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ben Nizette <bn@niasdigital.com>
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>

2008/7/28 Ben Nizette <bn@niasdigital.com>:
>
> On Mon, 2008-07-28 at 11:43 -0400, Robert P. J. Day wrote:
>> just curious -- how many folks are working in C++ in their embedded
>> linux work?
>

 [cut]

> Of course a largish number don't really need to write any code at all.
> They just need to wire up existing programs to do what they want then
> maybe glue a bit of PHP between that and the user so it doesn't /look/
> like Linux from the outside.
>

 Apart kernel space and its modules I use C and shell script for
gluing all togheter!
 In the last project I used 4423 lines of shell script as glue for C
applications.
 :-)

 Cheers,
-- 
/roberto
http://www.roberto.foglietta.name/work
