From: Ben Nizette <bn@niasdigital.com>
Subject: Re: x11 fails with floating point exception
Date: Sun, 08 Jun 2008 20:27:57 +1000
Message-ID: <1212920877.4089.22.camel@moss.renham>
References: <a1d91fa0806080307l64175a61i14cfb205081dd878@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <a1d91fa0806080307l64175a61i14cfb205081dd878@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mohammed shareef <mdshareef@gmail.com>
Cc: linux-embedded@vger.kernel.org


On Sun, 2008-06-08 at 15:37 +0530, mohammed shareef wrote:
> Hi,
> 
> i am new to linux.
> 
> when i compile x-windows, the xlib--X11 fails with a floating point exception.

These are generally things like divide-by-zero.  It is a problem with
the makekeys script there, nothing to do with the linux kernel or
embedded space in general so this isn't the right list :-)

Try an X11 mailing list.

--Ben.

