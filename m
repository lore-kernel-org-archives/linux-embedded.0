From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 0/6] Generic PWM API implementation
Date: Fri, 20 Nov 2009 15:51:47 -0700
Message-ID: <fa686aa40911201451q55dd101bh1953a19f71434f40@mail.gmail.com>
References: <cover.1224093510.git.bgat@billgatliff.com> <200911162347.02364.david-b@pacbell.net> 
	<4B02C5CF.2050102@billgatliff.com> <200911170853.17994.david-b@pacbell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200911170853.17994.david-b@pacbell.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Brownell <david-b@pacbell.net>
Cc: Bill Gatliff <bgat@billgatliff.com>, Mike Frysinger <vapier.adi@gmail.com>, linux-embedded@vger.kernel.org

On Tue, Nov 17, 2009 at 9:53 AM, David Brownell <david-b@pacbell.net> w=
rote:
> On Tuesday 17 November 2009, Bill Gatliff wrote:
>> David Brownell wrote:
>> >
>> > It'd be purely for pinmux.
>> >
>>
>> Ugh. =A0That would be a tough interface to design.
>
> True. =A0That's part of why I object to wanting to combine
> it with GPIOs ... or, combine everything else with GPIOs
> too (like PWMs).
>
> But Grant talks about wanting such things, and if he can
> deliver it, more power to him.

Just to be clear, I'm *not* talking about pin mux.  I fully agree that
is a different problem.

g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
