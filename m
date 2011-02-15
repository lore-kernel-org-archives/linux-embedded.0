From: Florian Fainelli <florian@openwrt.org>
Subject: Re: Minimal x86 memory requirements
Date: Tue, 15 Feb 2011 11:04:48 +0100
Message-ID: <201102151104.48976.florian@openwrt.org>
References: <4D59C9D5.4080909@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:from:to:subject:date:user-agent:cc
         :references:in-reply-to:organization:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=6cnolSeV+n15gw2zZgfMIKgVEzo/GOp1yjRO+OAhr10=;
        b=a4SCQ9/juEtEECZjCFvaUIj0QrtJU4bFF12ocTPRKagMbCGUyqE8SOhHZj/nduSBRu
         /ccURNOiLH1dmp94DlHCK2x9HUmitXa3QFor+r8wrlPw5iMDfrebBDNnrgKBtXfhe4FZ
         abAuT/NyXc+yxKFPsYCAaWU+jXXtVAMHCBR84=
In-Reply-To: <4D59C9D5.4080909@linux.intel.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Darren Hart <dvhart@linux.intel.com>
Cc: linux-embedded@vger.kernel.org

Hello,

On Tuesday 15 February 2011 01:33:25 Darren Hart wrote:
> I'm looking to build a bare minimum x86 kernel that will boot and run
> busybox, nothing else (and eventually less than that). Assuming I do
> need USB-HID, IDE, and basic TCP/IP, what should I expect to be the
> least RAM I could get away with just to boot off flash, get a getty,
> login, and take a few directory listings.
> 
> If anyone would like to point me where to RTFM, that would be
> appreciated as well :-)

OpenWrt runs currently on a RDC R-321x System-on-Chip which is i486 based [1] 
and usually designed with 16MB of RAM, the bzImage itself is around 768KB w/ 
the following features built-in:

- TCP/IP networking
- MTD support for CFI compatible NOR flashes
- JFFS2/squashfs filesystem

When I load additionnal modules to be able to do NAT/USB/FAT filesystems for 
instance, plus having must have daemons running (dnsmasq, dropbear, busybox, 
hostapd ...), I still have around 3MB of available RAM (for a 16MB RAM 
device). The filesystem itself is compressed using squashfs+lzma, and fits 
within 3MB (loadable modules are inside, usable image at [2]).

So from my perspective, you should be able to do all of this with a 16MB RAM 
device, plus 4 to 8MB of Flash to be confortable with storing your filesystem.

Hope that helps.

[1]: http://wiki.openwrt.org/oldwiki/openwrtdocs/hardware/airlink101/ar525w
[2]: http://downloads.openwrt.org/backfire/10.03.1-rc4/rdc/openwrt-rdc-
squashfs-ar525w.img
--
Florian
