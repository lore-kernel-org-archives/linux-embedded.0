From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: RFC: android logger feedback request
Date: Wed, 21 Dec 2011 17:32:36 -0800
Message-ID: <4EF288B4.1070601@am.sony.com>
References: <4EF264C3.6000104@am.sony.com> <20111221231956.GB23859@suse.de> <4EF27B85.9080801@am.sony.com> <20111222005114.GA22541@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111222005114.GA22541@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg KH <gregkh@suse.de>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, john stultz <johnstul@us.ibm.com>, Brian Swetland <swetland@google.com>, Kay Sievers <kay.sievers@vrfy.org>, Lennart Poettering <lennart@poettering.net>

On 12/21/2011 04:51 PM, Greg KH wrote:
> On Wed, Dec 21, 2011 at 04:36:21PM -0800, Tim Bird wrote:
>> On 12/21/2011 03:19 PM, Greg KH wrote:

> Huh, I'm not talking about syslogd, I'm talking about the syslog(2)
> syscall we have.

OK - switching gears.  Since the kernel log buffer isn't normally
used to store use-space messages, I thought you were referring
to syslog(3) and the associated (logger(1) and syslogd(8)).

> This character interface seems very close to the syslog(2) api, but just
> done in a character interface, with ioctls, which also require userspace
> tools to manage properly, so I fail to see the big "gain" here.
> 
> What am I missing?

syslog(2) would more aptly be named klogctrl() (and it is in glibc)

There's currently no operation in sys_sylog (the kernel function
implementing syslog(2)) for writing to the log.  The write operation
to the kernel log buffer is also done via a character interface
/dev/kmsg (via code in drivers/char/mem.c)  This is actually very
similar to what the Android logger code does.

But while the kernel log buffer has lots of similarities to the Android logger
there are some key differences which I think are important to isolate
from a user-space logging system.

Here's a stream-of-consciousness dump of the differences:

The printk interface in the kernel is almost always automatically drained
to the device console, at the time of the printk (after the message is dropped
into the log buffer itself).  This extra operation is not needed for most
application-level messages that go into the log, and incurs extra overhead
in the log buffer code.

The printk code is especially designed to be called from within any kernel
context (including interrupt code), and so has some locking avoidance code
paths and complexity that are not needed for code which handles strictly
user-space messages.

Oddly enough, the printk code paths in the kernel can end up doing
a fair amount of print formatting, which can be time-consuming.  The code
path in kmsg_writev() contains at least one kmalloc, which could fail
when running out of memory.  The code path in the logger is much simpler,
consisting really of only a data copy.

Timestamping is not automatically appended to messages going into the
kernel log buffer (but they can be optionally pre-pended, with control
configurable at runtime).  They are represented
as ASCII text, which consumes a little more than twice the overhead of
a 32-bit binary field.  PID and TID are not automatically preserved in
the log. The kernel keeps it's priority in text also, and has no convention
for contextual tagging.  I'm not sure that we should change the
kernel log buffer to support structured binary data, in addition to the
free-form ASCII data that the kernel uses now.

The kernel log buffer does not support separate channels for different
classes of log messages (indeed, there is only one channel, and it has
kernel messages).  A new system call (or some backwards-compatible tweak
to the existing syslog(2) call would have to be added to support
a channel ID in order to support this.

There *are* some benefits to intermingling the kernel log messages and the
user-space log messages, but I think they are outweighed by the
value in keeping these systems separate.  There might be the opportunity
for code reuse, but I suspect we'd end up with about the same amount
of code increase overall (and possibly an additional syscall), and add
some unneeded complexity to the prink code path to accomplish it.

I just read Neil Brown's suggestion for doing this via a filesystem rather
than a char device, and it's interesting.  I'll respond to that separately.

 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Workgroup of the Linux Foundation
Senior Staff Engineer, Sony Network Entertainment
=============================
