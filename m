From: "Grant Likely" <grant.likely@secretlab.ca>
Subject: Re: embedded rootfs utility
Date: Thu, 14 Aug 2008 10:35:25 -0600
Message-ID: <fa686aa40808140935h666c2c7bt18e1ec6e53089f37@mail.gmail.com>
References: <488FCF7D.5010005@websterwood.com>
	 <Pine.LNX.4.64.0808061345080.28556@vixen.sonytel.be>
	 <489C7C69.5060209@websterwood.com>
	 <fa686aa40808132329k49dee24br1d5c83c0d90ea113@mail.gmail.com>
	 <48A442C2.2060309@websterwood.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48A442C2.2060309@websterwood.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Behan Webster <behanw@websterwood.com>
Cc: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, linux-embedded@vger.kernel.org

On Thu, Aug 14, 2008 at 8:35 AM, Behan Webster <behanw@websterwood.com> wrote:
> Grant Likely wrote:
>> Also, when booting on something like a 5200 with an uncommon serial
>> ports name (ttyPSC0), I had to manually add the /dev/ttyPSC0 device
>> file before it would boot.
>>
> You're using an older version then.  The latest (v1.2) allows you to
> specify the serial port/baud rate when running the tool.

Hmm, I can only find v1.1.2 on your website.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
