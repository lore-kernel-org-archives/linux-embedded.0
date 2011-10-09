From: Peter Waechtler <pwaechtler@mac.com>
Subject: Re: debugging multi threaded applicatiosn on arm - status?
Date: Sun, 9 Oct 2011 09:55:15 +0000 (UTC)
Message-ID: <loom.20111009T115000-485@post.gmane.org>
References: <20110617093927.GA28305@merkur.ravnborg.org> <4DFB4C8D.40208@2net.co.uk> <20110617153930.GA28570@merkur.ravnborg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Sam Ravnborg <sam <at> ravnborg.org> writes:
> 
> >> Is it possible to bebug multi-threaded applications using gdb on ARM these 
days?
> >>
> >
> > It works for me, using various ARM 926 and Cortex A8 chips and kernel  
> > versions from 2.6.27 to the present day. Which version of gbd do you  
> > have? gdb version 7.x works much better than 6.x in my experience.
> 
> We are using 6.8 - which may be the culprint.
> Does it work with NPTL too?
> 

Sam,

why don't you describe what's not working?

I guess you have a stripped libpthread and gdb isn't able to fetch
the thread infos via libthread_db.so.

On ARM you must not strip libpthread too much - see

http://sourceware.org/gdb/wiki/FAQ   question 6


  Peter



