From: Rob Landley <rob@landley.net>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Sun, 4 Jan 2009 14:19:11 -0600
Message-ID: <200901041419.11569.rob@landley.net>
References: <200901020207.30359.rob@landley.net> <200901031945.35163.rob@landley.net> <20090104080931.GA31198@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090104080931.GA31198@uranus.ravnborg.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>, Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>, linux-kernel@vger.kernel.org, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>

On Sunday 04 January 2009 02:09:31 Sam Ravnborg wrote:
> On Sat, Jan 03, 2009 at 07:45:34PM -0600, Rob Landley wrote:
> > Since you're turning down an existing patch in favor of a theoretical
> > patch, I assume you have plans to do this yourself?
>
> If noone else beats me I will do so - yes.

Ok.

> > >   And this must be in a single program that can process
> > >   all headers in one go so the install process becomes so fast
> > >   that we do not worry about if it was done before or not.
> > >   Then we can avoid all the .* files in the directory
> > >   where we isntall the headers.
> >
> > What if they run out of disk space halfway through writing a file and
> > thus it creates a short file (or a 0 length file where the dentry was
> > created but no blocks could be allocated for the write)?
>
> Then they fail and make will know. Then may leave a file or 100
> but it still failed. At next run everything will be done right
> assuming the culprint has been fixed.

Ok, so the important thing is propagating failures up to the exit code, then?

When making this patch I hit a problem that the exit code of "unifdef" seems 
to depend on whether it found anything to remove within the file it was 
processing, so when I changed the caller to actually care about its exit code 
it spontaneously aborted.

Fixing that probably does require changing unifdef.c.

> > I can try to make the shell version more readable, and more powerful. 
> > It's already noticeably faster than the perl version.  I have no
> > objections to making unifdef do all of this, I just haven't got any
> > interest either.
>
> I have no interest in merging a shell version.

*shrug*  Ok.  I await your C version, and have a workable patch meeting my own 
needs in the meantime.

Thanks,

Rob
