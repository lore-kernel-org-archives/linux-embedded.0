From: Behan Webster <behanw@websterwood.com>
Subject: Re: embedded rootfs utility
Date: Thu, 14 Aug 2008 15:20:22 -0400
Message-ID: <48A48576.5060601@websterwood.com>
References: <488FCF7D.5010005@websterwood.com>	 <Pine.LNX.4.64.0808061345080.28556@vixen.sonytel.be>	 <489C7C69.5060209@websterwood.com>	 <fa686aa40808132329k49dee24br1d5c83c0d90ea113@mail.gmail.com>	 <48A442C2.2060309@websterwood.com> <fa686aa40808140935h666c2c7bt18e1ec6e53089f37@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <fa686aa40808140935h666c2c7bt18e1ec6e53089f37@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, linux-embedded@vger.kernel.org

Grant Likely wrote:
> On Thu, Aug 14, 2008 at 8:35 AM, Behan Webster <behanw@websterwood.com> wrote:
>   
>> Grant Likely wrote:
>>     
>>> Also, when booting on something like a 5200 with an uncommon serial
>>> ports name (ttyPSC0), I had to manually add the /dev/ttyPSC0 device
>>> file before it would boot.
>>>
>>>       
>> You're using an older version then.  The latest (v1.2) allows you to
>> specify the serial port/baud rate when running the tool.
>>     
>
> Hmm, I can only find v1.1.2 on your website.
>   
Version 1.1.2 of elbs contains v1.2 of the rootfs tool.  I suppose I
should Sync the version numbers on a release.

-- 
Behan Webster
behanw@websterwood.com
