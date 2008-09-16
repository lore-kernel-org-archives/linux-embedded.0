From: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Tue, 16 Sep 2008 08:57:43 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0809160856190.5966@lnxricardw.se.axis.com>
References: <20080915163421.GA13631@shareable.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20080915163421.GA13631@shareable.org>
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Jamie Lokier <jamie@shareable.org>
Cc: "cotte@de.ibm.com" <cotte@de.ibm.com>, Greg Ungerer <gerg@snapgear.com>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "nickpiggin@yahoo.com.au" <nickpiggin@yahoo.com.au>, =?iso-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>, "Linux-kernel@vger.kernel.org" <Linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, "tim.bird@am.sony.com" <tim.bird@am.sony.com>


On Mon, 15 Sep 2008, Jamie Lokier wrote:

> This is all very interesting - I had no prior experience with NOR, so
> didn't know that 0.6MB/s was slow.  It's fast compared with older
> EEPROMs after all, and had imagined that people wanting fast flash
> would use NAND.
>

NAND is significantly faster when writing than NOR, read speed is of the =

same magnitude, possibly slower in many cases.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
    "With Free Software you are employing the best programmers on the plane=
t"

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
