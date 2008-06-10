From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Tue, 10 Jun 2008 15:29:11 +0100
Message-ID: <20080610142911.GA32696@shareable.org>
References: <87a5b0800806100647r178e54c0qd34cbf26f6ce24d@mail.gmail.com> <20080610140139.9817F2430C@gemini.denx.de>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080610140139.9817F2430C@gemini.denx.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfgang Denk <wd@denx.de>
Cc: Will Newton <will.newton@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Rob Landley <rob@landley.net>, Leon Woestenberg <leon.woestenberg@gmail.com>, linux-embedded@vger.kernel.org

Wolfgang Denk wrote:
> In message <87a5b0800806100647r178e54c0qd34cbf26f6ce24d@mail.gmail.com> you wrote:
> >
> > I would be surprised if it was possible to compile Linux with gcc 4.2
> > with 32MiB of total system memory.
> 
> Hint: if memory really gets tight, you can use swap space. Either  to
> a  local  drive  (either through PCI or PCMCIA/PCCard or USB or FW or
> ...), or over the network. This just adds  another  level  of  stress
> testing  to  areas in the kernel that are not so well covered by some
> other tests.

Great, I'm looking forward to your implementation of swap on no-MMU!

Thanks,
-- Jamie
