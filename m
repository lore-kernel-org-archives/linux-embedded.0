From: David VomLehn <dvomlehn@cisco.com>
Subject: Re: [PATCH] [RFC] emit-crash-char: Allow diversion of printk	output
 for crash logging
Date: Mon, 11 Aug 2008 16:34:37 -0700
Message-ID: <48A0CC8D.3050302@cisco.com>
References: <489BAD5C.2080009@cisco.com> <1218210904.19162.144.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1218210904.19162.144.camel@localhost.localdomain>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=1633; t=1218497678; x=1219361678;
	c=relaxed/simple; s=sjdkim3002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn@cisco.com;
	z=From:=20David=20VomLehn=20<dvomlehn@cisco.com>
	|Subject:=20Re=3A=20[PATCH]=20[RFC]=20emit-crash-char=3A=20
	Allow=20diversion=20of=20printk=09output=0A=20for=20crash=20
	logging
	|Sender:=20;
	bh=VBzqaOLKhKLUaRCwJeLZ6SM+lXSvaD905D/7ab2pKZo=;
	b=Ja+2gW8LUkxOdrUDYRkiorxZ2hV712ZE4PSpmv5j2e/jC3PkEg+euZQVkq
	O5IaiuhBJHvKXBbKfS4OMTZjoVEmoPlhnYVS2N3Bd5CifiWvTMIbzLhdgQ2m
	vPQt6PoIrl;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Daniel Walker <dwalker@mvista.com>
Cc: linux-embedded@vger.kernel.org

Daniel Walker wrote:
> On Thu, 2008-08-07 at 19:20 -0700, David VomLehn wrote:
>> Allow diversion of characters generated through printk so that they can
>> be logged separately. The printk_time variables is made externally visible
>> so that functions processing the diverted characters can parse off the
>> time added if CONFIG_PRINTK_TIME is enabled.
> 
>> +
>>  static void emit_log_char(char c)
>>  {
>> +	emit_crash_char(c);
>> +
>>  	LOG_BUF(log_end) = c;
> 
> Isn't this duplicating the making of a custom console driver? I'm not a
> console expect, but I think you could have a console driver which
> catches this output and logs it..

Yes, you could, but this seems *so much* more straight-forward. Another option I 
considered was changing things so that the first level interface would simply 
output a character, possibly also passing some sort of context pointer. Then 
whatever was called by that interface could call a console driver, if 
appropriate. Even though I think this is really a cleaner way to do this, it also 
involves many more changes than I think are warranted just to get this little 
piece of functionality.

> Another note, usually when submitting new interfaces like this you
> should also submit the code that uses the interface .. In your case you
> might not be able to do that, but it could never be accepted without at
> least one user.

A highly valid criticism. I actually quoted your message to my management in 
order to underscore how important it is that Cisco becomes a good open source 
citizen. Personally, I view it as an absolute must.

> Daniel


