From: "Linus Walleij" <linus.ml.walleij@gmail.com>
Subject: modules.dep and depmod.pl
Date: Sat, 14 Jun 2008 01:33:21 +0200
Message-ID: <63386a3d0806131633g4721216al566c8b6959e4631@mail.gmail.com>
References: <63386a3d0806131611g61ad6ab1t16bc68ab6407a8dc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=lb6ZnRvasv3BeMl8NGht1WDoevS1lb0DRjJ7mhp6TUI=;
        b=RUJAw0bPe7fsmPPJM6sPzm6Ar2a8jzQrFlZKb2zXu56MEI6O2EfVoI40Vnz9Qczmvl
         lEp9vyLSkLFyRA5257hVAm+A/cAh9EpvFWB+oORQ9XcwcXt/WHGIDMHuUoy5k9dG849X
         kEmhR6RkjN+26LB2/y2cu5HP/1xu7Rznz9tjQ=
In-Reply-To: <63386a3d0806131611g61ad6ab1t16bc68ab6407a8dc@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Hi,

what are other embedded developers experience with using the
script "depmod.pl" from BusyBox to create
installdir/lib/modules/<version>/modules.dep
during compile-time?
(It's this beast:
http://busybox.net/cgi-bin/viewcvs.cgi/trunk/busybox/examples/depmod.pl?rev=20447&view=markup

I tried this thing to be able to modprobe off a read-only flash
rootfilesystem and it "sort of" works, actually.

However there is no way you will pass this to the kernel DEPMOD
parameter, I only ever get this to work when doing it after
compilation, as a separate step.

Is there anyone beside me who would like to see this integrated
into scripts/ in the kernel to get some default modules.dep for
a read-only rootfs also when doing cross compilation, or am I
totally going down the wrong lane here?

Yours,
Linus Walleij
