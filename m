From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: Subject: [PATCH 00/16] Squashfs: compressed read-only	filesystem
Date: Tue, 21 Oct 2008 02:21:44 +0100
Message-ID: <48FD2EA8.2020300@lougher.demon.co.uk>
References: <E1KqrTW-0001x8-3h@dylan> <1224268027.18940.78.camel@moss-terrapins.epoch.ncsc.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <1224268027.18940.78.camel@moss-terrapins.epoch.ncsc.mil>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "David P. Quigley" <dpquigl@tycho.nsa.gov>
Cc: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com

David P. Quigley wrote:
  In SELinux and
> other LSMs symlinks and directories are also labeled so they will need
> xattr entries.

BTW you don't mention device, fifo and socket inodes...  Do they ever 
get labelled?  It's something I was going to look into closer to an 
implementation, but it would be interesting to know.

Phillip

> 
> Dave
> 
> 

