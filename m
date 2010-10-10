From: Michael Opdenacker <michael.opdenacker@free-electrons.com>
Subject: Re: logfs segfaults at umount time
Date: Sun, 10 Oct 2010 21:06:16 +0200
Message-ID: <4CB20EA8.4050205@free-electrons.com>
References: <4CB1E5B3.1090300@free-electrons.com> <20101010171633.5E90C14F310@gemini.denx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20101010171633.5E90C14F310@gemini.denx.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Wolfgang Denk <wd@denx.de>
Cc: joern@logfs.org, logfs@logfs.org, linux-embedded mailing list <linux-embedded@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>

Hi Wolfgang,

On 10/10/2010 07:16 PM, Wolfgang Denk wrote:
> Dear Michael,
>
> In message <4CB1E5B3.1090300@free-electrons.com> you wrote:
>> root@calao:~# mount -t logfs /dev/mtdblock0 /mnt/flash/
>> root@calao:~# cp -rf /fs/8m/* /mnt/flash/
>> eth0: TX underrun, resetting buffers
>> eth0: TX underrun, resetting buffers
>>     
> Seems you have some problems here already?
>   
I don't think they are related. My rootfs in on NFS, and these happen
all the time on these at91 boards, causing no problem with the other
filesystems.

Cheers,

Michael.

-- 
Michael Opdenacker, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
+ 33 621 604 642
