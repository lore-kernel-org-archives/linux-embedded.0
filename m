From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 02/10] AXFS: Kconfig and Makefiles
Date: Thu, 21 Aug 2008 13:24:22 +0200
Message-ID: <200808211324.22989.arnd@arndb.de>
References: <48AD00DF.9080207@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48AD00DF.9080207@gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jaredeh@gmail.com
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?iso-8859-1?q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

On Thursday 21 August 2008, Jared Hulbert wrote:
> The Kconfig edits and Makefiles required for AXFS.
> 
> Signed-off-by: Jared Hulbert <jaredeh@gmail.com>

If you split out this patch separate from the files, please make it the
*last* patch so that you cannot get build errors during a later git-bisect
through the middle of your series.

	Arnd <><
