From: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Wed, 28 May 2008 16:52:47 -0500
Message-ID: <200805281652.47558.rob@landley.net>
References: <1209577322.25560.402.camel@pmac.infradead.org> <87bq3rgq40.fsf@basil.nowhere.org> <1209582709.25560.441.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1209582709.25560.441.camel-ZP4jZrcIevRpWr+L1FloEB2eb7JE58TQ@public.gmane.org>
Content-Disposition: inline
Sender: linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wednesday 30 April 2008 14:11:49 David Woodhouse wrote:
> > There are simply already far too many of them and they make the
> > kernel harder and harder to change.
>
> I agree. And if we do want to pay attention to pure code size, there are
> other approaches -- like --gc-sections and/or building with '--combine
> -fwhole-program' which I was playing with for OLPC a while back. I must
> dust that off now that the GCC fixes should mostly have made it into
> current distributions.

I like simplicity.  I like _simple_.  Half my attraction to embedded systems 
is that they're simpler than big desktop systems where you have to figure out 
how udev interacts with dbus to figure out why knetworkmanager convinced 
Konqueror that your network doesn't exist when you can wget from the command 
line just fine...

I submitted a patch to remove the use of perl to build the linux kernel (which 
HPA added in 2.6.25) not because it affected the result, but because it 
unnecessarily complicates the build system.  (And perl tends to metasticize.  
Nothing says "maintainability" like perl...)

Yes, Perl was used for some debugging tools before, things like the 
check-patch script.  But until 2.6.25 you never needed Perl to configure and 
build a kernel...

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
--
To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
