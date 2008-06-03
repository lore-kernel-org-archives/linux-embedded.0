From: Marco Stornelli <marco.stornelli@coritel.it>
Subject: Re: Fwd: Some embedded topics
Date: Tue, 03 Jun 2008 10:32:28 +0200
Message-ID: <4845019C.1050305@coritel.it>
References: <483C83DE.3040604@cisco.com>	 <8bd0f97a0805271527i622a31b8t68ba24c80a2e034a@mail.gmail.com>	 <20080527223142.GU26837@email.mot.com>	 <8bd0f97a0805271535w267be51fq669def9aa424e4e7@mail.gmail.com>	 <840404080805280740q4486f377x49c106e20d9f5dc2@mail.gmail.com> <840404080805280744t351da73fk885fa7b29c05659c@mail.gmail.com> <483D7355.5050803@coritel.it> <48407DE5.3000208@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48407DE5.3000208@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tim Bird <tim.bird@am.sony.com>, rob@landley.net
Cc: linux-embedded@vger.kernel.org

Tim Bird ha scritto:
> Marco Stornelli wrote:
>> There's a MontaVista patent on PRAMFS and I think that most of times 
>> when a company hears this thing it skips quickly this solution.
> 
> Hmmm.  I don't recall anything about a patent on PRAMFS.
> 
> There are lots of issues here, but I think it's OK to use.
> At a minimum,  MontaVista's PRAMFS was submitted to the CE Linux Forum
> in an older kernel (2.4.20-based).  MontaVista was well-aware
> of this submission (although it did not come directly from them).
> MV was under an IP agreement with CELF which required them to
> disclose such patents to the forum, and none was received.
> 
> In any event (and without wanting to start a large off-topic legal
> thread here), some lawyers would interpret the knowing publication
> of an implementation embodying a patent under the GPL to be an
> implicit license of use for the patent.
> 
> YMMV. IANAL.  Seek your own counsel on this.
> 
>> Sometimes ago I sent a porting to 2.6.24, but I didn't receive any 
>> response.
> 
> I'd love to see this.  Did this go to LKML?  If so, about when?
> (Alternatively, could you make it available somewhere?)
> 
> Thanks,
>  -- Tim
> 
> =============================
> Tim Bird
> Architecture Group Chair, CE Linux Forum
> Senior Staff Engineer, Sony Corporation of America
> =============================
> 
> 
 From MontaVista site:

"...File system designed by MontaVista Software for embedded systems - 
MontaVista has a patent pending on this code, but is licensing the 
patent freely for use in GPL software."

I agree with you Tom and Rob but I meant that especially for a little 
company only reading "patent pending" can be dread, and you know that 
legal arguments can be long and expensive.

About my patch, I sent an email to Steve Longerbeam on March because I 
read his name on the pramfs sourceforge project page. Now I haven't the 
patch anymore, however the latest patch is for 2.6.10 and the porting to 
2.6.24 was easy because there weren't a lot of differences.

Regards.

-- 
Marco Stornelli
Embedded Software Engineer
CoRiTeL - Consorzio di Ricerca sulle Telecomunicazioni
http://www.coritel.it

marco.stornelli@coritel.it
+39 06 72582838
