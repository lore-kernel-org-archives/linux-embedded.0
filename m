From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: /dev/fw major not constant (embedded mdev devtmpfs ieee1394)
Date: Thu, 21 Jan 2010 16:21:26 -0500
Message-ID: <8bd0f97a1001211321t4aea0ee0q8e0e253be2eff65a@mail.gmail.com>
References: <4B58BF6A.6070303@fnac.net> <20100121205711.GA29455@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux1394-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20100121205711.GA29455@kroah.com>
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/linux1394-devel>, 
	<mailto:linux1394-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux1394-devel>
List-Post: <mailto:linux1394-devel@lists.sourceforge.net>
List-Help: <mailto:linux1394-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux1394-devel>, 
	<mailto:linux1394-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: linux1394-devel-bounces@lists.sourceforge.net
To: Greg KH <greg@kroah.com>
Cc: linux-embedded@vger.kernel.org, busybox@busybox.net, libdc1394-devel@lists.sourceforge.net, linux-hotplug@vger.kernel.org, Paul Chavent <paul.chavent@fnac.net>, linux1394-devel@lists.sourceforge.net

On Thu, Jan 21, 2010 at 15:57, Greg KH wrote:
> On Thu, Jan 21, 2010 at 09:56:10PM +0100, Paul Chavent wrote:
>> I'am working on an embedded gnu/linux system that allow to capture an ieee1394 stream.
>>
>> The system is compound of a kernel, a basic initrd (libc,libgcc,busybox,libdc1394,...) and my app.
>>
>> I use the new firewire stack.
>>
>> As my system is very minimalist, i tought to create the nodes in /dev at the moment of building my initrd.
>>
>> But when i needed to modify my kernel configuration, it has changed the major number of /dev/fw*.
>>
>> It's not really important for the definitive system (it will be
>> freeze), but i wonder how to solve this issue for my future works ?
>>
>> I don't need hotplug, i just need to fill /dev at startup (coldplug).
>> The target is an embedded device, so it should be easy to
>> build/configure/install, and lightweight.
>>
>> For those reasons i don't want to use udev.
>
> Why, is udev somehow not "lightweight"?

in comparison, it is absolutely not
-mike

------------------------------------------------------------------------------
Throughout its 18-year history, RSA Conference consistently attracts the
world's best and brightest in the field, creating opportunities for Conference
attendees to learn about information security's most important issues through
interactions with peers, luminaries and emerging and established companies.
http://p.sf.net/sfu/rsaconf-dev2dev
