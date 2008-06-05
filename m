From: Uwe Klein <uwe.klein@cruise.de>
Subject: Re: [PATCH] console - Add configurable support for console charset
 translation
Date: Thu, 05 Jun 2008 09:18:53 +0200
Message-ID: <4847935D.2070201@cruise.de>
References: <48447615.5050806@am.sony.com>	<20080604103353.GC27335@cs181133002.pp.htv.fi>	<4846E44A.1010601@am.sony.com>	<20080604191522.GA18873@uranus.ravnborg.org>	<4846EBAE.2000604@am.sony.com> <20080604202314.GG4189@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080604202314.GG4189@cs181133002.pp.htv.fi>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: Tim Bird <tim.bird@am.sony.com>, linux-tiny <Linux-tiny@selenic.com>, Sam Ravnborg <sam@ravnborg.org>, linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>

Adrian Bunk wrote:

 > I'm coming more from the point that drivers/media/ might be the area
 > in the kernel that currently offers the biggest flexibility - and this
 > stuff breaks multiple times for each kernel release, and sorting this
 > out is often nontrivial.

Only partially connected:
I have run into trouble in conjunction with the rtai patches
and the no_console option regularly over a couple of years.

compiling is ok linking breaks on afair on ?*pcspeaker*?
and some other symbols. reported it as a bug with rtai.

Due to time constraints I reactivated the console and moved on.

Imho  TINY setup and RT patches go together on a regular basis.
so some breakage goes beyond the kernel.

uwe

-- 
Uwe Klein [mailto:uwe.klein@cruise.de]
KLEIN MESSGERAETE Habertwedt 1
D-24376 Groedersby b. Kappeln, GERMANY
phone: +49 4642 920 123 FAX: +49 4642 920 125
