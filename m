From: Andy Green <andy@warmcat.com>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi, lightweight
 bootloader
Date: Sun, 27 Dec 2009 09:54:51 +0000
Message-ID: <4B372EEB.2000902@warmcat.com>
References: <4B29EC68.1040109@0xlab.org> <20091222111250.GW22533@pengutronix.de> <4B3146E9.3010101@warmcat.com> <200912270117.18130.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:sender:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=EgKvuFwkxxu9iA++nsVLxhLaZzsw3a/A6tcTSWsaSUc=;
        b=lVO1T7fadoLFwitCIG7LfNCoKkDc0m8rXFukwVlEe9F76H8WR9Vzf3GuzrKMaFnkEe
         Y7lMnwJDv2sVdl8u6CqQ0KA5zYBVd9fvLvmMwtGqjHDX7y4rYpQAGhjMYnHcwalMVIyz
         akXspNmtuTeojzdDIID7zVb9Ihl6OxD7z7hl4=
In-Reply-To: <200912270117.18130.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rob Landley <rob@landley.net>
Cc: celinux-dev@tree.celinuxforum.org, Robert Schwebel <r.schwebel@pengutronix.de>, linux-embedded@vger.kernel.org

On 12/27/09 07:17, Somebody in the thread at some point said:

Hi Rob -

>> Fedora provides a whole solution there, with the restriction it's
>> designed for native build, not cross.
>
> QEMU: it's not just for breakfast anymore.

That's right Qemu often requires lunch, teatime and supper too to build 
anything :-)

Newer ARM platforms like Cortex8+ and the Marvell Sheevaplug will 
outstrip emulated performance on a normal PC.  There are 2GHz multi-core 
ARMs coming as well apparently.  So I took the view I should ignore Qemu 
and get an early start on the true native build that will be the future 
of "native build" as opposed to cross due to that.

The point of the distro is you just let them build the bulk of it, just 
installing binary packages.  You're only rebuilding the bits you are 
changing for your application.  For a lot of cases that's a few small 
app packages that are mainly linking against stuff from the distro and 
they're not too bad to do natively.  (In addition my workflow is to edit 
on a host PC and use scripts to teleport a source tree tarball to the 
device where it's built as a package every time and installed together 
with its -devel, so everything is always under package control).

-Andy
