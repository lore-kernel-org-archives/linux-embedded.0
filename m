From: Stefan Schoenleitner <dev.c0debabe@gmail.com>
Subject: Re: Using UART in kernel driver code on AT91SAM9260
Date: Wed, 24 Jun 2009 11:59:41 +0200
Message-ID: <4A41F90D.6040103@gmail.com>
References: <4A41EA93.2070904@gmail.com> <8763em3qsp.fsf@macbook.be.48ers.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <8763em3qsp.fsf@macbook.be.48ers.dk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Hi,

Peter Korsgaard wrote:
> The input layer has serio infrastructure for this (E.G. for serial
> mice/touchscreens). Now, a speech codec doesn't have much to do with
> input devices, but it atleast clearly seperates the lowlevel uart
> communication from the speech codec handling.
> 
> Have a look in drivers/input/{serio,touchscreen}.

thanks for the tip !
I'm looking to find some more serio documentation now.

If it won't work out, I guess I still have the possibility to write a
line discipline.
However, using serio seems to be more comfortable (also from a useeland
perspective).

cheers,
stefan
