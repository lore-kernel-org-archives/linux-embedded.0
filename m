From: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: Using UART in kernel driver code on AT91SAM9260
Date: Wed, 24 Jun 2009 11:49:10 +0200
Message-ID: <8763em3qsp.fsf@macbook.be.48ers.dk>
References: <4A41EA93.2070904@gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:received:to:cc:subject
         :references:from:date:in-reply-to:message-id:user-agent:mime-version
         :content-type;
        bh=sAS/5PvNjg3Vn9epPOniKTn5Jn+ZnYjWSwNJZceU62Q=;
        b=QuEsZRpdJjP50vKZGTpfuuG41T6XPNoA8a9oODY/LmXTALJ3dzEbQus+gliGjaYfhd
         QwJ8MLyPqiFdm0CZ6AKf8D0TmmzxBx6VXpQznu4eAlkttkIyK0/B6ZqElfth7ChR7BPs
         FKEVSmDyxOq0O1L91L+tB8TDB0uJfC6esmDZg=
In-Reply-To: <4A41EA93.2070904@gmail.com> (Stefan Schoenleitner's message of "Wed\, 24 Jun 2009 10\:57\:55 +0200")
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Schoenleitner <dev.c0debabe@gmail.com>
Cc: linux-embedded@vger.kernel.org

>>>>> "Stefan" == Stefan Schoenleitner <dev.c0debabe@gmail.com> writes:

Hi,

 Stefan> There is the linux/drivers/char/atmel_serial.c driver which I
 Stefan> could modify, so that it also includes the driver code for
 Stefan> the speech codec.  However, obviously that would be a really
 Stefan> bad idea since it would duplicate code and completely bypass
 Stefan> the linux serial port abstraction layer.

 Stefan> It would be better to somehow write a speech codec driver
 Stefan> that depends on the UART driver.  Thus on the speech codec
 Stefan> serial port no ttySn device should be created by the UART
 Stefan> driver, but instead the speech codec driver should create the
 Stefan> device (e.g. /dev/speechcodec0).  Since the speech codec
 Stefan> driver should only do speech codec specific tasks, it should
 Stefan> use the UART driver to send and receive data over the serial
 Stefan> port.

The input layer has serio infrastructure for this (E.G. for serial
mice/touchscreens). Now, a speech codec doesn't have much to do with
input devices, but it atleast clearly seperates the lowlevel uart
communication from the speech codec handling.

Have a look in drivers/input/{serio,touchscreen}.

-- 
Bye, Peter Korsgaard
