From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] [RFC] emit-crash-char: Allow diversion of printk
	output for crash logging
Date: Tue, 12 Aug 2008 20:12:12 -0600
Message-ID: <20080813021212.GA17587@secretlab.ca>
References: <489BAD5C.2080009@cisco.com> <1218210904.19162.144.camel@localhost.localdomain> <48A0CC8D.3050302@cisco.com> <fa686aa40808121539pc02a645n908500844c698bca@mail.gmail.com> <48A2394E.8030500@cisco.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <48A2394E.8030500@cisco.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David VomLehn <dvomlehn@cisco.com>
Cc: Daniel Walker <dwalker@mvista.com>, linux-embedded@vger.kernel.org

On Tue, Aug 12, 2008 at 06:30:54PM -0700, David VomLehn wrote:
> Grant Likely wrote:
>
>> I'm not thrilled with this patch.  It seems so much more straight
>> forward in your special case, but it comes at the expense of making
>> the code path more complex in every other case.
>>
>> I would much rather see this be done using the existing console driver
>> interface.  The only possible reason I could see wanting to do things
>> this way is if you don't trust the console code to call your console
>> driver, which I think is a pretty unlikely case.
>
> I'll buy that reasoning.
>
> Regardless of implementation, it seems to me that it could be of use for 
> some other embedded platforms. Any suggestions as to where it should go 
> in the tree? drivers/char? drivers/misc?

Depends on what you're storing to.  Can you send more details about the
specific use case that you will use this interface for?

g.
