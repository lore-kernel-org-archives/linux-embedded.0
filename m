From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PWM PATCH 1/7] API to consolidate PWM devices behind a common
 user and kernel interface
Date: Tue, 09 Feb 2010 22:18:32 -0600
Message-ID: <4B723398.70806@billgatliff.com>
References: <cover.1265748263.git.bgat@billgatliff.com> <b7afd475c3fce08f459bceff7814de57ffce7bd0.1265748264.git.bgat@billgatliff.com> <BD79186B4FD85F4B8E60E381CAEE190902153279@mi8nycmail19.Mi8.com> <4B723239.4090802@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4B723239.4090802@billgatliff.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: H Hartley Sweeten <hartleys@visionengravers.com>
Cc: linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org

Bill Gatliff wrote:
>>> +
>>> +	p->requester = requester;
>>> +	if (!strcmp(requester, REQUEST_SYSFS))
>>> +		p->pid = current->pid;
>>>     
>>>       
>> This is new.. What's the reason for saving the pid?
>>   
>>     
>
> I've gotten complaints from those who say, "Ok, so it reported 'sysfs'
> back to me, but how can I be sure that it's because *I* own it now, and
> not another user process?"  Seemed easy enough to add the PID so they
> can check.  Of course, you could argue that I could report just the PID,
> and skip the "sysfs" string altogether.  I'd be inclined to agree with you.
>
> Of course, if you are like me and do the request with cat(1), then the
> PID is pretty meaningless.  :)
>   

For the record, this request activity is mostly advisory.  I can't
actually implement something where only the requester is subsequently
allowed to manipulate the state of the channel.  You really wouldn't
want to even if it was possible, because then you'd probably lose the
ability to control the output using cat(1) and echo(1).

I'm just trying to provide a tool that allows users to Play Nice if they
choose to.  In fact, it's currently possible to manipulate the state of
the channel from userspace without requesting ownership first.  Not sure
I'm happy with that, but since I can't enforce any sort of access
restrictions it seems pointless to even go so far as to require ownership...


b.g.

-- 
Bill Gatliff
Embedded systems training and consulting
http://billgatliff.com
bgat@billgatliff.com
