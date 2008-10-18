From: Marco <marco.stornelli@coritel.it>
Subject: Re: Power cut in management
Date: Sat, 18 Oct 2008 18:01:21 +0200
Message-ID: <48FA0851.4010209@coritel.it>
References: <4917.79.37.233.237.1224328849.squirrel@nausicaa2.coritel.it> <20081018114910.GA29345@shareable.org> <1224331493.6770.1360.camel@macbook.infradead.org> <20081018125621.GA30391@shareable.org> <1224336683.6770.1364.camel@macbook.infradead.org> <20081018133801.GA30897@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20081018133801.GA30897@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jamie Lokier <jamie@shareable.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org

Jamie Lokier ha scritto:
> David Woodhouse wrote:
>> On Sat, 2008-10-18 at 13:56 +0100, Jamie Lokier wrote:
>>> Trouble is, that's not suitable for a dashboard unit where users pl=
ug
>>> in their own media card.
>>>
>>> Marco didn't say if the SD card is for users to plug in their own
>>> media, or if it's internal storage for the device.
>> True, but the situation is different for a removable card. Firstly, =
it's
>> unlikely to be mission-critical; the device will still operate witho=
ut
>> it. Secondly, even the most na=EFve of users knows that these things=
 are
>> disposable.
>>
>> It's different if you're building a black box around them, with one =
of
>> these things inside.
>=20
> I agree, this is very good advice.
>=20
> -- Jamie
>=20
Thank you very much for your response. The sdcard, however, it's for th=
e
user so I haven't control on it, I think probably it will be FAT. Jamie
you said to manage the situation with an interrupt, I agree. My first
plan was (more or less) to have an application in user space that it
checks the interrupt (UIO driver ?) and simulates a console command to
do a clean shutdown. Then in the kernel routine I do something to cut
the power definitely. For my environment (about the time) it's possible
even in relation with the "emergency power". The only problem is: what
happens if before I install the irq handler the user turn off the
system? I mean I can't "loose" the interrupt. In this case it'd be like
a spurious interrupt from system point view. Let me know if I'm wrong.
Thanks.
