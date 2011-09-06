From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCHv3] UBI: new module ubiblk: block layer on top of UBI
Date: Tue, 06 Sep 2011 07:10:03 +0300
Message-ID: <1315282208.19067.24.camel@sauron>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	<201108241823.20904.arnd@arndb.de> <1314256010.18988.18.camel@sauron>
	<201108251712.40894.arnd@arndb.de> <1315280704.19067.14.camel@sauron>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=subject:from:reply-to:to:cc:date:in-reply-to:references
	:content-type:x-mailer:content-transfer-encoding:message-id
	:mime-version; bh=DaCSirDznfwla2LxOC+lEYvgeV3WC6hnjuoYW+L0ixs=;
	b=CsU2uVCGnY5u+KRFKEwm+ry+s1EElJXV46oCyQupIruLXzWsN4+jIH+LoIJ/m4rLOE
	bm8zFfbTssQTJRdhmzovoq8wCC9dCZ9To2gHzJdpvSIbC59CsGiAoKk6LkPGvCrLcrsT
	XK9w8jy7Ge5rP+1GnzMmCxMua6BFrPPqpb1y0=
In-Reply-To: <1315280704.19067.14.camel@sauron>
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, david.wagner@free-electrons.com, lkml <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, Tim Bird <tim.bird@am.sony.com>, David Woodhouse <dwmw2@infradead.org>

On Tue, 2011-09-06 at 06:44 +0300, Artem Bityutskiy wrote:
> > It's not a dummy bus, in this approach it would be a the bus that gets
> > used by all ubiblk devices, which is a very common concept by itself.
> > It's more like the classic understanding of a 'device class' that Greg
> > wants to see get replaced by bus_types in the kernel.
> 
> Yes, this sounds OK. Although UBI already has notifiers, so we could
> just add 2 more events.

Hmm, with notifications the error handling becomes a problem - we want
the ioctls for creating/removing the block device to be synchronous,
and, should an error occur, we want to return the error code to the
user-space. So the existing notifications mechanism does not work well.

Not sure about the bus approach - David, could you take a look at it
please? If we can handle errors there - then we could indeed re-use the
UBI control device. We could even re-use the ioctl data structures for
UBI volumes creation/removal - we have plenty of space there reserved
for future extensions.

-- 
Best Regards,
Artem Bityutskiy


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
