From: David VomLehn <dvomlehn@cisco.com>
Subject: Re: [ANNOUNCE] udev 125 release
Date: Mon, 28 Jul 2008 18:53:43 -0700
Message-ID: <488E7827.7010106@cisco.com>
References: <488E515D.6000309@cisco.com> <20080728233224.GA27073@bongo.bofh.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080728233224.GA27073@bongo.bofh.it>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=2421; t=1217296429; x=1218160429;
	c=relaxed/simple; s=sjdkim2002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn@cisco.com;
	z=From:=20David=20VomLehn=20<dvomlehn@cisco.com>
	|Subject:=20Re=3A=20[ANNOUNCE]=20udev=20125=20release
	|Sender:=20;
	bh=+7REMlt8nZJotWEb1g9oy4rZ2fMnL0LZ9/ECwKWZYBo=;
	b=rCjUAls9gzO0IefCtpWsUQbmYI475a4QaPBnInRmNFF30Erc8V4dlbAh16
	lnC9S+PkqIcowhVeMX7EbSpKindtOhZefVvTH7MZxlqrGGnuqc7fGFEHmvM+
	6ql3vPYdq6;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marco d'Itri <md@Linux.IT>
Cc: linux-hotplug@vger.kernel.org, Linux Embedded Maillist <linux-embedded@vger.kernel.org>

Marco d'Itri wrote:
> On Jul 29, David VomLehn <dvomlehn@cisco.com> wrote:
> 
>> If I understand what is meant by "on-the-fly generated rules", these are 
>> not static and so don't belong under /etc. I think an FHS-conforming 
>> place for these would be under /var somewhere, such as /var/lib/udev. 
> /var may not be available yet when the files are needed, arguing to move
> them there is pointless.
> Also, they can be edited manually while /var data cannot.

I don't know of any problems with editing /var data manually, but your point 
about /var not being available early enough to run udev is certainly an important 
point to consider.

Note that embedded systems are not the only case where read-only root filesystems 
may arise. They are also used when your root filesystem is on a CDROM or DVD, or 
when you have a read-only root filesystem so you can network-mount it on multiple 
nodes. These cases influenced the Filesystem Hierarchy Standard people to make 
/etc read-only. So, I think  that using /etc for "on-the-fly" generated udev 
rules is an issue in a number of situations.

This looks like it might be a chicken-and-egg issue, where you may need to run 
udev in order to be able to mount a writable filesystem in which to store rules 
used by udev. I'm no expert on udev and what drove the need for this feature, but 
is it possible that you wouldn't need to generate rules *on-the-fly* until after 
mounting /var? If that were the case, you could still put the generated rules there.

Another possibility is simply to add a /var/lib/udev directory to the directories 
in which rules may reside. If you have a read-only root filesystem, you'll just 
have to mount /var before you can generate your own rules.




     - - - - -                              Cisco                            - - - - -         
This e-mail and any attachments may contain information which is confidential, 
proprietary, privileged or otherwise protected by law. The information is solely 
intended for the named addressee (or a person responsible for delivering it to 
the addressee). If you are not the intended recipient of this message, you are 
not authorized to read, print, retain, copy or disseminate this message or any 
part of it. If you have received this e-mail in error, please notify the sender 
immediately by return e-mail and delete it from your computer.
