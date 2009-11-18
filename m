From: Aras Vaichas <arasv@magellan-technology.com>
Subject: Re: [[RFC] 2/5] Emulates PWM hardware using a high-resolution timer 
	and a GPIO pin
Date: Thu, 19 Nov 2009 08:02:46 +1100
Message-ID: <ed62800911181302j7e1f22bera62b8846f29707fb@mail.gmail.com>
References: <1255984366-26952-1-git-send-email-bgat@billgatliff.com>
	 <1255984366-26952-2-git-send-email-bgat@billgatliff.com>
	 <1255984366-26952-3-git-send-email-bgat@billgatliff.com>
	 <200911170029.36669.david-b@pacbell.net>
	 <4B02C8AE.8050600@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4B02C8AE.8050600@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: David Brownell <david-b@pacbell.net>, linux-embedded@vger.kernel.org

2009/11/18 Bill Gatliff <bgat@billgatliff.com>
> The jitter can be quite low (100's of usecs) on a 200 MHz ARM9 chip, =
in
> fact, but you'll eat your battery alive if it's a portable device. =A0=
And
> the jitter will also destroy your waveform at high or low duty cycles=
=2E

I agree with both of you, and I have physically tested bit-banged PWM
with an LED, a servo and a speaker. In all cases the jitter is
immediately obvious. The LED flickers noticeably (it is a very good
candle effect and system load indicator), the speaker crackles with
the white(ish) noise of the jitter, and the servo becomes unuseable.

It's pretty easy to do some math to prove it. Assume 100usec jitter.

Say you want to run a speaker at 1kHz. You need a 50% duty cycle PWM
running at a 1ms period. 100usec is a 10% error on 1ms. Therefore the
frequency will shift by 10% or 100Hz. Frequency resolution of the
human ear is 0.36 Hz within the octave of 1,000=962,000 Hz so you will
notice a 100Hz shift. What you end up hearing is 1kHz + noise.  Look
at it musically, C6 is 1046Hz and D6 is 1174Hz. So a jump of about
130Hz is a full 2 semitones! Totally useless for playing any sort of
music or pleasant sounding warning tones.

Servo motors require a 1ms to 2ms pulse to hold a position between
about 0 and 180 degrees. A jitter of 100usec is physically equal to an
error of 100usec/1ms =3D 10% on the servo output arm which is equal to
10% x 180 degrees =3D 18degrees of positional error! It is alarming to
watch what happens as the CPU is loaded.

=46or non-commercial products these artifacts might be acceptable, but =
I
wouldn't use it for anything that a customer will comment on.

Aras
