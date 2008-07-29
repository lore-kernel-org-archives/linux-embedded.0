From: "Richard Danter" <radanter@googlemail.com>
Subject: Re: prevalence of C++ in embedded linux?
Date: Tue, 29 Jul 2008 12:39:56 +0100
Message-ID: <f75c52840807290439r5638f987yec53ba63817939e8@mail.gmail.com>
References: <alpine.LFD.1.10.0807281142430.4286@localhost.localdomain>
	 <488EC964.2030400@coritel.it>
	 <e2e108260807290150tabb95d8vd080c069aab5d24@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=sVI8SHJSAPGE6tcWva2WVJ9EL6o+xPnbxze1bP8v1Cg=;
        b=ap+srTuqP0dPFS16YLs01QzMsMRMfF/syG70Vj2Gr8+H8gT+49fOqB6DI/HNjuzbqX
         iEHHS+hznSkVjsgUkxGfvP3/QudIWxbI1d/tC9/Dc7vI5hg8It3do3SspEpvVGI1VzdF
         RnsweQd6EOAlIx/BYgJPyGeAzkgg/H+sDUUpM=
In-Reply-To: <e2e108260807290150tabb95d8vd080c069aab5d24@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bart Van Assche <bart.vanassche@gmail.com>
Cc: Marco Stornelli <marco.stornelli@coritel.it>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>

2008/7/29 Bart Van Assche <bart.vanassche@gmail.com>:
> On Tue, Jul 29, 2008 at 9:40 AM, Marco Stornelli
> <marco.stornelli@coritel.it> wrote:
>> Like Linus Torvals said "...C++ is an horrible language" :)
>
> Some C++ language features are indeed not very elegant from a
> language-theoretic standpoint. But that doesn't matter when writing
> embedded software -- what matters is that C++ allows to make source
> code a lot more readable than the C programming language. And if you
> don't like the overhead introduced by features like exceptions or
> RTTI, you can still pass -fno-exceptions -fno-rtti to gcc.

IMHO choosing a language is like choosing any other tool to get a job
done. I wouldn't use a screwdriver to bang in a nail (um, actually, I
have and it ruined my screwdriver so I won't do it again) and same
goes for programming languages.

For low-level programming, such as kernels and device drivers, C and
some assembly is probably the right choice in most cases. That is not
to say that C++ or any other language could not be used. I know of at
least one OS written almost entirely in C++ (drivers were objects that
could be passed between devices to help them communicate with each
other, very neat).

Looking at something like graphics programming C++ makes a lot more
sense. It is natural to think of a window inheriting properties from
the widgets that implement it's functionality. Qt and wxWidgets are
good examples, or Swing for Java. But of course Motif and GTK are
written in C and work perfectly well too. I'm not sure how easy it is
to "inherit" in GTK but vaguely remember it was not exactly trivial in
Motif. To me at least C++ makes more sense here.

Scripts also have a very important role. I am probably in the minority
when I say that I like Tcl, but used for it's original purpose it is a
very useful language. There are many cases where I would chose to use
Tcl or Perl or sh scripts rather than C, C++ or Java.

The resources of the target system are also important. Many "embedded"
systems these days are as powerful, if not more so, than my laptop.
For these systems you have a lot of freedom. For others there may be
limited RAM, disk space or other resources. I am often asked about
removing Perl from the systems my customers use because of the large
disk footprint.

So let's not be too hasty to label any language as bad. Each was
developed to address a need. Trying to use the wrong language for a
particular purpose is the bad thing.

Rich
