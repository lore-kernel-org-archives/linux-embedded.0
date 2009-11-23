From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 0/6] Generic PWM API implementation
Date: Mon, 23 Nov 2009 10:40:28 -0700
Message-ID: <fa686aa40911230940y48f82007vaf9fc3385aaaef84@mail.gmail.com>
References: <cover.1224093510.git.bgat@billgatliff.com> <fa686aa40911131108o301efa1ew5c0ab31184aa7f75@mail.gmail.com> 
	<200911170027.38664.david-b@pacbell.net> <fa686aa40911201421k67d1de27u2c6dbe337989696b@mail.gmail.com> 
	<4B0A989B.3070403@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4B0A989B.3070403@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: David Brownell <david-b@pacbell.net>, linux-embedded@vger.kernel.org, Mike Frysinger <vapier.adi@gmail.com>

On Mon, Nov 23, 2009 at 7:13 AM, Bill Gatliff <bgat@billgatliff.com> wr=
ote:
> Grant Likely wrote:
>>
>> But that *isn't* the primary purpose of the GPIO subsystem. =A0All t=
hat
>> stuff is layered on top of the GPIO pin management code and doesn't
>> really play into this debate.
>>
>
> I don't understand you. =A0You are saying that the majority of gpioch=
ip
> implementations also deal with pin multiplexing? =A0They must be terr=
ibly
> broken on the platforms I'm working on, then, because they don't seem=
 to
> work at all! =A0:)

Nope.  pin mux is a different problem.  I'm talking about the code to
register pin controller drivers and for users to obtain a reference to
a pin.

g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
