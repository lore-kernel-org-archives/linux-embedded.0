From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Subject: Re: LZMA inclusion
Date: Wed, 3 Dec 2008 21:45:40 +0100
Message-ID: <20081203204540.GD8563@mx.loc>
References: <492BA3FA.9010204@openwrt.org> <4936DFCD.2010204@am.sony.com> <20081203195852.GB8563@mx.loc> <20081203202009.GA6790@uranus.ravnborg.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=w+dxMFpRZHpTJmsTRK4+/IyulQTdEUPQIjKih4igzWg=;
        b=NzczE0CUmiC3GPT4NmRsEXcoyhZffOKwU9oY2PsAqiVpxW7FOyKgI21Tx48yq8Kmya
         8uE03srXOESOXST3m8KfeiMga3qkS+ND1NzcowRMBEM74lnsruCCJv/Pkqv2jMCiAj8P
         Le+wtA/pGUBz+pKbZGGgfoaX11/gmN8V8jurU=
Content-Disposition: inline
In-Reply-To: <20081203202009.GA6790@uranus.ravnborg.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Tim Bird <tim.bird@am.sony.com>, lasse.collin@tukaani.org, glp@openwrt.org, linux-embedded@vger.kernel.org

On Wed, Dec 03, 2008 at 09:20:09PM +0100, Sam Ravnborg wrote:
>On Wed, Dec 03, 2008 at 08:58:52PM +0100, Bernhard Reutner-Fischer wrote:
>> On Wed, Dec 03, 2008 at 11:36:45AM -0800, Tim Bird wrote:
>> >Gregers Petersen wrote:
>> >> There was a small talk a few days ago involving a few of the OpenWrt
>> >> developers and David Woodhouse. One of the topics discussed, was a
>> >> question about the potential of including LZMA in the kernel.
>> >> Such an inclusion would be quite benefitial in terms of embedded
>> >> systems, but the major hurdle seems to be the code quality of LZMA itself.
>> >> This leads to the question I would like to raise; are there ongoing
>> >> plans (or considerations) to rewrite and merge LZMA, and has anyone
>> >> started working on it in practical terms?
>> >
>> >Did anyone answer this?  CELF is currently considering funding
>> >a project to do this (add LZMA support to the kernel), and
>> >it would be good to get a feel for the current status...
>> > -- Tim
>> 
>> AFAIK xz will be/is incompatible with this older LZMA, perhaps
>> larhzu wants to chime in on that.
>> 
>> PS: A previous incarnation of that patch didn't work conventiently
>> for me, i had to do some small adjustments to the way it was put
>> into the kernel configury, like
>> http://repo.or.cz/w/buildroot.git?a=blob_plain;f=toolchain/kernel-headers/lzma/linux-2.6.22.1-002-lzma-vmlinuz.01.patch;hb=HEAD
>> http://repo.or.cz/w/buildroot.git?a=blob_plain;f=toolchain/kernel-headers/lzma/linux-2.6.22.1-003-lzma-vmlinuz.patch;hb=HEAD
>
>If these are required with latest kernel could I then ask you to
>properly submit them to: linux-kbuild@vger.kernel.org

AFAIK neither lzma nor xz support was accepted yet and i did not look
if those patchlets are still required for the currently proposed
xz or lzma support.
>
>No need to have good patches sitting at random places.

Of course not, agree. I certainly don't fancy accumulating random
patches for my own personal use, at any rate.

PS: Not sure if you, Sam, are the right person who cares for it, but
i think that the help-text and actual accepted arguments of
scripts/kconfig/lxdialog/check-lxdialog.sh are out of sync.


PPS: I did not verify if this is still the case, but I have this
comment as a reminder for a small issue with "archprepare" versus
headers_install, fwiw. It would be very handy if i could fuse those
two into a simple "make ... archprepare headers_install":
        # some arches need archprepare
        # FIXME: WTH! archprepare does not honour INSTALL_HDR_PATH
        -(cd $(LINUX_HEADERS_UNPACK_DIR); \
         $(MAKE) ARCH=$(KERNEL_ARCH) \
                HOSTCC="$(HOSTCC)" HOSTCFLAGS="$(HOSTCFLAGS)" \
                HOSTCXX="$(HOSTCXX)" \
                KCONFIG_CONFIG="$(LINUX_HEADERS_DIR)/.config" \
                INSTALL_HDR_PATH=$(LINUX_HEADERS_DIR) \
                archprepare \
        )
        (cd $(LINUX_HEADERS_UNPACK_DIR); \
         $(MAKE) ARCH=$(KERNEL_ARCH) \
                HOSTCC="$(HOSTCC)" HOSTCFLAGS="$(HOSTCFLAGS)" \
                HOSTCXX="$(HOSTCXX)" \
                INSTALL_HDR_PATH=$(LINUX_HEADERS_DIR) \
                headers_install \
        )
