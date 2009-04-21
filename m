From: Chuck Lever <chuck.lever-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [ltt-dev] [PATCH] nfs: add support for splice writes
Date: Tue, 21 Apr 2009 14:48:14 -0400
Message-ID: <1CCD753F-86BC-4C8D-96CC-FD3B67370B1F@oracle.com>
References: <49D45974.2060202@suse.de> <20090402063235.GB24846@Krystal> <49D45E42.3050502@suse.de> <91e0b5050904020542l6b38d7a6hab6d7ef8b4593425@mail.gmail.com> <49EC0A83.8060802@suse.de> <1240230224.8073.6.camel@heimdal.trondhjem.org> <49EC6CB3.8080800@suse.de> <1240237274.13636.9.camel@heimdal.trondhjem.org> <49EC990B.1030007@suse.de>  <20090421144810.GA7036@infradead.org> <1240335302.5390.20.camel@heimdal.trondhjem.org>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Transfer-Encoding: 7bit
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1240335302.5390.20.camel-rJ7iovZKK19ZJLDQqaL3InhyD016LWXt@public.gmane.org>
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: Trond Myklebust <trond.myklebust-41N18TsMXrtuMpJDpNschA@public.gmane.org>
Cc: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Suresh Jayaraman <sjayaraman-l3A5Bk7waGM@public.gmane.org>, Masahiro Tamori <masahiro.tamori-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mathieu Desnoyers <compudj-vdFpqfd5riKZ9vWoFJJngh2eb7JE58TQ@public.gmane.org>, linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ltt-dev-33AaDErTWvBVxDZ2/Zk0YoryAYyacSEB@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>

On Apr 21, 2009, at 1:35 PM, Trond Myklebust wrote:
> On Tue, 2009-04-21 at 10:48 -0400, Christoph Hellwig wrote:
>> On Mon, Apr 20, 2009 at 09:17:23PM +0530, Suresh Jayaraman wrote:
>>> +static ssize_t nfs_file_splice_write(struct pipe_inode_info *pipe,
>>> +				     struct file *filp, loff_t *ppos,
>>> +				     size_t count, unsigned int flags)
>>> +{
>>> +	struct dentry *dentry = filp->f_path.dentry;
>>> +
>>> +	dprintk("NFS splice_write(%s/%s, %lu@%Lu)\n",
>>> +		dentry->d_parent->d_name.name, dentry->d_name.name,
>>> +		(unsigned long) count, (unsigned long long) *ppos);
>>> +
>>> +	return generic_file_splice_write(pipe, filp, ppos, count, flags);
>>> +}
>>> +
>>
>> You need all calls from nfs_file_write, too:
>>
>> - most importantly the nfs_revalidate_file_size for O_APPEND
>
> Isn't O_APPEND illegal for splice_write()? It looks like it is from a
> quick perusal of do_splice_from().
>
>> - the nfs_do_fsync for sync writes
>
> generic_file_splice_write() calls generic_osync_inode(), which should
> ensure sync writes even with NFS.
> The one thing it won't do is propagate NFS write errors back to the
> caller. If we do care about this, then we should certainly test for
> nfs_need_sync_write() and then call nfs_do_fsync() (see
> nfs_file_write()).
>
>> - probably the stats increment
>
> We should talk to Chuck about this.

I don't know much about the characteristics of splice writes, so you  
can do one of two things:

1.  Create a separate BYTESWRITTEN counter for these
2.  Lump them into NORMALBYTESWRITTEN if these are effectively cached  
writes.

--
Chuck Lever
chuck[dot]lever[at]oracle[dot]com
--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
