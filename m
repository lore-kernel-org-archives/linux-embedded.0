From: Christoph Hellwig <hch@infradead.org>
Subject: Re: Subject: [PATCH 01/16] Squashfs: inode operations
Date: Wed, 22 Oct 2008 04:48:13 -0400
Message-ID: <20081022084813.GA1740@infradead.org>
References: <E1KqrTW-0001xC-9M@dylan> <20081017165300.GA8076@logfs.org> <1224605666.31157.71.camel@moss-terrapins.epoch.ncsc.mil>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1224605666.31157.71.camel@moss-terrapins.epoch.ncsc.mil>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David P. Quigley" <dpquigl@tycho.nsa.gov>
Cc: J?rn Engel <joern@logfs.org>, Phillip Lougher <phillip@lougher.demon.co.uk>, akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com

On Tue, Oct 21, 2008 at 12:14:26PM -0400, David P. Quigley wrote:
> I looked at where filesystems such as ext3 store these and it seems to
> be in include/linux. I'm assuming this is because usespace utilities
> like fsck need them. It seems wrong for userspace tools to have their
> own private copy since you can potentially have them out of sync with
> the kernel you are running and it provides more chance for you
> forgetting to update a structure somewhere. 

All modern filesystems have it in their directories, and ext3 will have
that soon too.  The only thing that should go into include/linux are
defintions for ioctls if you have them.  It is absolutely intention that
the tools can get out of sync with the kernel, because that actually
keeps them compiling when you update things in the kernel - note that
a single on disk format can be represented by lots of different things
in C, and for various reaosons those can change once in a while in the
kernel.  It also allows you to actually compile the tools on a system
that doesn't have new enough kernel headers yet (e.g. debian
autobuilders) or even run the tools on various platforms that have no
or different kernel implementations.

