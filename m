From: "Linus Walleij" <linus.ml.walleij@gmail.com>
Subject: Re: building Rootfs
Date: Wed, 9 Jul 2008 02:14:04 +0200
Message-ID: <63386a3d0807081714x5bbf1f03l3c108adc8243f6d7@mail.gmail.com>
References: <BAY131-W252EE4B85EEB3F7A87466FE2940@phx.gbl>
	 <4871E98F.8030802@gmail.com> <20080707181018.GG4319@pengutronix.de>
	 <63386a3d0807071334q2242ac45x540cee2a3fcb231b@mail.gmail.com>
	 <20080707212150.GK4319@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=PeVYAenaPByryx8J1VeCKVZhrS/NURxkdnb7WqPLei0=;
        b=Zx1oK2nKLDuzbrQz6AILKrG1fckOD1mlDH/6yIlKM8rZfB6fvBk29/Sdys3VYcBxnL
         pLhe9kgH0mlMfATcos2w6Ki08TIj1rXXH5Q6l6Lbx8U72UOW5TWGsIo8twlMHMnctejJ
         HG2P1BmgQEWmhZb0Y1xmxSDauf1BPp8iEVw9g=
In-Reply-To: <20080707212150.GK4319@pengutronix.de>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robert Schwebel <r.schwebel@pengutronix.de>, linux-embedded@vger.kernel.org

2008/7/7 Robert Schwebel <r.schwebel@pengutronix.de>:

> On Mon, Jul 07, 2008 at 10:34:11PM +0200, Linus Walleij wrote:

>> Robert, can you brief us of how ptxdist fits together with
>> OpenEmbedded? What does these two projects actually share? Where do
>> they do similar things in parallel for example?
>
> They are both build systems for userlands, or whole embedded linux
> systems. I cannot speak for OE as I don't really know it in detail.

Anyone have experience with both? I'd really like to have them
contrasted and, well you know, cross-firtualized.

> The idea behind ptxdist is executable documentation.

I really like ptxdist, especially it is beautiful that you have
based it around just bash and make plus some crosscompiler
of choice. I just have some trouble getting it to do what
I want. I'll hopefully get there. This is not meant as any generic
complaining. I'm trying to figure out if ptxdist or openembedded
is the best starting point.

I have a situation where the build system would be on top
of some SCM like git, CVS or whatever and packages being
checked out and worked on by several people daily.
This seems to clash with ptxdist design goals,
for example:

ptxdist seems
* hardcoded to run in a users home directory
  with projects in $HOME/foo (stopped me
  right now, perhaps it can easily be fixed or is
  already part of ptxdist 2?)
* assume only one person builds rootfs. So
  it doesn't really want the project tree to be used
  or modified by more than one person at the time.
  (Same as first more or less.)
* not store source code, patches and config plus my
  local additions in one place. For most other package
  systems e.g. RPM there is
  /foo/foo.spec
  /foo/foo-1.0.tar.gz
  /foo/foo-patch1.diff
  /foo/foo-patch2.diff
  /foo/my-foo-config.file

In ptxdist these seem to be spread out, some in the installation
of ptxdist itself in say /usr/lib/ptxdist/patches, /usr/lib/ptxdist/...
then in my project space $HOME/project/... etc.

I believe at archivicing time everything including ptxdist itself
is zipped up and archived on one storage media. But I need to
keep all files relating to a package in one place while developing,
and living like that for a long time. Since /usr/lib/ptxdist isn't even
being backed up normally, only NFS mounts like /home, I then
need to move the entire ptxdist into the SCM, which it clearly
doesn't like without a lot of hacking, plus, how would I
upgrade it?

OK this is a bit picky. And perhaps I can fix it all and merge
back. Just trying to decide.

Linus
