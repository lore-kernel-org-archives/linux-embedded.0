From: Marc Andre Tanner <mat@brain-dump.org>
Subject: Re: [PATCH 1/5] printk: introduce CONFIG_PRINTK_VERBOSITY
Date: Wed, 2 Sep 2009 19:32:49 +0200
Message-ID: <20090902173249.GB5811@debbook.brain-dump.org>
References: <1251901505-4313-1-git-send-email-mat@brain-dump.org>
 <1251901505-4313-2-git-send-email-mat@brain-dump.org>
 <4A9EA0D6.2030504@gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A9EA0D6.2030504@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: linux-embedded@vger.kernel.org

On Wed, Sep 02, 2009 at 06:44:06PM +0200, Marco Stornelli wrote:
> Marc Andre Tanner ha scritto:
> > Introduce a config option which allows to selectively compile out
> > printk messages based on a specified verbosity level.
> > 
> > Signed-off-by: Marc Andre Tanner <mat@brain-dump.org>
> > ---
> >  init/Kconfig |   29 +++++++++++++++++++++++++++++
> >  1 files changed, 29 insertions(+), 0 deletions(-)
> > 
> > diff --git a/init/Kconfig b/init/Kconfig
> > index 3f7e609..549ed95 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -833,6 +833,35 @@ config PRINTK
> >  	  very difficult to diagnose system problems, saying N here is
> >  	  strongly discouraged.
> >  
> > +config PRINTK_VERBOSITY
> > +	int "Printk compile time verbosity"
> > +	depends on EMBEDDED && PRINTK
> > +	range 0 7
> > +	default 0
> > +	help
> > +
> > +	  Select the maximum printk verbosity level to be compiled into
> > +	  the kernel.
> > +
> > + 	  Messages above the specified verbosity level are removed from
> > + 	  the kernel at compile time. This reduces the kernel image size
> > + 	  at the cost of a calmer kernel.
> > +
> > + 	  Possible verbosity levels are listed below. Note that messages
> > +	  without an explicit loglevel will be classified as KERN_WARNING.
> > +
> > +	   0  Disable this feature and compile all messages in.
> > +
> > + 	   1  KERN_ALERT        /* action must be taken immediately  */
> > + 	   2  KERN_CRIT         /* critical conditions               */
> > + 	   3  KERN_ERR          /* error conditions                  */
> > + 	   4  KERN_WARNING      /* warning conditions                */
> > + 	   5  KERN_NOTICE       /* normal but significant condition  */
> > + 	   6  KERN_INFO         /* informational                     */
> > + 	   7  KERN_DEBUG        /* debug-level messages              */
> > +
> > +	  If unsure, just move on and leave this option alone.
> > +
> >  config BUG
> >  	bool "BUG() support" if EMBEDDED
> >  	default y
> 
> If there are some problems to handle KERN_CONT you should say something
> here.

ACK.

> You should even add in cc: the kernel ML, however it seems a good
> work.

Well I first wanted to get some feedback from the embedded people.
I will probably send it to LKML after the 2.6.31 release, don't know
how the chances for inclusion are though.

Marc 

-- 
 Marc Andre Tanner >< http://www.brain-dump.org/ >< GPG key: CF7D56C0
