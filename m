From: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: RFC: direct MTD support for SquashFS
Date: Tue, 16 Mar 2010 15:26:33 +0100
Message-ID: <87ljdsibqe.fsf@macbook.be.48ers.dk>
References: <87vdcwv139.fsf@tac.ki.iif.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:references:date:in-reply-to:message-id:user-agent
	:mime-version:content-type;
	bh=JERSZ2UFhFvBBXeiIYa8bN1JEF0YZEZtBRwGV5WX29Y=;
	b=MdrqRLgxE96VYDUYKKikHgOvWyuVfhmz7m7hJx5urSwSM8+Mer0NHUl7tawVw4UBFc
	1y89VfvibFIKYwbc0ALDE1WoVAVa5fhjAS8BNDseMHAdnmgBQoeVxKkV6YV6mMppS1Fd
	nlN5yqDEFZa7lQDVVOXPKkcUtEHB805xQeQrM=
In-Reply-To: <87vdcwv139.fsf@tac.ki.iif.hu> (Ferenc Wagner's message of "Tue, 
	16 Mar 2010 14:38:02 +0100")
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Ferenc Wagner <wferi@niif.hu>
Cc: Phillip Lougher <phillip@lougher.demon.co.uk>, linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

>>>>> "Ferenc" == Ferenc Wagner <wferi@niif.hu> writes:

 Ferenc> Hi,

 Ferenc> In embedded systems, SquashFS over MTD would be a considerable
 Ferenc> win, as that would permit configuring without CONFIG_BLOCK.
 Ferenc> Please find attached a naive patch against 2.6.33 for this.  It
 Ferenc> does not handle bad MTD blocks, that could be handled by gluebi
 Ferenc> (once you're willing to take the UBI overhead), or by a custom
 Ferenc> solution later.

 Ferenc> For now, 2.6.34 gained pluggable decompressors, so this patch
 Ferenc> does not apply anymore, though the main idea holds.  My
 Ferenc> questions: is the community interested in integrating something
 Ferenc> like this, should this patch transformed into something
 Ferenc> acceptable, or am I a total lunatic?  I don't know a thing
 Ferenc> about filesystem development, but willing to learn and
 Ferenc> refactor.  Comments welcome.

Nice, I have been thinking about that as well. What kind of size savings
are you getting with this?

CC'ing linux-embedded as this might be of interest there as well.

-- 
Bye, Peter Korsgaard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
