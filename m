From: Enrico Weigelt <weigelt@metux.de>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Fri, 13 Jun 2008 16:36:55 +0200
Message-ID: <20080613143655.GD11760@nibiru.local>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com> <200806111941.51221.rob@landley.net> <20080612182529.GB7423@nibiru.local> <485190E8.80705@cisco.com> <48519837.1090902@katalix.com> <8bd0f97a0806121446i68af3b96sbe51cc510f7d4fb6@mail.gmail.com> <20080612220246.GB27513@sovereign.org> <1213362895.13136.14.camel@samuelr.hq.netapp.com>
Reply-To: weigelt@metux.de
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1213362895.13136.14.camel@samuelr.hq.netapp.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

* Samuel Robb <sam@oneparticularharbor.net> schrieb:

> When you have a one- or two-line fix, and face Yet Another round of
> finding the right mailing list, identifying the right maintainers,
> figuring out the right way to submit a bug and a patch, and then have to
> spend the next 3 weeks explaining how no, you're not interested in being
> the PPC maintainer for libfoo... is it any wonder that developers (not
> to mention their management) eventually just gives up on the idea of
> "giving back to the community?"

ACK.

> One possible solution would be to provide a clearing house for these
> sorts of changes, maybe under the auspices of CELF or a similar
> organization.  Instead of submitting patches to individual projects,
> submit them to the clearing house, and let interested individuals either
> gather together and push related patches upstream in individual
> projects, or give project maintainers a place to go and find embedded
> systems patches related to their projects.

See my last mail: that's exactly what the oss-qm project is for:
http://oss-qm.metux.de/

With OSS-QM and related tools you often even don't need your own
patching infrastructure - oss-qm provides complete patches against
virtually any package/release.

Perhaps a few words on the infrastructure:

* single patches are collected per package, each vendor may get his
  own namespace/subdir, where he can feed in his patches.
* the single patches are automatically pulled together based on 
  "listfiles" - per package+release there is an simple text file 
  which just lists the single patches to be pulled together.
* each vendor may get it's own namespace for the listfiles.

In other words: if you fear somebody else breaks your already 
tested/approved packages, just use your own (listfile) namespace.


BTW: CSDB does a similar thing for retrieving source tarballs.
Just query the DB, never ever care about individual URLs in
you local build system. 


cu
-- 
---------------------------------------------------------------------
 Enrico Weigelt    ==   metux IT service - http://www.metux.de/
---------------------------------------------------------------------
 Please visit the OpenSource QM Taskforce:
 	http://wiki.metux.de/public/OpenSource_QM_Taskforce
 Patches / Fixes for a lot dozens of packages in dozens of versions:
	http://patches.metux.de/
---------------------------------------------------------------------
