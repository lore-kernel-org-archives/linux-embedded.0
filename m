From: "Grant Likely" <grant.likely@secretlab.ca>
Subject: Re: [PATCH] [RFC] emit-crash-char: Allow diversion of printk output for crash logging
Date: Tue, 12 Aug 2008 16:39:41 -0600
Message-ID: <fa686aa40808121539pc02a645n908500844c698bca@mail.gmail.com>
References: <489BAD5C.2080009@cisco.com>
	 <1218210904.19162.144.camel@localhost.localdomain>
	 <48A0CC8D.3050302@cisco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48A0CC8D.3050302@cisco.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David VomLehn <dvomlehn@cisco.com>
Cc: Daniel Walker <dwalker@mvista.com>, linux-embedded@vger.kernel.org

On Mon, Aug 11, 2008 at 5:34 PM, David VomLehn <dvomlehn@cisco.com> wrote:
>
> Daniel Walker wrote:
>>
>> On Thu, 2008-08-07 at 19:20 -0700, David VomLehn wrote:
>>>
>>> Allow diversion of characters generated through printk so that they can
>>> be logged separately. The printk_time variables is made externally visible
>>> so that functions processing the diverted characters can parse off the
>>> time added if CONFIG_PRINTK_TIME is enabled.
>>
>>> +
>>>  static void emit_log_char(char c)
>>>  {
>>> +       emit_crash_char(c);
>>> +
>>>        LOG_BUF(log_end) = c;
>>
>> Isn't this duplicating the making of a custom console driver? I'm not a
>> console expect, but I think you could have a console driver which
>> catches this output and logs it..
>
> Yes, you could, but this seems *so much* more straight-forward. Another option I
> considered was changing things so that the first level interface would simply output
> a character, possibly also passing some sort of context pointer. Then whatever was
> called by that interface could call a console driver, if appropriate. Even though I
> think this is really a cleaner way to do this, it also involves many more changes
> than I think are warranted just to get this little piece of functionality.

I'm not thrilled with this patch.  It seems so much more straight
forward in your special case, but it comes at the expense of making
the code path more complex in every other case.

I would much rather see this be done using the existing console driver
interface.  The only possible reason I could see wanting to do things
this way is if you don't trust the console code to call your console
driver, which I think is a pretty unlikely case.

g.

--
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
