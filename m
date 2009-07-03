From: Jonathan Cameron <jic23@cam.ac.uk>
Subject: Re: need help finding a WiFi + BT SDIO chipset/module for Linux
Date: Fri, 03 Jul 2009 17:02:51 +0000
Message-ID: <4A4E39BB.10300@cam.ac.uk>
References: <ed62800907021823t2518700cv3710d3aa46371369@mail.gmail.com> <ed62800907022017v4756c909n12f4105ee6e35f1d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <ed62800907022017v4756c909n12f4105ee6e35f1d@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Aras Vaichas <arasv@magellan-technology.com>
Cc: linux-embedded@vger.kernel.org

Aras Vaichas wrote:
> On Fri, Jul 3, 2009 at 11:23 AM, Aras
> Vaichas<arasv@magellan-technology.com> wrote:
>> Hi,
>>
>> can someone point me in the right direction to choose an OEM WiFI +
>> Bluetooth chipset/module suitable for an embedded Linux system? I'd
>> prefer if it was connected via SDIO.
> 
> Sorry to answer my own question.
> 
> This article sums it up pretty well with what I've found so far.
> 
> http://bec-systems.com/site/90/the-embedded-wifi-module-quest
> 
> The two main contenders seem to be Marvell and Atheros for SDIO OEM modules.
That's about right. Unless things have changed recently, the support for
the atheros 6000 series chips isn't good.  There are a couple of
drivers out there, but I've never gotten anything to work with the board
we have.  I know the openmoko guys were working on this.

Marvell drivers are in kernel and work well so that's what we
went with. 

