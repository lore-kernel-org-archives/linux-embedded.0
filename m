From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: Subject: [PATCH 12/16] Squashfs: header files
Date: Tue, 21 Oct 2008 19:17:30 +0100
Message-ID: <48FE1CBA.8080805@lougher.demon.co.uk>
References: <E1KqrTX-0001y4-JE@dylan> <1224606318.31157.80.camel@moss-terrapins.epoch.ncsc.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1224606318.31157.80.camel@moss-terrapins.epoch.ncsc.mil>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "David P. Quigley" <dpquigl@tycho.nsa.gov>
Cc: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com

David P. Quigley wrote:

> 
> Something that seems weird is the inconsistency in the ordering of these
> structs. The base part is the same across all inodes but for your
> reg/lreg dir/ldir pairs you seem to shuffle the order of the added
> parts. Is there a reason for this? Is their layout the same on disk
> (baring the extra data in the l versions)? If so they probably should be
> the same in the struct.
> 
> 

They're deliberately shuffled about to eliminate holes (due to alignment 
contraints), and to maximise compression.  Shifting to cluster similar 
fields can get better compression, and the current layout is the result 
of a lot of work to to get the best ordering.

For example:

 >> +struct squashfs_reg_inode {
 >> +	__le16			inode_type;
 >> +	__le16			mode;
 >> +	__le16			uid;
 >> +	__le16			guid;
 >> +	__le32			mtime;
 >> +	__le32	 		inode_number;
 >> +	__le32			start_block;
 >> +	__le32			fragment;
 >> +	__le32			offset;
 >> +	__le32			file_size;
 >> +	__le16			block_list[0];
 >> +};

Inode_number, start_block, fragment clustered together because in most 
filesystems they'll contain a lot of zero bits (filesystems mainly being 
small).  Better compression.

 >> +
 >> +struct squashfs_lreg_inode {
 >> +	__le16			inode_type;
 >> +	__le16			mode;
 >> +	__le16			uid;
 >> +	__le16			guid;
 >> +	__le32			mtime;
 >> +	__le32	 		inode_number;
 >> +	__le64			start_block;
 >> +	__le64			file_size;
 >> +	__le64			sparse;
 >> +	__le32			nlink;
 >> +	__le32			fragment;
 >> +	__le32			offset;
 >> +	__le32			xattr;
 >> +	__le16			block_list[0];
 >> +};

Start_block, file_size have been doubled, and the fragment field 
consequently moved to preserve 64-bit alignment constraints on 64-bit 
quantities (no holes).  Plus moving fragment means it can be grouped 
with the new nlink field giving a nice run of zero bits (non-extended 
regular files have an implicit nlink of 1).
