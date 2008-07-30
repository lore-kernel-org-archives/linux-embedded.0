From: "Bart Van Assche" <bart.vanassche@gmail.com>
Subject: Re: prevalence of C++ in embedded linux?
Date: Wed, 30 Jul 2008 06:46:59 +0200
Message-ID: <e2e108260807292146n581b655an3119be9e33af871c@mail.gmail.com>
References: <alpine.LFD.1.10.0807281142430.4286@localhost.localdomain>
	 <200807290951.34563.neundorf@eit.uni-kl.de>
	 <1217319612.24988.15.camel@spike.firmix.at>
	 <200807291058.06240.neundorf@eit.uni-kl.de>
	 <1217324838.24988.41.camel@spike.firmix.at>
	 <556445368AFA1C438794ABDA8901891C092D3CF7@USA0300MS03.na.xerox.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=G5IVTvlsEkpDzMxRozc3nW33bpn3o8K3XhbTZE+XIKg=;
        b=rn5b7j8NbDFCwrXFgx0Pe7LBTw7mgEiTLtvfITail5Z1gOgFzFbdlVDvBfCrL7Rh2I
         gfhKvoXU5B9vLmHJjZCCe2YbmXmHcb8Fg61EdkHhIQhtI0ZvuPW5wB1dEBGefTikKTYS
         by/Lku0RG1agQLG99WmDjzs1YVcWeSNILSaDk=
In-Reply-To: <556445368AFA1C438794ABDA8901891C092D3CF7@USA0300MS03.na.xerox.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Leisner, Martin" <Martin.Leisner@xerox.com>
Cc: Bernd Petrovitsch <bernd@firmix.at>, Alexander Neundorf <neundorf@eit.uni-kl.de>, linux-embedded@vger.kernel.org

On Tue, Jul 29, 2008 at 10:08 PM, Leisner, Martin
<Martin.Leisner@xerox.com> wrote:
> If you're embedded device has a window system, than a language like C++
> is fine...But...

C++ is suited for much more than just windowing systems. A good
example is the GOLD project, a linker for ELF files. GOLD is a rewrite
of the GNU linker (ld). See also
http://google-opensource.blogspot.com/2008/04/gold-google-releases-new-and-improved.html.

Bart.
