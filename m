From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCHv3] UBI: new module ubiblk: block layer on top of UBI
Date: Thu, 8 Sep 2011 17:26:00 +0200
Message-ID: <201109081726.00769.arnd@arndb.de>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	<1315280704.19067.14.camel@sauron>
	<1315282208.19067.24.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1315282208.19067.24.camel@sauron>
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
To: dedekind1@gmail.com
Cc: linux-embedded <linux-embedded@vger.kernel.org>, david.wagner@free-electrons.com, lkml <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, Tim Bird <tim.bird@am.sony.com>, David Woodhouse <dwmw2@infradead.org>

On Tuesday 06 September 2011, Artem Bityutskiy wrote:
> Not sure about the bus approach - David, could you take a look at it
> please? If we can handle errors there - then we could indeed re-use the
> UBI control device. We could even re-use the ioctl data structures for
> UBI volumes creation/removal - we have plenty of space there reserved
> for future extensions.

I would generally recommend using new ioctl commands. ioctl numbers
are cheap, but complexity in data structures is not, because every
user who wants to deal with the data structures has to understand
them. Also, changing the ABI is always tricky since you have to
provide backward and forwards compatibility with existing kernels
and with existing user space.

	Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
