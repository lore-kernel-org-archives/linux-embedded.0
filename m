From: Kay Sievers <kay.sievers@vrfy.org>
Subject: Re: RFC: android logger feedback request
Date: Thu, 22 Dec 2011 03:34:16 +0100
Message-ID: <CAPXgP120iT_MiUgP96nqXtTHbNut7852f+4FKLYVZXVLZGJBug@mail.gmail.com>
References: <4EF264C3.6000104@am.sony.com> <20111221231956.GB23859@suse.de>
 <4EF27B85.9080801@am.sony.com> <20111222005114.GA22541@suse.de>
 <4EF288B4.1070601@am.sony.com> <20111222014718.GA13085@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrfy.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=I3ARZ290q3GpeOs9FVTAZKtxp3LZTl+eYrpqeepcdds=;
        b=M3YXQiPGAK3Lv5jy1VfSYDgs0gKqe0jmMIBNNtu4PLdT/qlf2kw4HVWSmSkKqAPE1U
         3vU3vKtJ9pPF6YV2fLuZW3zi6iB4TFNyy8NVcvFwzBjx0eHxVDl67QYGKbufGJrwPrWg
         /weuQ8QoyN79G+VUF/ca6h6biJd1zTUAVEEyk=
In-Reply-To: <20111222014718.GA13085@suse.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Greg KH <gregkh@suse.de>
Cc: Tim Bird <tim.bird@am.sony.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, john stultz <johnstul@us.ibm.com>, Brian Swetland <swetland@google.com>, Lennart Poettering <lennart@poettering.net>

On Thu, Dec 22, 2011 at 02:47, Greg KH <gregkh@suse.de> wrote:
> On Wed, Dec 21, 2011 at 05:32:36PM -0800, Tim Bird wrote:
>> On 12/21/2011 04:51 PM, Greg KH wrote:
>> > On Wed, Dec 21, 2011 at 04:36:21PM -0800, Tim Bird wrote:
>> >> On 12/21/2011 03:19 PM, Greg KH wrote:
>>
>> > Huh, I'm not talking about syslogd, I'm talking about the syslog(2=
)
>> > syscall we have.
>>
>> OK - switching gears. =C2=A0Since the kernel log buffer isn't normal=
ly
>> used to store use-space messages, I thought you were referring
>> to syslog(3) and the associated (logger(1) and syslogd(8)).
>
> The kernel log buffer has been storing userspace messages for a while
> now, look at your boot log on the latest Fedora and openSUSE releases
> (or any other distro using systemd for booting).

Right, and the kernel's printk buffer support numbered facilities,
like the syslog protocol defines, just fine.

Stuff injected into the kernel from userspace can easily distinguished
from kernel generated messages when pulled out by userspace.

We use that currently to do early boot logging, when no syslog is runni=
ng:
  http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux.git;a=3Dco=
mmitdiff;h=3D9d90c8d9cde929cbc575098e825d7c29d9f45054

Kay
