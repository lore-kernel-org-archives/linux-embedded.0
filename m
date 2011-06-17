From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: debugging multi threaded applicatiosn on arm - status?
Date: Fri, 17 Jun 2011 17:39:30 +0200
Message-ID: <20110617153930.GA28570@merkur.ravnborg.org>
References: <20110617093927.GA28305@merkur.ravnborg.org> <4DFB4C8D.40208@2net.co.uk>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4DFB4C8D.40208@2net.co.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: chris@2net.co.uk
Cc: linux-embedded@vger.kernel.org

>> Is it possible to bebug multi-threaded applications using gdb on ARM these days?
>>
>
> It works for me, using various ARM 926 and Cortex A8 chips and kernel  
> versions from 2.6.27 to the present day. Which version of gbd do you  
> have? gdb version 7.x works much better than 6.x in my experience.

We are using 6.8 - which may be the culprint.
Does it work with NPTL too?

	Sam
