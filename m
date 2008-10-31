From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH] phylib: mdio-ofgpio ---> mdio-gpio
Date: Fri, 31 Oct 2008 10:26:11 -0700
Message-ID: <200810311026.12585.david-b@pacbell.net>
References: <20081031155335.19905.14186.stgit@Programuotojas.82-135-208-232.ip.zebra.lt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20081031155335.19905.14186.stgit@Programuotojas.82-135-208-232.ip.zebra.lt>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk, linux-embedded@vger.kernel.org, Laurent Pinchart <laurentp@cse-semaphore.com>, Grant Likely <grant.likely@secretlab.ca>, Mike Frysinger <vapier.adi@gmail.com>

On Friday 31 October 2008, Paulius Zaleckas wrote:
> - if NO_IRQ is not defined define it to 0

Better yet, stop using that symbol entirely...

