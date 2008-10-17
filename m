From: "David P. Quigley" <dpquigl@tycho.nsa.gov>
Subject: Re: Subject: [PATCH 00/16] Squashfs: compressed read-only
	filesystem
Date: Fri, 17 Oct 2008 14:27:07 -0400
Message-ID: <1224268027.18940.78.camel@moss-terrapins.epoch.ncsc.mil>
References: <E1KqrTW-0001x8-3h@dylan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <E1KqrTW-0001x8-3h@dylan>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com

Looking through the code I see two references to xattrs, one is the
index of the xattr table in the superblock and there seems to be struct
member in one of the inode structures that is an index into this table.
Looking through the code I don't see either of these used at all. Do you
intend to add xattr support at some point? I saw reference to the desire
to add xattr support in an email from 2004 but you said that the code
has been rewritten since then. If you are going to add xattr support you
probably want to add it to more than just regular files. In SELinux and
other LSMs symlinks and directories are also labeled so they will need
xattr entries.

Dave

