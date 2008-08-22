From: Carsten Otte <cotte@de.ibm.com>
Subject: Re: [PATCH 05/10] AXFS: axfs_profiling.c
Date: Fri, 22 Aug 2008 09:26:31 +0200
Message-ID: <48AE6A27.9070103@de.ibm.com>
References: <48AD00F8.1030004@gmail.com> <200808211339.37187.arnd@arndb.de> <6934efce0808210755n1977e085o63b8b91e84575dc9@mail.gmail.com> <200808211706.37761.arnd@arndb.de> <6934efce0808210817h489bbeafyaf27217ca68bd31e@mail.gmail.com>
Reply-To: carsteno@de.ibm.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <6934efce0808210817h489bbeafyaf27217ca68bd31e@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jared Hulbert <jaredeh@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, David Woodhouse <dwmw2@infradead.org>, carsteno@de.ibm.com, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@logfs.org>

Jared Hulbert wrote:
>> The profiling code has certainly been useful to you during development,
>> and you should keep that code around for your own work on it,
>> but maybe you should not push that upstream, because regular users
>> are not going to need it.
> 
> Nope.  Profiling is absolutely fundamental to how AXFS works.  Read
> the [PATCH 00/10] thread again.
I agree, the profiling part is the sweet spot. Profiling should be in, 
probably even selectable at runtime as opposed to a config-switch. 
This way we could have it in enterprise distros that would'nt build 
another kernel image for this.
