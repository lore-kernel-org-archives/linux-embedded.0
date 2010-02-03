From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PWM PATCH 1/5] API to consolidate PWM devices behind a common
 user and kernel interface
Date: Tue, 02 Feb 2010 22:12:01 -0600
Message-ID: <4B68F791.3040006@billgatliff.com>
References: <cover.1265094517.git.bgat@billgatliff.com> <c5873aa7c5d20254a9e54fc1ff179345b77c16b5.1265094517.git.bgat@billgatliff.com> <BD79186B4FD85F4B8E60E381CAEE1909020E99E1@mi8nycmail19.Mi8.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909020E99E1@mi8nycmail19.Mi8.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: H Hartley Sweeten <hartleys@visionengravers.com>
Cc: linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org

H Hartley Sweeten wrote:
>> +	for (wchan = 0; wchan < pwm->nchan; wchan++) {
>> +		if (pwm->channels[wchan].flags & FLAG_REQUESTED) {
>>     
>
> Shouldn't this be:
>
> 	& BIT(FLAG_REQUESTED)
>
>   

Yes.  I've fixed that one several times now!  I think I need to review
my git-fu, especially rebasing.

> Nitpick... Can you move the #ifndef/#define to after the comment?
>   

I did that in all the others, I guess I missed this one...


b.g.

-- 
Bill Gatliff
bgat@billgatliff.com

