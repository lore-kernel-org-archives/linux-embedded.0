From: Raffaele Recalcati <lamiaposta71@gmail.com>
Subject: Re: CELF Project Proposal - Feasibility analisys of Android 
	introduction in a completely tested industrial device
Date: Mon, 28 Dec 2009 17:26:22 +0100
Message-ID: <ade1bdc0912280826w37c209bera8122a5d4c656e3c@mail.gmail.com>
References: <ade1bdc0912180814m7fd3c02cp7d99a1943c2da37e@mail.gmail.com>
	 <ade1bdc0912190746h320ef36fpc01f3976d78aae65@mail.gmail.com>
	 <4B30250E.5010505@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=h+bFhAAVvv4DubGgCCkhv+g8sf29BE+qUi2IYLpPGXQ=;
        b=drKjiJzTMw3FTukT1p6j3T/mFiAduvue2F888TZE1CpbbIowP0Z4sGsY6xVulc14zz
         Fv1KVDLLCZv07uHrTqfPIPKhfSQYEq4VLYe887PCGFP2Qhu0OIs0ce3EVgE/GQYLlVf4
         1BG3/c3u8GYiUnUP3qF1K+liHj+2jIGuf+zBU=
In-Reply-To: <4B30250E.5010505@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@am.sony.com>
Cc: CE Linux Developers List <celinux-dev@tree.celinuxforum.org>, linux-embedded <linux-embedded@vger.kernel.org>

Raffaele Recalcati wrote:
> 2009/12/18 Raffaele Recalcati <lamiaposta71@gmail.com>:
>> Summary: Feasibility analisys of Android introduction in a completely
>> tested industrial device.
>>
>> Description: By now Android has been ported to 600Mhz Cortex A8 cpu or similar.
>> The declared Android requirements are instead lower, about 200Mhz Arm9
>> cpu with 100Mhz Ram bus.
>> So I think the growing interest in this O.S. lacks some porting to
>> less powerful cpus.
>> The reasons to do this porting are commercial because of Google market
>> power, but are also technnical, because Android debugging environment
>> is very nice for not embedded developers.
>> This could help the diffusion of opensource embedded Linux.
> This is interesting.  Can you let me know if the focus of this work
> is to experiment with the lower bounds of Android scalability, or
> whether the focus is on Android use in industrial devices?
>
> If the latter, than it would be good to hear more about what might
> be needed to extend (or reduce :-) ) Android to fit this market.
>
> I'll add a proposal for this, but I'd like to hear more to clarify
> the proposal.
>
> Thanks,
>  -- Tim
>
> =============================
> Tim Bird
> Architecture Group Chair, CE Linux Forum
> Senior Staff Engineer, Sony Corporation of America
> =============================
>
>

Looking at

http://git.kernel.org/?p=linux%2Fkernel%2Fgit%2Ftorvalds%2Flinux-2.6.git&a=search&h=HEAD&st=commit&s=android

my idea seems to be ... not very good at all !!

What do you think?
I'm not a kernel mainline developer so I don't understand the real meaning.
Below there is my new proposal, but before accepting it please hear
this new idea, that could be better and possible to be used also in
2.6.33 kernel:
"Adding to Maemo or Debian or Gentoo embedded systems a debugging
environment similar to Android: I mean the possibility to connect to a
single debugging "server" and, in a graphical very easy (Eclipse or QT
Creator) way, connecting the gdb to the desired process, or, see
rootfs, or tracing cpu usage, ..."
What I really like of Android is the fantastique environment, with the
emulator that can do step by step debugging....


---------------------------------------------------------
Summary: Feasibility analisys of Android introduction in a completely
tested industrial device.

Description: Android is a new important graphic interface and a java
virtual machine optimized for
embedded devices.
The Android breaking feature in respect of traditional GNU Linux
embedded operating systems has
discouraged the possibility to enhance an already existing GNU Linux
embedded industrial device
with at least the Android's graphic interface.

By now Android has been fully ported to Cortex A8 cpus starting new
mobile phone projects from
scratch.
The reasons to do this work are commercial because of Google market
power, but are also technical,
because Android debugging environment is very nice for not embedded developers.
This could help the diffusion of opensource embedded GNU Linux in a
wider point of view.

The work should be maybe against the 2.6.31 kernel.
The idea is to preserve industrial tested development but adding
Android graphical interface and
debugging features.
The cpu dependency of the porting will be as small as possible.
The most important kernel interfaces will be investigated, at least
framebuffer for tft lcd,
touchscreen, audio ac97 interface, usb host for usb pen.

Related work:
 * Android Porting - http://www.kandroid.org/<wbr></wbr>android_pdk/
 * Android Pxa270 - http://android-pxa270.sourceforge.net/

Scope:
This should take more than 1 month for feasibility analysis.
------------------------------------------------------

-- 
www.opensurf.it
