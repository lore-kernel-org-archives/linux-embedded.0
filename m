From: Bruno Wolff III <bruno@wolff.to>
Subject: Re: [PATCH 0/9] Squashfs: Add support for LZMA compressed filesystems
Date: Mon, 21 Dec 2009 17:56:04 -0600
Message-ID: <20091221235604.GA20459@wolff.to>
References: <E1NHZ6K-00029J-Sw@dylan.lougher.demon.co.uk>
 <20091221231645.GA32141@wolff.to>
 <4B300912.5060905@lougher.demon.co.uk>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4B300912.5060905@lougher.demon.co.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, phillip.lougher@gmail.com, tim.bird@am.sony.com

On Mon, Dec 21, 2009 at 23:47:30 +0000,
  Phillip Lougher <phillip@lougher.demon.co.uk> wrote:
> Bruno Wolff III wrote:
> >On Mon, Dec 07, 2009 at 08:37:48 +0000,
> >  Phillip Lougher <phillip@lougher.demon.co.uk> wrote:
> >>Hi,
> >>
> >>The following patches add LZMA decompression support to Squashfs, using the
> >>in-kernel LZMA decompression library.
> >
> >Do these still have a chance to make 2.6.33?
> >
> 
> It's very unlikely.  Andrew wanted it to spend a cycle in linux-next.  I'll then
> try for 2.6.34 merge.  I'm happy with that.

I hadn't seen it show up there yet either. But maybe its a bit too early
for that. If it gets there I might have a chance of convincing one of
the Fedora kernel guys of back porting it, since F13 is likely to be released
with the 2,6,34 kernel in any case. (Along with some actual numbers for
our live iso images to show it's important to have. But I can get those
using the devel version of squashfs without the kernel changes.)
I'll keep an eye out for it showing up in linux-next. Thanks for the update.
