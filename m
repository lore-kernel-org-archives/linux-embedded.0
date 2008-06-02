From: Rob Landley <rob@landley.net>
Subject: Re: Fwd: Some embedded topics
Date: Sun, 1 Jun 2008 19:09:16 -0500
Message-ID: <200806011909.17326.rob@landley.net>
References: <483C83DE.3040604@cisco.com> <483D7355.5050803@coritel.it> <48407DE5.3000208@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48407DE5.3000208@am.sony.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Marco Stornelli <marco.stornelli@coritel.it>, Joe MacDonald <joe.macdonald@gmail.com>, linux-embedded@vger.kernel.org

On Friday 30 May 2008 17:21:25 Tim Bird wrote:
> Marco Stornelli wrote:
> > There's a MontaVista patent on PRAMFS and I think that most of times
> > when a company hears this thing it skips quickly this solution.
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

Yup.  Although IBM and Red Hat make this license explicit: you may use (at 
least some of) their patents in code licensed under the terms of GPLv2.  I 
don't know if MontaVista has an explicit license statement or not.

IBM licensed the RCU patents as a condition of the code getting merged into 
Linux, and Red Hat's patent policy is here:
http://www.redhat.com/legal/patent_policy.html

More recently, they all joined the "open invention network" which is a 
mutually assured destruction patent pool thingy:

http://www.ibm.com/news/us/en/2005/11/2005_11_10.html
http://arstechnica.com/news.ars/post/20070807-google-signs-on-with-open-invention-network.html

Beyond all that, there's a legal theory (as yet untested in court) that taking 
patent enforcement action against GPLv2 code is grounds for any copyright 
holder in the GPL project to terminate _your_ right to use that code, because 
it's a direction violation of GPLv2 clause 6 forbidding additional 
restrictions on recipients exercise of rights.  (Fairly straightforward 
argument, really.)

That hasn't been tested in court, and attempts to do so could easily drag on 
for quite a while.  The end result could easily be "nobody can legally 
distribute the version that violates the patent, including the patentholder" 
since GPLv2 is designed to break closed.

I neither know nor care about GPLv3.  (As with vogon grandmothers, "In brief: 
avoid.")

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
