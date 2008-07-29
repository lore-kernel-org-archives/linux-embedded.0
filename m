From: "Bart Van Assche" <bart.vanassche@gmail.com>
Subject: Re: prevalence of C++ in embedded linux?
Date: Tue, 29 Jul 2008 10:50:46 +0200
Message-ID: <e2e108260807290150tabb95d8vd080c069aab5d24@mail.gmail.com>
References: <alpine.LFD.1.10.0807281142430.4286@localhost.localdomain>
	 <488EC964.2030400@coritel.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=pliLQUdClA8lWtyyXjydoChQkEfFgrkdgRL+nmlmjRg=;
        b=oFCG6VZ4NJkLd3+c4XhVFEaGtjxDQ87HMmWdDiS1hbW1N6fi4zn8+RR0tmI24ryQjT
         MAlzBNyrDmK0ETxhC/ubiB4oR80hppKl6bEQ57X0wiLyT4bIg8z51RQc0pXCUT93D4OJ
         EnjWT2A1sozw1B+ND2Ao71/Bfyd46lUE7TQqI=
In-Reply-To: <488EC964.2030400@coritel.it>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marco Stornelli <marco.stornelli@coritel.it>
Cc: Embedded Linux mailing list <linux-embedded@vger.kernel.org>

On Tue, Jul 29, 2008 at 9:40 AM, Marco Stornelli
<marco.stornelli@coritel.it> wrote:
> Like Linus Torvals said "...C++ is an horrible language" :)

Some C++ language features are indeed not very elegant from a
language-theoretic standpoint. But that doesn't matter when writing
embedded software -- what matters is that C++ allows to make source
code a lot more readable than the C programming language. And if you
don't like the overhead introduced by features like exceptions or
RTTI, you can still pass -fno-exceptions -fno-rtti to gcc.

Bart.
