From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: Recommendation for activating a deferred module init in the kernel
Date: Tue, 17 Jun 2008 12:55:31 -0700
Message-ID: <485816B3.3080800@am.sony.com>
References: <48580116.9070504@am.sony.com> <20080617190750.GA31224@logfs.org> <485815F6.20507@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <485815F6.20507@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@logfs.org>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

Tim Bird wrote:
>> If you want an explicit trigger, you could either hook into init_post()
>> or have hooks in the open functions of drivers with deferred
>> initialization.
> 
> This would presumably require multiple calls (one to the open of
> each deferred module).  I would still need a trigger for the memory
> free operation, unless I hardcode the order of the opening and just
> "know" that the last one should free the memory.  I'll have to see
> if all the modules being loaded like this have open()s.

Sorry - I responded too quickly.  I'm not sure I follow the
original suggestion.  How would I call the open function of
a module that is not initialized yet?
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================

