From: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: YAFFS in the kernel tree?
Date: Thu, 29 May 2008 01:00:31 +0300
Message-ID: <1212012031.2236.43.camel@shinybook.infradead.org>
References: <200805290859.54396.manningc2@actrix.gen.nz>
	 <8bd0f97a0805281424g2ceae455x774e8d66aba4ec2b@mail.gmail.com>
	 <200805290934.28232.manningc2@actrix.gen.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200805290934.28232.manningc2-jEEI2ySEPisjAXWc8ALWsQ@public.gmane.org>
Sender: linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Charles Manning <manningc2-jEEI2ySEPisjAXWc8ALWsQ@public.gmane.org>
Cc: Mike Frysinger <vapier.adi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, 2008-05-29 at 09:34 +1200, Charles Manning wrote:
> The main reason for those version checks is that YAFFS tries to acknowledge 
> that not everyone just uses the latest kernel. Many embedded developers are 
> using older kernels (for various valid reasons) 

The only vaguely valid reason I've ever heard is that they've already
been through QA and are shipping a product based on the old kernel, and
now they need some minor bug fixes. Even for a more serious product
update adding new features, it should be able to switch to a newer
kernel unless you've made some horrendous mistakes in the original
deployment, like not getting everything you use merged upstream.

And still -- if they choose to use an ancient and known-broken version
of the rest of the kernel, why would they want to combine that with the
newest, shiniest version of YAFFS? It just doesn't make sense.

I used to keep JFFS2 building for older kernels; I don't for a moment
regret abandoning that effort. Far from being helpful, I actually think
it was counter-productive, because it made people think that was a
_sane_ thing for them to be doing. It just isn't.

> I would expect that this would make for two versions of yaffs_fs.c:
> the CVS one for all comers and the in-tree version which is cleaned.

It's not even that hard to maintain those in parallel with a modern
version control system like git, pulling changes from one tree to the
other. We export JFFS2 for use in eCos that way.

-- 
dwmw2

--
To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
