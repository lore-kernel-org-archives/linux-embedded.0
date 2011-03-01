From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 5/5] KBUS source file
Date: Tue, 1 Mar 2011 06:42:32 +0100
Message-ID: <20110301054232.GA2331@merkur.ravnborg.org>
References: <cover.1298829754.git.tibs@tonyibbs.co.uk> <3CEFF9DA-16D6-43E1-A8A5-658EB1D426C7@tonyibbs.co.uk> <20110228192312.GA1832@merkur.ravnborg.org> <1425A0A7-D946-48BF-9CE0-C54D2FBF8C49@tonyibbs.co.uk>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425A0A7-D946-48BF-9CE0-C54D2FBF8C49@tonyibbs.co.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tony Ibbs <tibs@tonyibbs.co.uk>
Cc: Linux-embedded <linux-embedded@vger.kernel.org>, Tibs at Kynesim <tibs@kynesim.co.uk>, Richard Watts <rrw@kynesim.co.uk>, Grant Likely <grant.likely@secretlab.ca>

On Mon, Feb 28, 2011 at 10:25:41PM +0000, Tony Ibbs wrote:
> 
> On 28 Feb 2011, at 19:23, Sam Ravnborg wrote:
> 
> > You are using /proc/* to something that is not process related.
> > At lkml you will be requested to use something else.
> 
> OK. That's mainly through ignorance of what I *should* be using
> instead (and perhaps poor reading of Linux Device Drivers). Do you
> have an opinion on where such information should be going?
I think sysfs is the better place.
But my experience in this ares is limited.

> >> If there is a better way for me to submit this, please let me know.
> > 
> > One way you would not like....
> > Let the first patches introduce core-functionality and add features
> > in later patches - touching the same file many times.
> 
> Hmm. That's very sensible. Assuming I can figure out a sensible way
> to do it (which I assume is what you expected me to object).
It is a lot of work when you already have something that works.
But sometimes it helps to do so. I have previously done a complete
rewrite in the process (becuase my initial version was bad).

	Sam
