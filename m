From: Stefan Schoenleitner <dev.c0debabe@gmail.com>
Subject: Re: Using UART in kernel driver code on AT91SAM9260
Date: Wed, 24 Jun 2009 11:49:13 +0200
Message-ID: <4A41F699.6000806@gmail.com>
References: <4A41EA93.2070904@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4A41EA93.2070904@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Stefan Schoenleitner wrote:
> It would be great if you could provide some links to documentation and
> example code.

I just found out that there are other kernel drivers using the serial
port as well (e.g. the SLIP or PPP drivers).
It seems that what I want to do (which is accessing the serial port from
kernel space) is called a "line discipline".

I found an article "Writing a Kernel Line Discipline" with code snippets
on http://www.linux-mag.com/id/1891
(You can find a login to this page here: http://www.bugmenot.com)

Is this the right way to go ?
