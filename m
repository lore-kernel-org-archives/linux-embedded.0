From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 05/10] AXFS: axfs_profiling.c
Date: Thu, 21 Aug 2008 07:55:34 -0700
Message-ID: <6934efce0808210755n1977e085o63b8b91e84575dc9@mail.gmail.com>
References: <48AD00F8.1030004@gmail.com> <48AD2AFF.5060609@de.ibm.com>
	 <1219308560.2988.247.camel@pmac.infradead.org>
	 <200808211339.37187.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=/Xhu9Ep/oHgBDjHuZPl1jGRwskHE4pUXnP2vy1kiw5E=;
        b=RhNrCpcxaz9sk4a+AmTpzvoeJtD+UCPE6atr8ddwbYTXg+Tsyxwcuk59TPo/XwZkfu
         JaIPEQA6ZOlA6jbmWcOJR8iYOwxOMGciYcDXQl9voLz6Qc2U2bcfZmWRVCu3c9YrjWMP
         6L3oOaBl62vj2YlIhxjr9otVdEpqgS1Z1KjJI=
In-Reply-To: <200808211339.37187.arnd@arndb.de>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw2@infradead.org>, carsteno@de.ibm.com, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, nickpiggin@yahoo.com.au

On Thu, Aug 21, 2008 at 4:39 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Thursday 21 August 2008, David Woodhouse wrote:
>> On Thu, 2008-08-21 at 10:44 +0200, Carsten Otte wrote:
>> >
>> > Exporting profiling data for a file system in another file system
>> > (/proc) seems not very straigtforward to me. I think it is worth
>> > considering to export this information via the same mount point.
>>
>> I would have said sysfs, rather than 'the same mount point'.
>>
>
> Let me throw in debugfs as my preferred option. sysfs is for stable
> interfaces, while profiling generally fits into the debugging category.

Three responses, three suggestions....

1) same mount point -
I don't see how this works without an ioctl.  I can't just make up
files in my mounted filesystem.   You expect the mounted version to
match input to the mkfs.  I'd not be happy with an ioctl.  You can
just read it.

2) sysfs -
I agree with Carsten, I don't see how this fits in the sysfs hierarchy.

3) debugfs -
I don't know diddly about this.

So why not /proc?
