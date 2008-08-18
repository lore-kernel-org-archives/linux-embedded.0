From: "Grant Likely" <grant.likely@secretlab.ca>
Subject: Re: embedded rootfs utility
Date: Mon, 18 Aug 2008 10:00:06 -0600
Message-ID: <fa686aa40808180900q730b921an64483d985793b33b@mail.gmail.com>
References: <488FCF7D.5010005@websterwood.com>
	 <Pine.LNX.4.64.0808061345080.28556@vixen.sonytel.be>
	 <489C7C69.5060209@websterwood.com>
	 <fa686aa40808132329k49dee24br1d5c83c0d90ea113@mail.gmail.com>
	 <48A442C2.2060309@websterwood.com>
	 <Pine.LNX.4.64.0808181328260.30933@vixen.sonytel.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0808181328260.30933@vixen.sonytel.be>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: Behan Webster <behanw@websterwood.com>, linux-embedded@vger.kernel.org

On Mon, Aug 18, 2008 at 5:30 AM, Geert Uytterhoeven
<Geert.Uytterhoeven@sonycom.com> wrote:
> On Thu, 14 Aug 2008, Behan Webster wrote:
>> Grant Likely wrote:
>> > On Fri, Aug 8, 2008 at 11:03 AM, Behan Webster <behanw@websterwood.com> wrote:
>> > Also, when booting on something like a 5200 with an uncommon serial
>> > ports name (ttyPSC0), I had to manually add the /dev/ttyPSC0 device
>> > file before it would boot.
>> >
>> You're using an older version then.  The latest (v1.2) allows you to
>> specify the serial port/baud rate when running the tool.
>
> Yep, it's a pity we cannot standardize on /dev/ttyS0 for the first serial
> port...

Indeed; but it could be potentially solved with a few udev rules.  I
should look into that...

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
