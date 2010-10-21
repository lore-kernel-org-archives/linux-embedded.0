From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PWM 01/10] API to consolidate PWM devices behind a common user
 and kernel interface
Date: Thu, 21 Oct 2010 08:18:06 -0500
Message-ID: <AANLkTinc=4ywuJxjayV5GiDAWUL=ZwpPUN4FEYRG-pFb@mail.gmail.com>
References: <1285946271-17728-1-git-send-email-bgat@billgatliff.com>
	<20101016074240.GC653@angua.secretlab.ca>
	<AANLkTikLnoAiZpZpA-aUPa3kSW7ZO=542wLgzFUqiL_4@mail.gmail.com>
	<20101020183435.GA12480@angua.secretlab.ca>
	<AANLkTik-stsHoEcpJkuszFxyrVPjvEy3iMNkovX_kzXe@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <AANLkTik-stsHoEcpJkuszFxyrVPjvEy3iMNkovX_kzXe@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-embedded@vger.kernel.org

Grant:


On Wed, Oct 20, 2010 at 2:32 PM, Bill Gatliff <bgat@billgatliff.com> wrote:
>> Yeah, by changing to using class attributes, a lot of this could end
>> up going away.
>
> Looking at that now, in fact.

Going to class device attributes did the trick.  Thanks for pointing
me in the right direction!


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
