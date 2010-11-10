From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: Avoiding platform-specific callbacks in drivers?
Date: Tue, 9 Nov 2010 22:17:31 -0600
Message-ID: <AANLkTikeayhP_=AeJAgKXwW1TJfD-MZrDh_dcq9r2WQS@mail.gmail.com>
References: <AANLkTinG4y_Uxes0CJYMH+uwr1TcWwjQy+4+_ftyrnML@mail.gmail.com>
	<4CD9E125.2010207@kcomputing.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4CD9E125.2010207@kcomputing.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin Dankwardt <k@kcomputing.com>
Cc: linux-embedded@vger.kernel.org

Kevin:


On Tue, Nov 9, 2010 at 6:02 PM, Kevin Dankwardt <k@kcomputing.com> wrote:
> Isn't the general approach to avoid platform-dependencies to abstract the
> behavior? As is used throughout the kernel, an "operations" struct that
> provides the abstractions and each driver fills in its implementation as
> required. The "polymorphism" approach. Maybe the operations are
> "begin_suspend()" and "end_suspend()" and in this case the functions twiddle
> a GPIO pin?

The begin_suspend()/end_suspend() approach just moves the problem, really.

Unless you put those function pointers into the platform data, you
can't change them without touching the driver code.  And if you do put
those function pointers into the platform data, that seems an awful
lot like open-coding.  Gets the job done, but seems a fairly blunt
instrument.

In my case, the device model itself already provides the answer.  The
"GPIO twiddling" can be dealt with by implementing a pseudo-device
that registers the actual device underneath it.  Then the pseudo
device neatly gets the suspend/resume events at the right times
relative to the device.  AND you get the benefits of sysfs and debugfs
for free.

I knew the answer was there; it just took an expert like Nicolas Pitre
to point out the obvious to me.  I can be so dense sometimes!  :)


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
